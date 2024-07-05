// lib/presentations/pages/loading_screen.dart

import 'package:flutter/material.dart';
import 'package:kinghotel/presentations/pages/loading/slider_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToOnboarding();
  }

  _navigateToOnboarding() async {
    await Future.delayed(Duration(seconds: 3)); // Wait for 3 seconds
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => OnboardingSlider()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Text(
                'KingHotel',
                style: TextStyle(fontSize: 40, color: Color(0xFF1D2B4A), fontFamily: GoogleFonts.sairaStencilOne().fontFamily),
              ),
            ),
            SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(
                strokeWidth: 6,
                color: Color(0x551D2B4A),
              ),
            ),
          ],
        ),
      ),
    );
  }
}