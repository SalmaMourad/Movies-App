import 'package:flutter/material.dart';
import 'package:movies_app/CustomWidgetsReapeted/movie_card.dart';

class MoviesGrid extends StatelessWidget {
  final List<Map<String, String>> movies;

  const MoviesGrid({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 7,
            mainAxisSpacing: 7,
            childAspectRatio: 0.7,
          ),
          itemCount: movies.length,
          itemBuilder: (context, index) {
            var movie = movies[index];
            return MovieCard(
              movieImagePath: movie["image"]!,
              movieRating: movie["rating"]!,
            );
          },
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:movies_app/CustomWidgetsReapeted/movie_card.dart';

// class MoviesGrid extends StatelessWidget {
//   const MoviesGrid({
//     super.key,
//     required this.moviesByCategory,
//     required this.categories,
//     required this.selectedCategoryIndex,
//   });

//   final Map<String, List<Map<String, String>>> moviesByCategory;
//   final List<String> categories;
//   final int selectedCategoryIndex;

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 8.0),
//         child: GridView.builder(
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 7,
//             mainAxisSpacing: 7,
//             childAspectRatio: 0.7,
//           ),
//           itemCount:
//               moviesByCategory[categories[selectedCategoryIndex]]!.length,
//           itemBuilder: (context, index) {
//             var movie =
//                 moviesByCategory[categories[selectedCategoryIndex]]![index];
//             return MovieCard(
//               movieImagePath: movie["image"]!,
//               movieRating: movie["rating"]!,
//             );
//           },
//         ),
//       ),
//     );
//   }
// }


// // class MoviesGrid extends StatelessWidget {
// //   const MoviesGrid({
// //     super.key,
// //     required this.moviesByCategory,
// //     required this.categories,
// //     required this.selectedCategoryIndex,
// //   });

// //   final Map<String, List<String>> moviesByCategory;
// //   final List<String> categories;
// //   final int selectedCategoryIndex;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Expanded(
// //       child: Padding(
// //         padding: const EdgeInsets.symmetric(horizontal: 8.0),
// //         child: GridView.builder(
// //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// //             crossAxisCount: 2,
// //             crossAxisSpacing: 7,
// //             mainAxisSpacing: 7,
// //             childAspectRatio: 0.7,
// //           ),
          
// //           itemCount:
// //               moviesByCategory[categories[selectedCategoryIndex]]!.length,
// //           itemBuilder: (context, index) {
// //                   var movie = moviesByCategory[categories[selectedCategoryIndex]]![index];

// //             return MovieCard(
// //               movieImagePath: moviesByCategory[
// //                   categories[selectedCategoryIndex]]![index],
// //               movieRating: '7.8',
// //             );
// //           },
// //         ),
// //       ),
// //     );
// //   }
// // }