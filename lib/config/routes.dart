import 'package:flutter/material.dart';
import 'package:kinghotel/presentations/pages/cart/cart_screen.dart';
import 'package:kinghotel/presentations/pages/home/home_screen.dart';
import 'package:kinghotel/presentations/pages/product/product_screen.dart';
import 'package:kinghotel/presentations/pages/profile/profile_screen.dart';
import 'package:kinghotel/presentations/widgets/bottom_navbar_screen.dart';

class AppRoutes {
  static const String home = '/home';
  static const String product = '/product';
  static const String cart = '/cart';
  static const String profile = '/profile';

  static final Map<String, WidgetBuilder> routes = {
    home: (context) => BottomNavBarPage(selectedIndex: 0, title: 'Home', child: HomeScreen()),
    product: (context) => BottomNavBarPage(selectedIndex: 1, title: 'Product', child: ProductScreen()),
    cart: (context) => BottomNavBarPage(selectedIndex: 2, title: 'Cart', child: CartScreen()),
    profile: (context) => BottomNavBarPage(selectedIndex: 3, title: 'Profile', child: ProfileScreen()),
  };
}
