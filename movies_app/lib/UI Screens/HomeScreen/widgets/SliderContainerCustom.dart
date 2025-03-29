
import 'package:flutter/material.dart';
import 'package:movies_app/Domain/Models/movie.dart';
import 'package:movies_app/MovieDetailsScreennnn/screen/movie_details_screen_final.dart';
import 'package:movies_app/UI%20Screens/BrowserScreen/Screens/movie_list_screen.dart';

class SliderContainerCustom extends StatelessWidget {
  const SliderContainerCustom({
    super.key,
    required this.featuredMovies,
  });

  final List<Movie> featuredMovies;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      color: Colors.blueGrey,
      child: Stack(
        children: [
          Container(
            height: 600,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.4), // Dark fade on top
                  Colors.black.withOpacity(1), // Transparent at the bottom
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'Assets/Images/Available Now.png',
                width: 220,
              ),
              SizedBox(
                height: 300,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: featuredMovies.length,
                    itemBuilder: (context, index) {
                      final movie = featuredMovies[index];
                      return InkWell(
                        onTap: () {
                           Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MovieDetailsScreen(movieId: movie.id),
                      ),
                    );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: MovieCard(
                              movieImagePath: movie.largeCoverImage ?? "",
                              movieRating: "${movie.rating}",
                              movieName: movie.title),
                        ),
                      );
                    }),
              ),
              Image.asset(
                'Assets/Images/Watch Now.png',
                width: 220,
              ),
            ],
          )
        ],
      ),
    );
  }
}
