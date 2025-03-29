import 'package:flutter/material.dart';
import 'package:movies_app/Domain/Models/movie.dart';
import 'package:movies_app/MovieDetailsScreennnn/screen/movie_details_screen_final.dart';
import 'package:movies_app/UI%20Screens/BrowserScreen/Screens/movie_list_screen.dart';

Widget MoviesCategoryHomeWidget({
  required BuildContext context,
  required String title,
  required List<Movie> movies,
}) {
  if (movies.isEmpty) return SizedBox();

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieListScreen(),
                  ),
                );
              },
              child: Text(
                "See More >",
                style: TextStyle(color: Colors.amber),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 279,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          itemCount: movies.length > 5 ? 5 : movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MovieDetailsScreen(movieId: movie.id),
                      ),
                    );
                  },
                  child: MovieCard(
                      movieImagePath: movie.largeCoverImage ?? "",
                      movieRating: "${movie.rating}",
                      movieName: movie.title)),
            );
          },
        ),
      ),
      SizedBox(height: 16),
    ],
  );
}
