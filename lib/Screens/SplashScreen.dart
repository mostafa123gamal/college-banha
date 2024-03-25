import 'package:college_banha_app/AuthPages/logInPage.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Simulating some initialization tasks
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) =>  LoginScreen()),
      );
    });

    return Scaffold(
      body: Center(
        child: Image.asset('assets/image/preview.jpg',),
      ),
    );
  }
}

