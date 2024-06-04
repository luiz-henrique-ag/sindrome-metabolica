import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sindromemetabolica_fase2/providers/variaveis_provider.dart';
import 'package:sindromemetabolica_fase2/widgets/layout.dart';
import 'package:sindromemetabolica_fase2/widgets/navigation_bottom_bar.dart';

class PrincipalScreen extends StatelessWidget {
  const PrincipalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: 'Principal',
      navigationBar: const NavigationBottomBar(),
      child: Center(
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding:
                const EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 10),
              child: Image.asset(
                'assets/climatmedlogo3.png',
              )
            ),
            const Padding(
              padding: EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 5),
              child: Text(
                'Boas-Vindas',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            const Padding(
              padding:
                  EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 10),
              child: Text(
                'O climatério provoca importantes repercussões à saúde da mulher, dentre as '
                'quais destaca-se o aumento da probabilidade de desenvolvimento da síndrome '
                'metabólica. O IAV (Índice de Adiposidade Visceral), CA (Circunferência Abdominal) '
                'e o BRI (Body Roundness Index) são medidas antropométricas de baixo custo '
                'que podem ser utilizadas na identificação de mulheres climatéricas com '
                'predisposição a desenvolverem a síndrome metabólica, possibilitando, dessa '
                'maneira, intervenção precoce para prevenção da instalação ou progressão de '
                'doenças crônicas cardiovasculares.\n\n'
                'Este aplicativo tem como objetivo auxiliar no cuidado às mulheres climatéricas, '
                'em especial às assistidas pela Estratégia saúde da Família, através do cálculo '
                'do IAV, CA e BRI pelos profissionais da saúde. ',
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 40, right: 40, top: 20, bottom: 20),
              child: ElevatedButton(
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
                  Navigator.pushNamed(context, '/rsm');
                  context.read<VariaveisProvider>().limpaCampos();
                },
                child: const Text(
                  'Iniciar',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
