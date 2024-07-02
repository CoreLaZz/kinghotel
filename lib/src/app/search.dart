import 'package:flutter/material.dart';
import 'base.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BasePage(
      title: 'Search',
      selectedIndex: 1,
      child: Center(
        child: Text(
          'Search Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

