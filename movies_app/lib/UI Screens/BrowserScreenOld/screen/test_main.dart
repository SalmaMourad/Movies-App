import 'package:flutter/material.dart';
import 'package:movies_app/UI%20Screens/BrowserScreenOld/screen/browser_screen.dart';
import 'package:movies_app/UI%20Screens/SearchScreen/screen/search_screen.dart';

import '../../MovieDetailsScreen/Screen/movie_details_screen.dart';

void main() {
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: BrowserScreen(),
      // home: SearchScreen(allMovies: BrowserScreen.movies),//34an l test dlw2ty
      home: MovieDetailsScreen(
        allMovies: BrowserScreen.movies,
        castList: [
          {
            "name": "Hayley Atwell",
            "character": "Captain Carter",
            "imageUrl": "https://example.com/hayley.jpg",
          },
          {
            "name": "Elizabeth Olsen",
            "character": "Wanda Maximoff / The Scarlet Witch",
            "imageUrl": "https://example.com/elizabeth.jpg",
          },
          {
            "name": "Rachel McAdams",
            "character": "Dr. Christine Palmer",
            "imageUrl": "https://example.com/rachel.jpg",
          },
          {
            "name": "Charlize Theron",
            "character": "Clea",
            "imageUrl": "https://example.com/charlize.jpg",
          },
        ], // Pass the cast list
      ), //34an l test dlw2ty
      // home: SearchScreen(),
    );
  }
}
