import 'package:flutter/material.dart';
import 'package:isaprog_mainsite/desktop_pages/desktop_main_page.dart';
import 'package:isaprog_mainsite/mobile_pages/mobile_main_page.dart';

void main() {
  runApp(const MyWebsite());
}

class MyWebsite extends StatelessWidget {
  const MyWebsite({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StasyaoSan - Main Page',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
      home: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 550) {
            return DesktopMainPage();
          } else {
            return MobileMainPage();
          }
        },
      ),
    );
  }
}
