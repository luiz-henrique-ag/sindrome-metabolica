import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sindromemetabolica_fase2/providers/variaveis_provider.dart';
import 'package:sindromemetabolica_fase2/utils/utils.dart';
import 'package:sindromemetabolica_fase2/widgets/layout.dart';

class BriResultadoScreen extends StatelessWidget {
  const BriResultadoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var variaveis = context.watch<VariaveisProvider>();
    return Layout(
      title: 'Body Roundness Index (BRI)',
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
                'Probabilidade',
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
                '${Utils.calculaProbabilidadeBRI(variaveis.ca, variaveis.altura, variaveis.alcool, variaveis.fumante, variaveis.ipaq, variaveis.fase).toStringAsFixed(2)} %',
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            const Padding(
              padding:
                  EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 20),
              child: Text(
                'Valores de probabilidade acima de 50% indicam chances de ocorrência de Síndrome Metabólica.',
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 20, bottom: 20),
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
                      child: const Text(
                        'Voltar', 
                        style: TextStyle(
                          color: Colors.black
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
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
                    onPressed: () {
                      Navigator.pushNamed(context, '/iav');
                    },
                    child: const Text(
                      'Continuar',
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
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
