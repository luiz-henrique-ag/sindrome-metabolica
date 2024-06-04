import 'dart:math';

class Utils {
  static double calculaProbabilidadeIAV(
      int ca,
      int altura,
      bool alcool,
      bool fumante,
      String ipaq,
      String fase,
      int triglicerides,
      int hdl,
      double peso) {
    List _betas = [0, 0, 0, 0, 0, 0, 0];
    double probabilidade = 0;

    double iav =
        ((ca / (36.58 + 1.89 * (peso / ((altura / 100) * (altura / 100))))) *
            (triglicerides / 0.81) *
            (1.52 / hdl));

    //v = 1 / (1 + np.exp(-(-2.94716472+0.64365104*x[0]+(-0.15545427*x[1])+(0.11040341*x[2])+(-0.01999085*x[3]))))

    _betas[0] = iav;
    _betas[1] = (alcool ? 2 : 1);
    _betas[2] = (fumante ? 2 : 1);
    if (ipaq == 'Ativa') {
      _betas[3] = 0;
    } else if (ipaq == 'Irregular') {
      _betas[3] = 1;
    } else if (ipaq == 'Sedentária') {
      _betas[3] = 2;
    }
    _betas[4] = triglicerides;
    _betas[5] = peso;
    _betas[6] = hdl;

    print(_betas);

    double eq = -(-2.11629182 +
        0.28915762 * _betas[0] +
        (-0.29746856 * _betas[1]) +
        (-0.10668206 * _betas[2]) +
        (-0.15605713 * _betas[3]) +
        (-0.00408345 * _betas[4]) +
        (0.08006897 * _betas[5]) +
        (-0.10345989 * _betas[6]));

    if (fase == 'Pós-Menopausa') {
      eq = -(-8.13530643 +
          0.83466139 * _betas[0] +
          (-0.11986108 * _betas[1]) +
          (0.01326709 * _betas[2]) +
          (0.1716539 * _betas[3]) +
          (-0.01443179 * _betas[4]) +
          (0.07143609 * _betas[5]) +
          (0.01345006 * _betas[6]));
    }
    double den = exp(eq);

    probabilidade = 1 / (1 + den);
    return probabilidade * 100;
  }

  static double calculaProbabilidadeBRI(
      int ca, int altura, bool alcool, bool fumante, String ipaq, String fase) {
    List _betas = [0, 0, 0, 0, 0];
    double probabilidade = 0;
    double wc = ca.toDouble();
    double h = altura.toDouble();
    num nu = pow(wc / (2 * pi), 2);
    num deno = pow(0.5 * h, 2);
    double raiz = sqrt(1 - (nu / deno));
    double bri = 364.2 - 365.5 * raiz;
    //v = 1 / (1 + np.exp(-(-2.94716472+0.64365104*x[0]+(-0.15545427*x[1])+(0.11040341*x[2])+(-0.01999085*x[3]))))
    _betas[0] = bri; //double.parse(_bri);
    _betas[1] = (alcool ? 2 : 1);
    _betas[2] = (fumante ? 2 : 1);
    if (ipaq == 'Ativa') {
      _betas[3] = 0;
    } else if (ipaq == 'Irregular') {
      _betas[3] = 1;
    } else if (ipaq == 'Sedentária') {
      _betas[3] = 2;
    }
    print(_betas);

    double eq = -(-2.94716472 +
        0.64365104 * _betas[0] +
        (-0.15545427 * _betas[1]) +
        (0.11040341 * _betas[2]) +
        (-0.01999085 * _betas[3]));

    if (fase == 'Pós-Menopausa') {
      eq = -(-2.14020449 +
          0.5297731 * _betas[0] +
          (0.03458733 * _betas[1]) +
          (0.07007615 * _betas[2]) +
          (-0.15314693 * _betas[3]));
    }
    double den = exp(eq);

    probabilidade = 1 / (1 + den);
    return probabilidade * 100;
  }

  static double calculaBRI(int ca, int altura) {
    double bri = 0;
    double wc = ca.toDouble();
    double h = altura.toDouble();
    num nu = pow(wc / (2 * pi), 2);
    num deno = pow(0.5 * h, 2);
    double raiz = sqrt(1 - (nu / deno));
    bri = 364.2 - 365.5 * raiz;
    return bri;
  }

  static double calculaIAV(
      double iav, int ca, double peso, int altura, int triglicerides, int hdl) {
    iav = 0;
    //aqui a altura é em metros
    iav = ((ca / (36.58 + 1.89 * (peso / ((altura / 100) * (altura / 100))))) *
        (triglicerides / 0.81) *
        (1.52 / hdl));
    return iav;
  }
}
