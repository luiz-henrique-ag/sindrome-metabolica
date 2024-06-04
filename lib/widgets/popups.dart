import 'package:flutter/material.dart';

class Popups {
  static String saibaMais1 =
      '1- O diagnóstico da síndrome metabólica é estabelecido, no sexo feminino, quando houver '
      'aumento da circunferência abdominal, mais alteração em dois dos seguintes componentes: '
      'triglicérides, colesterol HDL, glicemia e pressão arterial (IDF, 2006).';
  static String saibaMais2 =
      '2- IAV (Índice de Adiposidade Visceral) foi elaborado como uma nova medida para individualizar '
      'com relação ao sexo, baseada na circunferência abdominal, IMC, triglicérides e HDL, com a '
      'função de expressar indiretamente a gordura visceral (AMATO et al., 2010).';
  static String saibaMais3 =
      '3- CA (Circunferência Abdominal) foi testada e aprovada em estudo realizado por Lean, '
      'Ham e Morrison (1995), como medida única para identificar pessoas em risco de saúde por '
      'estarem acima do peso e por terem distribuição central de gordura. Valores maiores ou '
      'iguais a 80 cm são considerados elevados em mulheres da América do Sul (IDF, 2006).';
  static String saibaMais4 =
      '4- BRI (Body Roundness Index) é um novo índice elaborado por Thomas et al. (2013), para '
      'discriminar gordura corporal e visceral, que associa altura e circunferência abdominal e '
      'pode ser aplicado como uma ferramenta visual para avaliação do estado de saúde (THOMAS et al., 2013).';
  static String saibaMaisReferencias1 = 'Referências';
  static String saibaMaisReferencias2 =
      'AMATO, M.C; et al. Visceral Adiposity Index – A reliable indicator of visceral fat function associated with cardiometabolic risk. Diabetes Care, v .33, n .4, 2010.\n';
  static String saibaMaisReferencias3 =
      'INTERNATIONAL DIABETES FEDERATION-IDF. The IDF Consensus Worldwide Definition of the Metabolic Syndrome, 2006.\n';
  static String saibaMaisReferencias4 =
      'LEAN, M.E.J.; HAM, T.S.; MORRISON C.E.; Waist circumference as a measure for indicating need for weight management. BMJ, v. 311, n.158, 1995.\n';
  static String saibaMaisReferencias5 =
      'THOMAS, D.M.; et al. Relationships Between Body Roundness with Body Fat and Visceral Adipose Tissue Energing from a New Geometrical Model. Obesity, v. 21, p. 2264-71, 2013.\n';

  static void mostraSaibaMais(BuildContext context) {
    AlertDialog alert = AlertDialog(
      scrollable: true,
      //title: Text("Explicação"),
      content: Column(
        children: [
          const Icon(
            Icons.info,
            color: Color(0xFFCC33CC),
            size: 40,
          ),
          const Text(
            'Saiba Mais',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.blueGrey, fontSize: 20),
          ),
          const Text(''),
          Text(saibaMais1,
              textAlign: TextAlign.justify,
              style: const TextStyle(color: Colors.blueGrey, fontSize: 14)),
          const Text(''),
          Text(saibaMais2,
              textAlign: TextAlign.justify,
              style: const TextStyle(color: Colors.blueGrey, fontSize: 14)),
          const Text(''),
          Text(saibaMais3,
              textAlign: TextAlign.justify,
              style: const TextStyle(color: Colors.blueGrey, fontSize: 14)),
          const Text(''),
          Text(saibaMais4,
              textAlign: TextAlign.justify,
              style: const TextStyle(color: Colors.blueGrey, fontSize: 14)),
          const Text(''),
          Text(saibaMaisReferencias1,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                  fontSize: 14)),
          const Text(''),
          Text(saibaMaisReferencias2,
              textAlign: TextAlign.justify,
              style: const TextStyle(color: Colors.blueGrey, fontSize: 14)),
          const Text(''),
          Text(saibaMaisReferencias3,
              textAlign: TextAlign.justify,
              style: const TextStyle(color: Colors.blueGrey, fontSize: 14)),
          const Text(''),
          Text(saibaMaisReferencias4,
              textAlign: TextAlign.justify,
              style: const TextStyle(color: Colors.blueGrey, fontSize: 14)),
          const Text(''),
          Text(saibaMaisReferencias5,
              textAlign: TextAlign.justify,
              style: const TextStyle(color: Colors.blueGrey, fontSize: 14)),
        ],
      ),

      actions: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: const WidgetStatePropertyAll(Color(0xFF662D91)),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0))),
          ),
          onPressed: () => Navigator.pop(context),
          child: const Text(
            'Ok', 
            style: TextStyle(
              color: Colors.white
            ),
          ),
        ),
      ],
    );
    // exibe o dialogo
    showDialog(
      useSafeArea: true,
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static void mostraEquipeTecnica(BuildContext context) {
    AlertDialog alert = AlertDialog(
      scrollable: true,
      //title: Text("Explicação"),
      content: const Column(
        children: [
          Icon(
            Icons.info,
            color: Color(0xFFCC33CC),
            size: 40,
          ),
          Text(
            'Equipe Técnica',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.blueGrey, fontSize: 20),
          ),
          Text(''),
          Text('Carolina Ananias Meira Trovão',
              textAlign: TextAlign.justify,
              style: TextStyle(color: Colors.blueGrey, fontSize: 14)),
          Text(''),
          Text('Josiane Santos Brant Rocha',
              textAlign: TextAlign.justify,
              style: TextStyle(color: Colors.blueGrey, fontSize: 14)),
          Text(''),
          Text('Marise Fagundes Silveira',
              textAlign: TextAlign.justify,
              style: TextStyle(color: Colors.blueGrey, fontSize: 14)),
          Text(''),
          Text('Antônio Prates Caldeira',
              textAlign: TextAlign.justify,
              style: TextStyle(color: Colors.blueGrey, fontSize: 14)),
          Text(''),
          Text('Renê Rodrigues Veloso',
              textAlign: TextAlign.justify,
              style: TextStyle(color: Colors.blueGrey, fontSize: 14)),
        ],
      ),

      actions: [
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: const WidgetStatePropertyAll(Color(0xFF662D91)),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)))),
          onPressed: () => Navigator.pop(context),
          child: const Text(
            'Ok', 
            style: TextStyle(
              color: Colors.white
            ),
          ),
        ),
      ],
    );
    // exibe o dialogo
    showDialog(
      useSafeArea: true,
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static Container showDrawer(context) {
    return Container(
      padding: const EdgeInsets.all(40),
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          ListTile(
            title: const Text(
              'Equipe Técnica',
              style: TextStyle(color: Color(0xFF662D91)),
            ),
            leading: const Icon(Icons.add, color: Color(0xFF662D91)),
            onTap: () {
              Popups.mostraEquipeTecnica(context);
            },
          ),
          ListTile(
            title: const Text(
              'Saiba Mais',
              style: TextStyle(color: Color(0xFF662D91)),
            ),
            leading: const Icon(
              Icons.add,
              color: Color(0xFF662D91),
            ),
            onTap: () {
              Popups.mostraSaibaMais(context);
            },
          ),
          const Divider(
            color: Color(0xFF662D91),
          ),
          ListTile(
            title: const Text('Apoio'),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/ppgcps.png',
                  height: 70,
                  //color: Color(0xFF662D91),
                ),
                const SizedBox(
                  height: 5,
                ),
                Image.asset(
                  'assets/ppgmcs.png',
                  height: 70,
                  //color: Color(0xFF662D91),
                ),
                const SizedBox(
                  height: 5,
                ),
                Image.asset(
                  'assets/unilogo.png',
                  height: 70,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 5,
                ),
                Image.asset(
                  'assets/fapemig.png',
                  height: 100,
                  //color: Color(0xFF662D91),
                ),
                const SizedBox(
                  height: 5,
                ),
                Image.asset(
                  'assets/capes.png',
                  height: 70,
                  //color: Color(0xFF662D91),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
