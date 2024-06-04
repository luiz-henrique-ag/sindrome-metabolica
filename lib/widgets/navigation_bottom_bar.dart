import 'package:flutter/material.dart';

class NavigationBottomBar extends StatefulWidget {
  const NavigationBottomBar({super.key});
  
  @override
  State<NavigationBottomBar> createState() => _NavigationBottomBarState();
}

class _NavigationBottomBarState extends State<NavigationBottomBar> {
  int paginaAtual = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: paginaAtual,
      onTap: (index) {
        setState(() {
          paginaAtual = index;
        });
        switch (index) {
          case 0:
            // Da o POP na tela atual e direciona para a nova
            Navigator.pushReplacementNamed(context, '/');
            break;
          case 1:
            // Da o POP na tela atual e direciona para a nova
            Navigator.pushReplacementNamed(context, '/registros');
            break;
        }
      },
      type: BottomNavigationBarType.fixed,
      //fixedColor: Color(0xFFF2F2F2),
      backgroundColor: const Color(0xFFF2F2F2),
      items: [
        BottomNavigationBarItem(
          label: "Principal",
          icon: Image.asset(
            'assets/iconemenu1.png', 
            color: const Color(0xFFCC33CC),
            height: 25,
          ),
        ),
        BottomNavigationBarItem(
          label: "Registro",
          icon: Image.asset(
            'assets/iconemenu2.png', 
            color: const Color(0xFFCC33CC),
            height: 25,
          ),          
        ),
      ],
      selectedFontSize: 12,
      selectedLabelStyle:
          const TextStyle(color: Color(0xFFCC33CC), fontSize: 12),
    );
  }
}
