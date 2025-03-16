import 'package:flutter/material.dart';
import 'package:movies_app/UI%20Screens/BrowserScreen/screen/browser_screen.dart';
import 'package:movies_app/UI%20Screens/SearchScreen/screen/search_screen.dart';

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
      home: SearchScreen(allMovies: BrowserScreen.movies),//34an l test dlw2ty
      // home: SearchScreen(),
    );
  }
}

