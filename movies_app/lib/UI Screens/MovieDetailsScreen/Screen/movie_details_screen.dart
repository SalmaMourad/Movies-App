import 'package:flutter/material.dart';
import '../Widgets/MoviePosterDetailsContainer.dart';
import '../Widgets/RatingsAllContainers.dart';
import '../Widgets/ScreenShotsContainer.dart';
import '../Widgets/SimilarMoviesContainer.dart';
import '../Widgets/SummaryContainer.dart';
import '../Widgets/genere.dart';
import '../Widgets/watchCustomButton.dart';
import '../Widgets/MovieCastContainer.dart'; // Import the new cast widget

class MovieDetailsScreen extends StatelessWidget {
  final List<Map<String, String>> allMovies; // For testing
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
            MovieCastContainer(castList: castList), // Add the Cast Widget here
            MovieGenere(),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import '../Widgets/MoviePosterDetailsContainer.dart';
// import '../Widgets/RatingsAllContainers.dart';
// import '../Widgets/ScreenShotsContainer.dart';
// import '../Widgets/SimilarMoviesContainer.dart';
// import '../Widgets/SummaryContainer.dart';
// import '../Widgets/watchCustomButton.dart';

// class MovieDetailsScreen extends StatelessWidget {
//   final List<Map<String, String>> allMovies; //34an 23ml test bs

//   MovieDetailsScreen({super.key, required this.allMovies});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF121312),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             MoviePosterDetailsContainer(),
//             watchCustomButton(),
//             RatingsAllContainers(),
//             ScreenShotsContainer(),
//             SimilarMoviesContainer(allMovies: allMovies),
//             SummaryContainer()
//           ],
//         ),
//       ),
//     );
//   }
// }
