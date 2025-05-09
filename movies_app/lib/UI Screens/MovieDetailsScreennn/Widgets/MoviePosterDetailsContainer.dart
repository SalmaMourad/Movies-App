import 'package:flutter/material.dart';
import 'package:movies_app/UI%20Screens/BrowserScreen/Model/movie.dart';

class MoviePosterDetailsContainer extends StatelessWidget {
  final String? imgUrl;
  final String? movieTitle;
  final int? year;
  MoviePosterDetailsContainer({
    super.key,
    this.imgUrl,
    this.movieTitle,
    this.year,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 610,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              imgUrl ?? "", 
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
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 2, vertical: 15.0),
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_outlined,
                              color: Colors.white,
                            )),
                      ),
                      Spacer(),
                      IconButton(onPressed: (){}, icon: Icon(
                              Icons.bookmark,
                              color: Colors.white,
                            ))
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      //later 34an l logic isa
                    },
                    child: Image.asset('Assets/Images/watchButton.png'),
                  ),
                  Spacer(),
                  Text(
                    movieTitle ?? "",
                    // "Doctor Strange In The Multiverse Of Madness",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "${year}" ?? "",
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
