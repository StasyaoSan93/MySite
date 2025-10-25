import 'package:flutter/material.dart';
import 'package:isaprog_mainsite/pages/about_page.dart';
import 'package:isaprog_mainsite/pages/contact_page.dart';
import 'package:isaprog_mainsite/pages/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [HomePage(), AboutPage(), ContactPage()];

  void _onMenuTap(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("StasyaoSan - Main Site"),
        actions: [
          _MenuButton("Главная", 0, _selectedIndex, _onMenuTap),
          _MenuButton("О нас", 1, _selectedIndex, _onMenuTap),
          _MenuButton("Контакты", 2, _selectedIndex, _onMenuTap),
        ],
      ),
      body: IndexedStack(index: _selectedIndex, children: _pages),
    );
  }
}

class _MenuButton extends StatelessWidget {
  final String title;
  final int index;
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const _MenuButton(this.title, this.index, this.selectedIndex, this.onTap);

  @override
  Widget build(BuildContext context) {
    final bool isActive = index == selectedIndex;

    return TextButton(
      onPressed: () => onTap(index),
      child: Text(
        title,
        style: TextStyle(
          color: isActive
              ? Theme.of(context).colorScheme.primary
              : Colors.grey[700],
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
