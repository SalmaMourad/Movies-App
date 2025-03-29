import 'package:flutter/material.dart';
// import 'package:movies_app/Assets/AppConstants/app-images.dart';
import 'package:movies_app/db/OnBoarding/onBoarding.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "splash";
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0;
      });
    });

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, OnboardingScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AnimatedOpacity(
          duration: Duration(seconds: 2),
          opacity: _opacity,
          child: Image.asset(
            "Assets/Images/Splash Screen.png",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
