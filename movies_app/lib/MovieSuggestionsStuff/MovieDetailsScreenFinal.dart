// movie_details_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Domain/Models/movie.dart';
import 'package:movies_app/MovieSuggestionsStuff/MovieSuggestionsCubit.dart';

class MovieDetailsScreen extends StatefulWidget {
  final int movieId;

  const MovieDetailsScreen({Key? key, required this.movieId}) : super(key: key);

  @override
  _MovieDetailsScreenState createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MovieSuggestionsCubit>().loadSuggestions(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Movie Details')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Your existing movie details widgets here...

            // Add suggestions section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'You Might Also Like',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  BlocBuilder<MovieSuggestionsCubit, List<Movie>>(
                    builder: (context, suggestions) {
                      if (suggestions.isEmpty) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return SizedBox(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: suggestions.length,
                          itemBuilder: (context, index) {
                            final movie = suggestions[index];
                            print(
                                'Movie: ${movie.title}, Image: ${movie.mediumCoverImage}');

                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: GestureDetector(
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
                                child: Column(
                                  children: [
                                    Container(
                                      child: movie.largeCoverImage != null
                                          ? Image.network(
                                              movie.largeCoverImage ?? '',
                                            )
                                          : Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons
                                                  .image_not_supported_outlined),
                                                  Text(movie.title,)
                                            ],
                                          ),
                                      width: 120,
                                      height: 160,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        // image: DecorationImage(
                                        //   image: NetworkImage(
                                        //     movie.largeCoverImage ??
                                        //         '',
                                        //   ),
                                        //   fit: BoxFit.cover,
                                        // ),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    SizedBox(
                                      width: 120,
                                      child: Text(
                                        movie.title,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    // Image.network(
                                    //         movie.largeCoverImage ??
                                    //             '',
                                    //       ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
