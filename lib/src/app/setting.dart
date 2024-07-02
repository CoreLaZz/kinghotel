import 'package:flutter/material.dart';
import 'base.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BasePage(
      title: 'Setting',
      selectedIndex: 4,
      child: Center(
        child: Text(
          'Setting Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
