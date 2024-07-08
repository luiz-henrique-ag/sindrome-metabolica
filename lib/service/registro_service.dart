import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sindromemetabolica_fase2/model/baseDados.dart';
import 'package:sindromemetabolica_fase2/model/registro.dart';
import 'package:sindromemetabolica_fase2/providers/variaveis_provider.dart';
import 'package:sindromemetabolica_fase2/utils/utils.dart';
import 'package:sindromemetabolica_fase2/model/db_firestore.dart';

class RegistroService {
  static Future<bool> inserirRegistro(VariaveisProvider variaveis) async {
    Registro reg = Registro(
        data: DateFormat('yyyy-MM-dd').format(DateTime.now()),
        hora: DateFormat('h:mm a').format(DateTime.now()),
        altura: variaveis.altura,
        ca: variaveis.ca,
        fumante: variaveis.fumante,
        alcool: variaveis.alcool,
        faseClimaterio: variaveis.fase,
        praticaAF: variaveis.ipaq,
        bri: Utils.calculaBRI(variaveis.ca, variaveis.altura),
        iav: Utils.calculaIAV(variaveis.iav, variaveis.ca, variaveis.peso,
            variaveis.altura, variaveis.triglicerides, variaveis.hdl),
        risco: Utils.calculaProbabilidadeIAV(
            variaveis.ca,
            variaveis.altura,
            variaveis.alcool,
            variaveis.fumante,
            variaveis.ipaq,
            variaveis.fase,
            variaveis.triglicerides,
            variaveis.hdl,
            variaveis.peso));
    
    try {
      var inserido = await BaseDados.instance.insertRegistro(reg);

      if (inserido > 0) {
        FirebaseFirestore db = await DBFirestore.instance.databaseFB;
        await db.collection('registros').add(reg.toMap());
        print("Registro adicionado ao Firestore com sucesso!");
      } else {
        print("Falha ao inserir registro no banco de dados local.");
      }
      return (inserido > 0 ? true : false);
    } catch (e) {
      print("Erro ao adicionar registro ao Firestore: $e");
      return false;
    }
  }
}
