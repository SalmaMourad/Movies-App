import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Domain/Models/movie.dart';
import 'package:movies_app/Data/Repositories/movie_details_repository.dart';
import 'package:movies_app/Data/Responses/movie_details_response.dart';
import 'package:movies_app/MovieDetailsScreennnn/cubit/MovieSuggestionsCubit.dart';
import 'package:movies_app/MovieDetailsScreennnn/screen/watchCustomButton.dart';
import 'package:movies_app/UI%20Screens/MovieDetailsScreennn/Widgets/MoviePosterDetailsContainer.dart';
import 'package:movies_app/UI%20Screens/MovieDetailsScreennn/Widgets/RatingsAllContainers.dart';
import 'package:movies_app/UI%20Screens/MovieDetailsScreennn/Widgets/ScreenShotsContainer.dart';
import 'package:movies_app/UI%20Screens/MovieDetailsScreennn/Widgets/SummaryContainer.dart';
import '../cubit/movie_details_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieDetailsScreen extends StatefulWidget {
  final int movieId;

  MovieDetailsScreen({required this.movieId});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MovieSuggestionsCubit>().loadSuggestions(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieDetailsCubit(
          RepositoryProvider.of<MovieDetailsRepository>(context))
        ..loadMovieDetails(widget.movieId),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black26,
          body: BlocBuilder<MovieDetailsCubit, MovieDetails?>(
            builder: (context, movie) {
              if (movie == null) {
                return const Center(child: CircularProgressIndicator());
              }
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // movie.id,movie.large_cover_image,movie.rating,movie.title
                    MoviePosterDetailsContainer(
                      imgUrl: movie.large_cover_image,
                      movieTitle: movie.title,
                      year: movie.year,
                    ),
                    watchCustomButton(
                      url: movie.torrents?.isNotEmpty == true
                          ? movie.torrents!.first.url
                          : null,
                    ),
                    RatingsAllContainers(
                      rating: movie.rating,
                      runtime: movie.runtime,
                      like_count: movie.like_count,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ScreenShotsContainer(
                      img1: movie.large_screenshot_image1,
                      img2: movie.large_screenshot_image2,
                      img3: movie.large_screenshot_image3,
                    ),

                    const Text(
                      ' Similar',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    BlocBuilder<MovieSuggestionsCubit, List<Movie>>(
                      builder: (context, suggestions) {
                        if (suggestions.isEmpty) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        return SizedBox(
                          height: 320,
                          child: GridView.builder(
                            scrollDirection: Axis.vertical,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.7, // item dimensions
                              crossAxisSpacing: 7, // columns
                              mainAxisSpacing: 7, // rows
                            ),
                            itemCount: suggestions.length,
                            itemBuilder: (context, index) {
                              final movie = suggestions[index];
                              print(
                                  'Movie: ${movie.title}, Image: ${movie.mediumCoverImage}');

                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MovieDetailsScreen(
                                        movieId: movie.id,
                                      ),
                                    ),
                                  );
                                },
                                child: Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 7),
                                    height: 279,
                                    width: 189,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff282A28),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: movie.largeCoverImage != null
                                        ? Image.network(
                                            movie.largeCoverImage ?? '',
                                            fit: BoxFit.cover,
                                          )
                                        : Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Icon(
                                                  Icons
                                                      .image_not_supported_outlined,
                                                  color: Colors.white),
                                              Text(
                                                textAlign: TextAlign.center,
                                                movie.title,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),

                    const SizedBox(
                      height: 5,
                    ),

                    SummaryContainer(
                      summaryText: movie.description_full,
                    ),

                    if (movie.cast != null) ...[
                      const Padding(
                        padding: EdgeInsets.all(9.0),
                        child: Text(
                          "Cast",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Column(
                        children: movie.cast!
                            .map((actor) => Container(
                                  margin: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: const Color(0xff282A28),
                                  ),
                                  child: ListTile(
                                    leading: actor.url_small_image != null
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                                actor.url_small_image!))
                                        : const Icon(Icons.image_not_supported),
                                    title: Text(
                                      "Name : ${actor.name}",
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    subtitle: Text(
                                      "Character : ${actor.character_name}" ??
                                          "",
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                      const Text(
                        ' Genres',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      if (movie.genres != null && movie.genres!.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.count(
                            shrinkWrap: true, // Fits content height
                            physics:
                                const NeverScrollableScrollPhysics(), // Disables scrolling
                            crossAxisCount: 3, // 3 genres per row
                            mainAxisSpacing: 8.0, // Vertical spacing
                            crossAxisSpacing: 8.0, // Horizontal spacing
                            childAspectRatio:
                                3.0, // Adjust chip width/height ratio
                            children: movie.genres!
                                .map(
                                  (genre) => genereContainer(
                                    genre: genre,
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                    ]
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

Future<void> _launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri)) {
    throw Exception('Could not launch $url');
  }
}

class genereContainer extends StatelessWidget {
  final String? genre;
  genereContainer({
    super.key,
    this.genre,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xff282A28),
      ),
      child: Center(
          child: Text(
        genre ?? "",
        style: const TextStyle(color: Colors.white),
      )),
    );
  }
}
