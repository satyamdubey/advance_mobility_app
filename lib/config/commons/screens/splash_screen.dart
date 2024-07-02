import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4)).then(
          (value) => Navigator.popAndPushNamed(context, "/posts"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Advance Mobility",
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w600,
            color: Colors.greenAccent.shade700,
          ),
        ),
      ),
    );
  }
}