import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sindromemetabolica_fase2/providers/variaveis_provider.dart';
import 'package:sindromemetabolica_fase2/widgets/layout.dart';

class IavScreen extends StatefulWidget {
  const IavScreen({super.key});

  @override
  State<IavScreen> createState() => _IavScreenState();
}

class _IavScreenState extends State<IavScreen> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController trigliceridesController = TextEditingController();
  TextEditingController hdlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: 'Índice de Adiposidade Visceral (IAV)',
      child: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding:
                    const EdgeInsets.only(left: 40, right: 40, top: 5, bottom: 5),
                child: Image.asset(
                  'assets/iconeaba3.png',
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
                    TextFormField(
                      // controller: estado.CAContrl,
                      initialValue:
                          context.read<VariaveisProvider>().ca.toString(),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        enabled: false,
                        isDense: true,
                        hintText: 'Valor em centímetros',
                        hintStyle: const TextStyle(color: Colors.black26),
                        //errorText:
                        //    estado.validaCA ? null : 'Forneça um valor para CA.',
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
                        //fillColor: Colors.green
                      ),
                      style: const TextStyle(
                        fontFamily: "Poppins",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      initialValue:
                          context.read<VariaveisProvider>().altura.toString(),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        enabled: false,
                        isDense: true,
                        hintText: 'Valor em centímetros',
                        hintStyle: const TextStyle(color: Colors.black26),
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
                      ),
                      style: const TextStyle(
                        fontFamily: "Poppins",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: pesoController,
                      onChanged: (value) {
                        double? peso = double.tryParse(value);
                        if (peso != null) {
                          context.read<VariaveisProvider>().set(peso: peso);
                        }
                      },
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: "Peso",
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
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      style: const TextStyle(
                        fontFamily: "Poppins",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: trigliceridesController,
                      onChanged: (value) {
                        int? triglicerides = int.tryParse(value);
                        if (triglicerides != null) {
                          context
                              .read<VariaveisProvider>()
                              .set(triglicerides: triglicerides);
                        }
                      },
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: "Triglicérides",
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
                      keyboardType: const TextInputType.numberWithOptions(
                          decimal: false, signed: false),
                      style: const TextStyle(
                        fontFamily: "Poppins",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: hdlController,
                      onChanged: (value) {
                        int? hdl = int.tryParse(value);
                        if (hdl != null) {
                          context.read<VariaveisProvider>().set(hdl: hdl);
                        }
                      },
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: "HDL",
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
                      keyboardType: const TextInputType.numberWithOptions(
                          decimal: true, signed: false),
                      style: const TextStyle(
                        fontFamily: "Poppins",
                      ),
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
                    //padding: EdgeInsets.only(left: 80, right: 80, top: 10, bottom: 10),
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
                      Navigator.pushNamed(context, '/iav_resultado');
                    },
                    //padding: EdgeInsets.only(left: 80, right: 80, top: 10, bottom: 10),
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
