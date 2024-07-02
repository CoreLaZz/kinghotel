import 'package:flutter/material.dart';
import 'package:kinghotel/src/app/home.dart';
import 'package:kinghotel/src/app/notification.dart';
import 'package:kinghotel/src/app/profile.dart';
import 'package:kinghotel/src/app/search.dart';
import 'package:kinghotel/src/app/setting.dart';

class AppRoutes {
  static const String home = '/home';
  static const String search = '/search';
  static const String notifications = '/notifications';
  static const String profile = '/profile';
  static const String setting = '/setting';

  static Map<String, WidgetBuilder> get routes => {
    home: (context) => const HomePage(),
    search: (context) => const SearchPage(),
    notifications: (context) => const NotificationsPage(),
    profile: (context) => const ProfilePage(),
    setting: (context) => const SettingPage(),
  };
}