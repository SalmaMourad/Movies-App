import 'package:flutter/material.dart';

class OnboardingNextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("Assets/Images/OnBoarding2.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // التدرج اللوني لضبط وضوح النص
          // Positioned.fill(
          //   child: Container(
          //     decoration: BoxDecoration(
          //       gradient: LinearGradient(
          //         begin: Alignment.topCenter,
          //         end: Alignment.bottomCenter,
          //         colors: [
          //           Colors.black.withOpacity(0),
          //           Colors.black.withOpacity(0),
          //         ],
          //         stops: [0.4, 1],
          //       ),
          //     ),
          //   ),
          // ),
          // محتوى الصفحة
          Positioned(
            bottom: 100,
            left: 20,
            right: 20,
            child: Column(
              children: [
                Text(
                  "Discover Movies",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Explore a vast collection of movies in all qualities and genres. "
                  "Find your next favorite film with ease.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
