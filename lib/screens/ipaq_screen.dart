import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:sindromemetabolica_fase2/providers/variaveis_provider.dart';

class IpaqScreen extends StatefulWidget {
  const IpaqScreen({super.key});

  @override
  State<IpaqScreen> createState() => _IpaqScreenState();
}

class _IpaqScreenState extends State<IpaqScreen> {
  final TextEditingController _q1a = TextEditingController();
  final TextEditingController _q1b = TextEditingController();
  final TextEditingController _q2a = TextEditingController();
  final TextEditingController _q2b = TextEditingController();
  final TextEditingController _q3a = TextEditingController();
  final TextEditingController _q3b = TextEditingController();
  final TextEditingController _q4a = TextEditingController();
  final TextEditingController _q4b = TextEditingController();

  bool _validateQ1a = false;
  bool _validateQ1b = false;
  bool _validateQ2a = false;
  bool _validateQ2b = false;
  bool _validateQ3a = false;
  bool _validateQ3b = false;
  bool _validateQ4a = false;
  bool _validateQ4b = false;

  String _status = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
    _q1a.dispose();
    _q1b.dispose();
    _q2a.dispose();
    _q2b.dispose();
    _q3a.dispose();
    _q3b.dispose();
    _q4a.dispose();
    _q4b.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text('IPAQ Versão Curta'),
            bottomOpacity: 0.8,
            backgroundColor: const Color(0xFF662D91),
          ),
          body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                            top: 20, right: 10, left: 10, bottom: 10),
                        child: Text(
                          'Para responder as perguntas pense somente nas atividades que você realiza por '
                          'pelo menos 10 minutos contínuos de cada vez.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                            top: 10, right: 40, left: 40, bottom: 40),
                        child: Row(
                          children: [
                            Icon(
                              Icons.assignment,
                              color: Colors.deepPurple,
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                  'Clique no ícone em cada campo para \nabrir o texto da questão.'),
                            )
                          ],
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 150,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: _q1a,
                              onChanged: (_) =>
                                  _validaCampo(_q1a, _validateQ1a),
                              onEditingComplete: () =>
                                  _validaCampo(_q1a, _validateQ1a),
                              decoration: InputDecoration(
                                  filled: true,
                                  isDense: true,
                                  labelText: '1a',
                                  hintText: 'Ex.: 5',
                                  helperText: 'Dias por semana',
                                  helperMaxLines: 2,
                                  hintStyle: const TextStyle(fontSize: 12),
                                  errorText: _validateQ1a ? 'Inválido' : null,
                                  border: const OutlineInputBorder(),
                                  prefixIcon: IconButton(
                                    icon: const Icon(
                                      Icons.assignment,
                                      color: Colors.deepPurple,
                                    ),
                                    onPressed: () => showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10.0))),
                                              title: const Text('Questão 1a'),
                                              content: const Text(
                                                  "Em quantos dias da última semana você CAMINHOU por pelo menos 10"
                                                  "minutos contínuos em casa ou no trabalho, como forma de transporte para ir de um"
                                                  "lugar para outro, por lazer, por prazer ou como forma de exercício?"),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: const Text('Ok'),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                )
                                              ],
                                            )),
                                  )),
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: _q1b,
                              onChanged: (_) =>
                                  _validaCampo(_q1b, _validateQ1b),
                              decoration: InputDecoration(
                                  isDense: true,
                                  labelText: '1b',
                                  hintText: 'Ex.: 60',
                                  filled: true,
                                  hintStyle: const TextStyle(fontSize: 12),
                                  helperText: 'Tempo em minutos',
                                  errorText: _validateQ1b ? 'Inválido' : null,
                                  border: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(style: BorderStyle.solid)),
                                  prefixIcon: IconButton(
                                    icon: const Icon(
                                      Icons.assignment,
                                      color: Colors.deepPurple,
                                    ),
                                    onPressed: () => showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10.0))),
                                              title: const Text('Questão 1b'),
                                              content: const Text(
                                                  "Nos dias em que você caminhou por pelo menos 10 minutos contínuos quanto"
                                                  "tempo no total você gastou caminhando por dia? "),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: const Text('Ok'),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                )
                                              ],
                                            )),
                                  )),
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.black,
                      ),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 150,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: _q2a,
                                onChanged: (_) =>
                                    _validaCampo(_q2a, _validateQ2a),
                                decoration: InputDecoration(
                                    isDense: true,
                                    labelText: '2a',
                                    hintText: 'Ex.: 5',
                                    filled: true,
                                    hintStyle: const TextStyle(fontSize: 12),
                                    helperText: 'Dias por semana',
                                    errorText: _validateQ2a ? 'Inválido' : null,
                                    border: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid)),
                                    prefixIcon: IconButton(
                                      icon: const Icon(
                                        Icons.assignment,
                                        color: Colors.deepPurple,
                                      ),
                                      onPressed: () => showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                                shape:
                                                    const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10.0))),
                                                title: const Text('Questão 2a'),
                                                content: const Text(
                                                    "Em quantos dias da última semana, você realizou atividades MODERADAS por "
                                                    "pelo menos 10 minutos contínuos, como por exemplo pedalar leve na bicicleta, "
                                                    "nadar, dançar, fazer ginástica aeróbica leve, jogar vôlei recreativo, carregar pesos "
                                                    "leves, fazer serviços domésticos na casa, no quintal ou no jardim como varrer, "
                                                    "aspirar, cuidar do jardim, ou qualquer atividade que fez aumentar "
                                                    "moderadamente sua respiração ou batimentos do coração (POR FAVOR NÃO INCLUA CAMINHADA)"),
                                                actions: <Widget>[
                                                  TextButton(
                                                    child: const Text('Ok'),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  )
                                                ],
                                              )),
                                    )),
                              ),
                            ),
                            SizedBox(
                              width: 150,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: _q2b,
                                onChanged: (_) =>
                                    _validaCampo(_q2b, _validateQ2b),
                                decoration: InputDecoration(
                                    isDense: true,
                                    labelText: '2b',
                                    hintText: 'Ex.: 60',
                                    filled: true,
                                    hintStyle: const TextStyle(fontSize: 12),
                                    helperText: 'Tempo em minutos',
                                    errorText: _validateQ2b ? 'Inválido' : null,
                                    border: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid)),
                                    prefixIcon: IconButton(
                                      icon: const Icon(
                                        Icons.assignment,
                                        color: Colors.deepPurple,
                                      ),
                                      onPressed: () => showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                                shape:
                                                    const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10.0))),
                                                title: const Text('Questão 2b'),
                                                content: const Text(
                                                    "Nos dias em que você fez essas atividades moderadas por pelo menos 10 "
                                                    "minutos contínuos, quanto tempo no total você gastou fazendo essas atividades "
                                                    "por dia? "),
                                                actions: <Widget>[
                                                  TextButton(
                                                    child: const Text('Ok'),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  )
                                                ],
                                              )),
                                    )),
                              ),
                            )
                          ]),
                      const Divider(
                        color: Colors.black,
                      ),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 150,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: _q3a,
                                onChanged: (_) =>
                                    _validaCampo(_q3a, _validateQ3a),
                                decoration: InputDecoration(
                                    isDense: true,
                                    labelText: '3a',
                                    hintText: 'Ex.: 5',
                                    filled: true,
                                    hintStyle: const TextStyle(fontSize: 12),
                                    helperText: 'Dias por semana',
                                    errorText: _validateQ3a ? 'Inválido' : null,
                                    border: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid)),
                                    prefixIcon: IconButton(
                                      icon: const Icon(
                                        Icons.assignment,
                                        color: Colors.deepPurple,
                                      ),
                                      onPressed: () => showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                                shape:
                                                    const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10.0))),
                                                title: const Text('Questão 3a'),
                                                content: const Text(
                                                    "Em quantos dias da última semana, você realizou atividades VIGOROSAS por "
                                                    "pelo menos 10 minutos contínuos, como por exemplo correr, fazer ginástica "
                                                    "aeróbica, jogar futebol, pedalar rápido na bicicleta, jogar basquete, fazer serviços "
                                                    "domésticos pesados em casa, no quintal ou cavoucar no jardim, carregar pesos "
                                                    "elevados ou qualquer atividade que fez aumentar MUITO sua respiração ou "
                                                    "batimentos do coração."),
                                                actions: <Widget>[
                                                  TextButton(
                                                    child: const Text('Ok'),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  )
                                                ],
                                              )),
                                    )),
                              ),
                            ),
                            SizedBox(
                              width: 150,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: _q3b,
                                onChanged: (_) =>
                                    _validaCampo(_q3b, _validateQ3b),
                                decoration: InputDecoration(
                                    isDense: true,
                                    labelText: '3b',
                                    hintText: 'Ex.: 60',
                                    filled: true,
                                    hintStyle: const TextStyle(fontSize: 12),
                                    helperText: 'Tempo em minutos',
                                    errorText: _validateQ3b ? 'Inválido' : null,
                                    border: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid)),
                                    prefixIcon: IconButton(
                                      icon: const Icon(
                                        Icons.assignment,
                                        color: Colors.deepPurple,
                                      ),
                                      onPressed: () => showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                                shape:
                                                    const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10.0))),
                                                title: const Text('Questão 3b'),
                                                content: const Text(
                                                    "Nos dias em que você fez essas atividades vigorosas por pelo menos 10 "
                                                    "minutos contínuos quanto tempo no total você gastou fazendo essas atividades "
                                                    "por dia? "),
                                                actions: <Widget>[
                                                  TextButton(
                                                    child: const Text('Ok'),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  )
                                                ],
                                              )),
                                    )),
                              ),
                            )
                          ]),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: TextButton(
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
                            //F - frequencia D - duracao
                            int caminhadaF =
                                _q1a.text.isEmpty ? 0 : int.parse(_q1a.text);
                            int caminhadaD =
                                _q1b.text.isEmpty ? 0 : int.parse(_q1b.text);
                            int moderadaF =
                                _q2a.text.isEmpty ? 0 : int.parse(_q2a.text);
                            int moderadaD =
                                _q2b.text.isEmpty ? 0 : int.parse(_q2b.text);
                            int vigorosaF =
                                _q3a.text.isEmpty ? 0 : int.parse(_q3a.text);
                            int vigorosaD =
                                _q3b.text.isEmpty ? 0 : int.parse(_q3b.text);
                            int somaF = caminhadaF + moderadaF + vigorosaF;
                            int somaD = caminhadaF * caminhadaD +
                                moderadaF * moderadaD +
                                vigorosaF * vigorosaD;

                            if (vigorosaF >= 5 && vigorosaD >= 30) {
                              setState(() {
                                _status = 'Ativa'; //'Muito Ativa';
                              });
                            } else if ((vigorosaF >= 3 && vigorosaD >= 20) &&
                                (caminhadaF + moderadaF >= 5 &&
                                    caminhadaD + moderadaD >= 30))
                              setState(() {
                                _status = 'Ativa'; //'Muito Ativa';
                              });
                            else {
                              if (vigorosaF >= 3 && vigorosaD >= 20) {
                                setState(() {
                                  _status = 'Ativa'; //'Ativa';
                                });
                              } else if ((moderadaF >= 5 && moderadaD >= 30) ||
                                  (caminhadaF >= 5 && caminhadaD >= 30))
                                setState(() {
                                  _status = 'Ativa';
                                });
                              else if (somaF >= 5 && somaD >= 150)
                                setState(() {
                                  _status = 'Ativa';
                                });
                              else if (somaF >= 5 || somaD >= 150)
                                setState(() {
                                  _status =
                                      'Irregular'; //'Irregularmente Ativa';
                                });
                              else {
                                if ((caminhadaF * caminhadaD) < 10 &&
                                    (moderadaD * moderadaF) < 10 &&
                                    (vigorosaD * vigorosaF) < 10) {
                                  setState(() {
                                    _status = 'Sedentária';
                                  });
                                } else {
                                  setState(() {
                                    _status =
                                        'Irregular'; //'Irregularmente Ativa';
                                  });
                                }
                              }
                            }
                          },
                          child: const Text(
                            'Calcular',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              (_status == '')
                                  ? const Text('')
                                  : TextButton.icon(
                                      onPressed: () {
                                        context
                                            .read<VariaveisProvider>()
                                            .set(ipaq: _status);
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(Icons.arrow_back),
                                      label: const Text('Copiar')),
                              Text(
                                _status,
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurple),
                              )
                            ],
                          )),
                    ])),
          )),
    );
  }

  void _validaCampo(campo, validador) {
    if (campo == _q1a) {
      if (_q1a.text != '' && int.tryParse(_q1a.text) == null) {
        setState(() {
          _validateQ1a = true;
        });
      } else {
        setState(() {
          _validateQ1a = false;
        });
      }
    }
    if (campo == _q1b) {
      if (_q1b.text != '' && int.tryParse(_q1b.text) == null) {
        setState(() {
          _validateQ1b = true;
        });
      } else {
        setState(() {
          _validateQ1b = false;
        });
      }
    }
    if (campo == _q2a) {
      if (_q2a.text != '' && int.tryParse(_q2a.text) == null) {
        setState(() {
          _validateQ2a = true;
        });
      } else {
        setState(() {
          _validateQ2a = false;
        });
      }
    }
    if (campo == _q2b) {
      if (_q2b.text != '' && int.tryParse(_q2b.text) == null) {
        setState(() {
          _validateQ2b = true;
        });
      } else {
        setState(() {
          _validateQ2b = false;
        });
      }
    }
    if (campo == _q3a) {
      if (_q3a.text != '' && int.tryParse(_q3a.text) == null) {
        setState(() {
          _validateQ3a = true;
        });
      } else {
        setState(() {
          _validateQ3a = false;
        });
      }
    }
    if (campo == _q3b) {
      if (_q3b.text != '' && int.tryParse(_q3b.text) == null) {
        setState(() {
          _validateQ3b = true;
        });
      } else {
        setState(() {
          _validateQ3b = false;
        });
      }
    }
    if (campo == _q4a) {
      if (_q4a.text != '' && int.tryParse(_q4a.text) == null) {
        setState(() {
          _validateQ4a = true;
        });
      } else {
        setState(() {
          _validateQ4a = false;
        });
      }
    }
    if (campo == _q4b) {
      if (_q4b.text != '' && int.tryParse(_q4b.text) == null) {
        setState(() {
          _validateQ4b = true;
        });
      } else {
        setState(() {
          _validateQ4b = false;
        });
      }
    }
  }
}
