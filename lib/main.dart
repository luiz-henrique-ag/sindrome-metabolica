import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sindromemetabolica_fase2/providers/variaveis_provider.dart';
import 'package:sindromemetabolica_fase2/screens/bri_resultado_screen.dart';
import 'package:sindromemetabolica_fase2/screens/bri_screen.dart';
import 'package:sindromemetabolica_fase2/screens/iav_resultado_screen.dart';
import 'package:sindromemetabolica_fase2/screens/iav_screen.dart';
import 'package:sindromemetabolica_fase2/screens/ipaq_screen.dart';
import 'package:sindromemetabolica_fase2/screens/principal_screen.dart';
import 'package:sindromemetabolica_fase2/screens/registros_screen.dart';
import 'package:sindromemetabolica_fase2/screens/rsm_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => VariaveisProvider(),
        )
      ],
      child: MaterialApp(
        title: 'CLIMATMED',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: const MaterialColor(
            0xFFCC33CC,
            <int, Color>{
              50: Color(0xFFCC33CC),
              100: Color(0xFFCC33CC),
              200: Color(0xFFCC33CC),
              300: Color(0xFFCC33CC),
              400: Color(0xFFCC33CC),
              500: Color(0xFFCC33CC),
              600: Color(0xFFCC33CC),
              700: Color(0xFFCC33CC),
              800: Color(0xFFCC33CC),
              900: Color(0xFFCC33CC),
            },
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const PrincipalScreen(),
          '/rsm': (context) => const RsmScreen(),
          '/bri': (context) => const BriScreen(),
          '/bri_resultado': (context) => const BriResultadoScreen(),
          '/iav': (context) => const IavScreen(),
          '/iav_resultado': (context) => const IavResultadoScreen(),
          '/registros': (context) => const RegistrosScreen(),
          '/ipaq': (context) => const IpaqScreen(),
        },
      ),
    );
  }
}
