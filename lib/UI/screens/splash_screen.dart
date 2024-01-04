import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:projects/UI/screens/input_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _createSplash();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff0A0E21),
                Color(0xFFEB1555),
                Color(0xFF8D8E98),
              ],
            ),
          ),
          child: Center(
            child: Text(
              "BMI Calculator",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _createSplash() {
    Future.delayed(
      const Duration(seconds: 20),
      () {
        log("I am in splash duration");

        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => InputPage(),
          ),
          (route) => false,
        );
      },
    );
  }
}
