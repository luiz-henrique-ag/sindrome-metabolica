import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sindromemetabolica_fase2/providers/variaveis_provider.dart';
import 'package:sindromemetabolica_fase2/utils/utils.dart';
import 'package:sindromemetabolica_fase2/widgets/layout.dart';

class BriScreen extends StatefulWidget {
  const BriScreen({super.key});

  @override
  State<BriScreen> createState() => _BriScreenState();
}

class _BriScreenState extends State<BriScreen> {
  TextEditingController caController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  @override
  void dispose() {
    caController.dispose();
    alturaController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    var variaveis = context.read<VariaveisProvider>();
    if (variaveis.ca != 0) {
      caController.text = variaveis.ca.toString();
    }
    if (variaveis.altura != 0) {
      alturaController.text = variaveis.altura.toString();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int caAtual = context.watch<VariaveisProvider>().ca;
    int alturaAtual = context.watch<VariaveisProvider>().altura;

    String retornaCalculo() {
      var calculo = Utils.calculaBRI(caAtual, alturaAtual).toStringAsFixed(2);
      if (calculo != 'NaN') {
        return calculo;
      } else {
        return '-';
      }
    }

    return Layout(
      title: 'Body Roundness Index (BRI)',
      child: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding:
                    EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 5),
                child: Image.asset(
                  'assets/iconeaba1.png',
                  height: 60,
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
                    TextField(
                      controller: caController,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        int? caNumber = int.tryParse(value);
                        if (caNumber != null) {
                          context.read<VariaveisProvider>().set(ca: caNumber);
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Valor em centímetros',
                        hintStyle: const TextStyle(color: Colors.black26),
                        // errorText:
                        //     estado.validaCA ? null : 'Forneça um valor para CA.',
                        labelText: "CA",
                        labelStyle: const TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 20,
                            color: Color(0xFF808080)),
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(),
                        ),
                      ),
                      style: const TextStyle(
                        fontFamily: "Poppins",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: alturaController,
                      onChanged: (value) {
                        int? altura = int.tryParse(value);
                        if (altura != null) {
                          context.read<VariaveisProvider>().set(altura: altura);
                        }
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Valor em centímetros',
                        hintStyle: const TextStyle(color: Colors.black26),
                        // errorText: estado.validaAltura
                        //     ? null
                        //     : 'Forneça um valor para Altura.',
                        labelText: "Altura",
                        labelStyle: const TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 20,
                            color: Color(0xFF808080)),
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(),
                        ),
                        //fillColor: Colors.green
                      ),
                      style: const TextStyle(
                        fontFamily: "Poppins",
                      ),
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(
                  left: 40, right: 40, top: 20, bottom: 20),
              child: Text(
                // 'BRI: ' + estado.briLabel,
                'BRI: ${retornaCalculo()}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Color(0xFFCC33CC),
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
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
                    onPressed: () {
                      Navigator.pushNamed(context, '/bri_resultado');
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
            )
          ],
        ),
      )),
    );
  }
}
