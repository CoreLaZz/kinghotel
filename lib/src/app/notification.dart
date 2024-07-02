import 'package:flutter/material.dart';
import 'base.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BasePage(
      title: 'Notifications',
      selectedIndex: 2,
      child: Center(
        child: Text(
          'Notifications Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
