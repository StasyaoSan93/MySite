import 'package:flutter/material.dart';
import 'package:isaprog_mainsite/desktop_pages/desktop_home_page.dart';

class MobileMainPage extends StatelessWidget {
  const MobileMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("StasyaoSan - Main Site")),
      body: DesktopHomePage(),
    );
  }
}
