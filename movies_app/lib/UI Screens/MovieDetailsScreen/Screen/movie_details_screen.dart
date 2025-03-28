import 'package:flutter/material.dart';
import '../../../MovieDetailsScreennnn/Widgets/MoviePosterDetailsContainer.dart';
import '../../../MovieDetailsScreennnn/Widgets/RatingsAllContainers.dart';
import '../../../MovieDetailsScreennnn/Widgets/ScreenShotsContainer.dart';
import '../../../MovieDetailsScreennnn/Widgets/SimilarMoviesContainer.dart';
import '../../../MovieDetailsScreennnn/Widgets/SummaryContainer.dart';
import '../../../MovieDetailsScreennnn/Widgets/genere.dart';
import '../../../MovieDetailsScreennnn/Widgets/watchCustomButton.dart';
import '../../../MovieDetailsScreennnn/Widgets/MovieCastContainer.dart';

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
