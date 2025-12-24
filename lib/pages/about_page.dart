import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text(
          "Просто сайт, пока непонятно что тут будет... (Сделано на Flutter)",
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
