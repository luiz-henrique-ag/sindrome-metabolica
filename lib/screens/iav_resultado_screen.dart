import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sindromemetabolica_fase2/providers/variaveis_provider.dart';
import 'package:sindromemetabolica_fase2/service/registro_service.dart';
import 'package:sindromemetabolica_fase2/utils/utils.dart';
import 'package:sindromemetabolica_fase2/widgets/layout.dart';

class IavResultadoScreen extends StatelessWidget {
  const IavResultadoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var variaveis = context.read<VariaveisProvider>();
    return Layout(
      title: 'Índice de Adiposidade Visceral (IAV)',
      child: Center(
          child: SingleChildScrollView(
              child: Container(
        color: Colors.white,
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding:
                  EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 20),
              child: Text(
                // 'IAV: ' + estado.iav.toStringAsFixed(2),
                'IAV: ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFFCC33CC),
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 40, right: 40, top: 20, bottom: 20),
              child: Text(
                '${Utils.calculaProbabilidadeIAV(variaveis.ca, variaveis.altura, variaveis.alcool, variaveis.fumante, variaveis.ipaq, variaveis.fase, variaveis.triglicerides, variaveis.hdl, variaveis.peso).toStringAsFixed(2)}%',
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            const Padding(
              padding:
                  EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 20),
              child: Text(
                'A porcentagem acima indica probabilidade de ocorrência de Síndrome metabólica.',
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 60, right: 60, top: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide.none,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.popUntil(context, ModalRoute.withName('/rsm'));
                    },
                    child: const Text(
                      'Repetir',
                      style: TextStyle(
                        color: Colors.black
                      ),
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          const WidgetStatePropertyAll(Color(0xFF662D91)),
                      overlayColor:
                          const WidgetStatePropertyAll(Color(0xFF662D91)),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide.none,
                        ),
                      ),
                    ),
                    child: const Text(
                      'Finalizar',
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    onPressed: () async {
                      Navigator.popUntil(context, ModalRoute.withName('/'));
                      var inserido = await RegistroService.inserirRegistro(variaveis);
                      if(inserido){
                        print("Inserido");
                      }
                      else{
                        print("Erro");
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ))),
    );
  }
}
