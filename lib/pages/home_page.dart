import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Добро пожаловать на главную страницу!",
        style: TextStyle(fontSize: 22),
      ),
    );
  }
}
