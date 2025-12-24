import 'package:flutter/material.dart';
import 'package:isaprog_mainsite/core/providers/main_provider.dart';
import 'package:isaprog_mainsite/pages/main_page.dart';
import 'package:isaprog_mainsite/theme/main_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MainProvider()..loadData(),
      child: MyWebsite(),
    ),
  );
}

class MyWebsite extends StatelessWidget {
  const MyWebsite({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StasyaoSan - Main Site',
      debugShowCheckedModeBanner: false,
      theme: MainTheme.mainTheme,
      home: MainPage(),
    );
  }
}
