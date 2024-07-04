import 'package:flutter/material.dart';
import 'package:kinghotel/presentations/pages/cart/cart_screen.dart';
import 'package:kinghotel/presentations/pages/home/home_screen.dart';
import 'package:kinghotel/presentations/pages/product/product_screen.dart';
import 'package:kinghotel/presentations/pages/profile/profile_screen.dart';

class BottomNavBarPage extends StatefulWidget {
  final int selectedIndex;
  final String title;
  final Widget child;

  const BottomNavBarPage({
    super.key,
    required this.selectedIndex,
    required this.title,
    required this.child,
  });

  @override
  _BottomNavBarPageState createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  late PageController _pageController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.selectedIndex);
    _selectedIndex = widget.selectedIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: <Widget>[
          HomeScreen(),
          ProductScreen(),
          CartScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10.0,
        // height: 100,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _buildNavBarItem(Icons.grid_view_rounded, 'Home', 0),
            _buildNavBarItem(Icons.add_home_work_rounded, 'Product', 1),
            _buildNavBarItem(Icons.shopping_cart_rounded, 'Cart', 2),
            _buildNavBarItem(Icons.manage_accounts_rounded, 'Profile', 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavBarItem(IconData icon, String tooltip, int index) {
    bool isSelected = _selectedIndex == index;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(icon,
              color: isSelected ? Colors.black : Colors.grey),
          tooltip: tooltip, // Tooltip text
          onPressed: () => _onItemTapped(index),
        ),
        if (isSelected) // Show this widget only when selected
        Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: SizedBox(
              width: 6,
              height: 6,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
