import 'package:flutter/material.dart';
import 'base.dart';
// import 'package:kinghotel_hotel/src/api/page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BasePage(
      title: 'Home',
      selectedIndex: 0,
      child: Center(
        child: Text(
          'Home Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
