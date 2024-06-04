import 'package:flutter/material.dart';
import 'package:sindromemetabolica_fase2/widgets/popups.dart';

class Layout extends StatelessWidget {
  final Widget child;
  final String title;
  final Widget? navigationBar;

  const Layout(
      {super.key,
      required this.child,
      required this.title,
      this.navigationBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: const Color(0xFFCC33CC),
          centerTitle: true,
          title:
              const Text('ClimatMed', style: TextStyle(fontFamily: "Poppins", color: Colors.white)),
        ),
        body: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(
              color: Colors.white
            ),
            backgroundColor: const Color(0xFF662D91),
            title: Text(
              title,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
            actions: [
              Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                ),
              ),
            ],
          ),
          endDrawer: Drawer(
            child: Popups.showDrawer(context),
          ),
          body: child,
          bottomNavigationBar: navigationBar ?? const SizedBox.shrink(),
        ));
  }
}
