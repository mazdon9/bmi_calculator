import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff6C63FF),
      body: Center(
        child: Text(
          'BMI CALCULATOR',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
    );
  }
}
