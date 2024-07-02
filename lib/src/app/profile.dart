import 'package:flutter/material.dart';
import 'base.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BasePage(
      title: 'Profile',
      selectedIndex: 3,
      child: Center(
        child: Text(
          'Profile Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
