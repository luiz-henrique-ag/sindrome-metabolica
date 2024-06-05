import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sindromemetabolica_fase2/providers/variaveis_provider.dart';
import 'package:sindromemetabolica_fase2/widgets/layout.dart';

class RsmScreen extends StatelessWidget {
  const RsmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: 'Risco de Síndrome Metabólica',
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding:
                      EdgeInsets.only(left: 40, right: 40, top: 5, bottom: 5),
                  child: Image.asset(
                    'assets/iconeaba2.png',
                    height: 80,
                  )),
              Padding(
                  padding: const EdgeInsets.only(
                      left: 60, right: 60, top: 20, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('Preencha os campos abaixo:'),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text('Fase do Climatério:'),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        // dropdown below..
                        child: DropdownButton<String>(
                            isDense: true,
                            value: context.watch<VariaveisProvider>().fase,
                            icon: const Icon(Icons.arrow_drop_down),
                            iconSize: 42,
                            isExpanded: true,
                            iconEnabledColor: const Color(0xFF662D91),
                            underline: const SizedBox(),
                            onChanged: (value) {
                              context
                                  .read<VariaveisProvider>()
                                  .set(fase: value);
                            },
                            items: <String>['Pré-Menopausa', 'Pós-Menopausa']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList()),
                      ),
                      Wrap(
                        children: [
                          const Text('Prática de Atividade Física:'),
                          TextButton.icon(
                              icon: const Icon(
                                Icons.assignment,
                                size: 20,
                              ),
                              label: const Text('IPAQ'),
                              onPressed: () {
                                Navigator.pushNamed(context, '/ipaq');
                              })
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),

                        // dropdown below..
                        child: DropdownButton<String>(
                            isDense: true,
                            value: context.watch<VariaveisProvider>().ipaq,
                            icon: const Icon(Icons.arrow_drop_down),
                            iconSize: 42,
                            isExpanded: true,
                            iconEnabledColor: const Color(0xFF662D91),
                            underline: const SizedBox(),
                            onChanged: (value) {
                              context
                                  .read<VariaveisProvider>()
                                  .set(ipaq: value);
                            },
                            items: <String>['Ativa', 'Irregular', 'Sedentária']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList()),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Consome álcool ?'),
                          Row(
                            children: [
                              const Text('Não'),
                              Switch(
                                  value:
                                      context.watch<VariaveisProvider>().alcool,
                                  onChanged: (value) {
                                    context
                                        .read<VariaveisProvider>()
                                        .set(alcool: value);
                                  }),
                              const Text('Sim'),
                            ],
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Fumante ?'),
                          Row(
                            children: [
                              const Text('Não'),
                              Switch(
                                  value: context
                                      .watch<VariaveisProvider>()
                                      .fumante,
                                  onChanged: (value) {
                                    context
                                        .read<VariaveisProvider>()
                                        .set(fumante: value);
                                  }),
                              const Text('Sim'),
                            ],
                          )
                        ],
                      ),
                    ],
                  )),
              const SizedBox(
                height: 20,
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
                      child: const Text(
                        'Continuar', 
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/bri');
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
