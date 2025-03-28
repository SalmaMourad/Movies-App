import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/MovieDetailsScreennnn/movie_details_repository.dart';
import 'package:movies_app/MovieDetailsScreennnn/movie_details_response.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'movie_details_cubit.dart';

class MovieDetailsScreen extends StatelessWidget {
  final int movieId;

  MovieDetailsScreen({required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieDetailsCubit(
          RepositoryProvider.of<MovieDetailsRepository>(context))
        ..loadMovieDetails(movieId),
      child: Scaffold(
        appBar: AppBar(title: Text("Movie Details")),
        body: BlocBuilder<MovieDetailsCubit, MovieDetails?>(
          builder: (context, movie) {
            if (movie == null) {
              return Center(child: CircularProgressIndicator());
            }
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(movie.large_cover_image ??
                      "https://example.com/default.jpg"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      movie.title,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Rating: ${movie.rating ?? "N/A"}"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("like_count: ${movie.like_count ?? "N/A"}"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("runtime: ${movie.runtime ?? "N/A"}"),
                  ),
                  if (movie.genres != null)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Wrap(
                        spacing: 8.0,
                        children: movie.genres!
                            .map((genre) => Chip(label: Text(genre)))
                            .toList(),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Year: ${movie.year}"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(movie.description_full),
                  ),
                  if (movie.cast != null) ...[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Cast:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Image.network(movie.large_screenshot_image1 ??
                        "https://example.com/default.jpg"),
                    Image.network(movie.large_screenshot_image2 ??
                        "https://example.com/default.jpg"),
                    Image.network(movie.large_screenshot_image3 ??
                        "https://example.com/default.jpg"),
                    Column(
                      children: movie.cast!
                          .map((actor) => ListTile(
                                leading: actor.url_small_image != null
                                    ? Image.network(actor.url_small_image!)
                                    : null,
                                title: Text(actor.name),
                                subtitle: Text(actor.character_name ?? ""),
                              ))
                          .toList(),
                    ),
                    if (movie.torrents != null)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Torrents",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            Column(
                              children: movie.torrents!.map((torrent) {
                                return ListTile(
                                  title: Text(
                                      "${torrent.quality} - ${torrent.size}"),
                                  subtitle: Text("Magnet: ${torrent.url}"),
                                  onTap: () {
                                    // Handle torrent click (e.g., copy URL)
                                  },
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                  ]
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// Navigator.push(
//   context,
//   MaterialPageRoute(
//     builder: (context) => MovieDetailsScreen(movieId: movie.id),
//   ),
// );

//                   ],
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
