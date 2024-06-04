class Registro {
  final String? data;
  final String? hora;
  final int? altura;
  final int? ca;
  final String? faseClimaterio;
  final String? praticaAF;
  final bool? alcool;
  final bool? fumante;
  final double? bri;
  final double? iav;
  final double? risco;

  Registro(
      {this.data,
      this.hora,
      this.altura,
      this.ca,
      this.faseClimaterio,
      this.praticaAF,
      this.alcool,
      this.fumante,
      this.bri,
      this.iav,
      this.risco});

  Map<String, dynamic> toMap() {
    return {
      'data': data,
      'hora': hora,
      'altura': altura,
      'ca': ca,
      'faseclimaterio': faseClimaterio,
      'praticaaf': praticaAF,
      'alcool': alcool! ? 1 : 0,
      'fumante': fumante! ? 1 : 0,
      'bri': bri,
      'iav': iav,
      'risco': risco
    };
  }

  @override
  String toString() {
    return 'Registro{data: $data, hora: $hora, altura: $altura, ca: $ca, faseClimaterio: $faseClimaterio, praticaAF: $praticaAF, alcool: $alcool, fumante: $fumante, bri: $bri, iav: $iav, risco: $risco}';
  }
}
