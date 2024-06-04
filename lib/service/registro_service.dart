import 'package:intl/intl.dart';
import 'package:sindromemetabolica_fase2/model/baseDados.dart';
import 'package:sindromemetabolica_fase2/model/registro.dart';
import 'package:sindromemetabolica_fase2/providers/variaveis_provider.dart';
import 'package:sindromemetabolica_fase2/utils/utils.dart';

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
      iav: Utils.calculaIAV(variaveis.iav, variaveis.ca, variaveis.peso, variaveis.altura, variaveis.triglicerides, variaveis.hdl),
      risco: Utils.calculaProbabilidadeIAV(variaveis.ca, variaveis.altura, variaveis.alcool, variaveis.fumante, variaveis.ipaq, variaveis.fase, variaveis.triglicerides, variaveis.hdl, variaveis.peso)
    );
    var inserido = await BaseDados.instance.insertRegistro(reg);
    return (inserido > 0 ? true : false);
  }
}