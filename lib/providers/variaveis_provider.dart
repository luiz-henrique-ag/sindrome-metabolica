import 'package:flutter/material.dart';

class VariaveisProvider extends ChangeNotifier {
  String fase;
  String ipaq;
  bool fumante;
  bool alcool;
  int altura;
  int ca;
  double peso;
  int triglicerides;
  int hdl;
  double iav;
  String briLabel;

  VariaveisProvider({
    this.fase = 'Pré-Menopausa',
    this.ipaq = 'Ativa',
    this.fumante = false,
    this.alcool = false,
    this.altura = 0,
    this.ca = 0,
    this.peso = 0,
    this.triglicerides = 0,
    this.hdl = 0,
    this.iav = 0,
    this.briLabel = '-',
  });

  void set({
    String? fase,
    String? ipaq,
    bool? fumante,
    bool? alcool,
    int? altura,
    int? ca,
    double? peso,
    int? triglicerides,
    int? hdl,
    double? iav,
    String? briLabel
  }){
    if(fase != null){
      this.fase = fase;
    } 
    if(ipaq != null){
      this.ipaq = ipaq;
    } 
    if(fumante != null){
      this.fumante = fumante;
    } 
    if(alcool != null){
      this.alcool = alcool;
    } 
    if(altura != null){
      this.altura = altura;
    }
    if(ca != null){
      this.ca = ca;
    }
    if(peso != null){
      this.peso = peso;
    }
    if(triglicerides != null){
      this.triglicerides = triglicerides;
    }
    if(hdl != null){
      this.hdl = hdl;
    }
    if(iav != null){
      this.iav = iav;
    }
    if(briLabel != null){
      this.briLabel = briLabel;
    }
    notifyListeners();
  }
  
  void limpaCampos(){
    set(
      fase : 'Pré-Menopausa',
      ipaq : 'Ativa',
      fumante : false,
      alcool : false,
      altura : 0,
      ca : 0,
      peso : 0,
      triglicerides : 0,
      hdl : 0,
      iav : 0,
      briLabel : '-',
    );
  }
}