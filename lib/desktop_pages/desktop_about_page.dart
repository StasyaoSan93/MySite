import 'package:flutter/material.dart';

class DesktopAboutPage extends StatelessWidget {
  const DesktopAboutPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Просто сайт, пока непонятно что тут будет... (Сделано на Flutter)",
        style: TextStyle(fontSize: 22),
      ),
    );
  }
}
