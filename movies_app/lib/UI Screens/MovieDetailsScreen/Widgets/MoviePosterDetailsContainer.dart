
import 'package:flutter/material.dart';

class MoviePosterDetailsContainer extends StatelessWidget {
  const MoviePosterDetailsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
          height: 610,
          // color: Appcolors(),
          child: Stack(
    children: [
      Positioned.fill(
        child: Image.asset(
          'Assets/Images/screenshotmoviePoster.jpeg', // Replace with your image URL
          fit: BoxFit.cover,
        ),
      ),
      Positioned.fill(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.6), // Dark fade on top
                Colors.black.withOpacity(0.4), // Transparent at the bottom
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              GestureDetector(
                onTap: () {
                  //later 34an l logic isa
                },
                child: Image.asset('Assets/Images/watchButton.png'),
              ),
              Spacer(),
              Text(
                "Doctor Strange In The Multiverse Of Madness",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "2022",
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 12),

            ],
          ),
        ),
      ),
    ],
          ),
        );
  }
}
