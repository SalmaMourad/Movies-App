import 'package:flutter/material.dart';
import '../Widgets/MoviePosterDetailsContainer.dart';
import '../Widgets/RatingsAllContainers.dart';
import '../Widgets/ScreenShotsContainer.dart';
import '../Widgets/SimilarMoviesContainer.dart';
import '../Widgets/SummaryContainer.dart';
import '../Widgets/genere.dart';
import '../Widgets/watchCustomButton.dart';
import '../Widgets/MovieCastContainer.dart';

class MovieDetailsScreen extends StatelessWidget {
  final List<Map<String, String>> allMovies;
  final List<Map<String, String>> castList;

  MovieDetailsScreen(
      {super.key, required this.allMovies, required this.castList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121312),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MoviePosterDetailsContainer(),
            watchCustomButton(),
            RatingsAllContainers(),
            ScreenShotsContainer(),
            SimilarMoviesContainer(allMovies: allMovies),
            SummaryContainer(),
            MovieCastContainer(castList: castList),
            MovieGenere(),
          ],
        ),
      ),
    );
  }
}
