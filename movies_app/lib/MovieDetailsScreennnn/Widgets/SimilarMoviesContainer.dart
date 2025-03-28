import 'package:flutter/material.dart';

import '../../CustomWidgetsReapeted/MoviesGrid.dart';

class SimilarMoviesContainer extends StatelessWidget {
  const SimilarMoviesContainer({
    super.key,
    required this.allMovies,
  });

  final List<Map<String, String>> allMovies;

  @override
  Widget build(BuildContext context) {
    return Container(
        // margin: EdgeInsets.symmetric(horizontal: 10),

        // color: Colors.amber,
        height: 375,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  textAlign: TextAlign.start,
                  '  Similar',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Flexible(child: MoviesGrid(movies: allMovies)),
          ],
        ));
  }
}
