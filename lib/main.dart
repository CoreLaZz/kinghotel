import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kinghotel/config/routes.dart';
// import 'package:kinghotel/config/service.dart';
import 'package:kinghotel/presentations/pages/home/home_screen.dart';
import 'package:kinghotel/presentations/pages/loading/loading_screen.dart';
import 'package:kinghotel/presentations/widgets/bottom_navbar_screen.dart';

Future<void> main() async {
  // await Env.loadEnv();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily:  GoogleFonts.poppins().fontFamily,
        primarySwatch: Colors.red,
      ),
      home: const LoadingScreen(), // Show loading screen initially
      routes: {
        AppRoutes.home: (context) => BottomNavBarPage(selectedIndex: 0, title: '', child: HomeScreen()), // Default route to BottomNavBarPage
        ...AppRoutes.routes, // Other routes defined in AppRoutes
      },
    );
  }
}
