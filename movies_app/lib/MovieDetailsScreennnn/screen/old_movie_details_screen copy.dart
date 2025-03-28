// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:movies_app/MovieDetailsScreennnn/movie_details_repository.dart';
// import 'package:movies_app/MovieDetailsScreennnn/movie_details_response.dart';
// import 'package:movies_app/UI%20Screens/MovieDetailsScreennn/Widgets/MovieCastContainer.dart';
// import 'package:movies_app/UI%20Screens/MovieDetailsScreennn/Widgets/MoviePosterDetailsContainer.dart';
// import 'package:movies_app/UI%20Screens/MovieDetailsScreennn/Widgets/RatingsAllContainers.dart';
// import 'package:movies_app/UI%20Screens/MovieDetailsScreennn/Widgets/ScreenShotsContainer.dart';
// import 'package:movies_app/UI%20Screens/MovieDetailsScreennn/Widgets/SummaryContainer.dart';
// import 'package:movies_app/UI%20Screens/MovieDetailsScreennn/Widgets/genere.dart';
// import 'package:movies_app/UI%20Screens/MovieDetailsScreennn/Widgets/watchCustomButton.dart';
// // import 'package:url_launcher/url_launcher.dart';
// import 'movie_details_cubit.dart';

// class MovieDetailsScreen extends StatelessWidget {
//   final int movieId;

//   MovieDetailsScreen({required this.movieId});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => MovieDetailsCubit(
//           RepositoryProvider.of<MovieDetailsRepository>(context))
//         ..loadMovieDetails(movieId),
//       child: Scaffold(
//         backgroundColor: Colors.black26,
//         appBar: AppBar(title: Text("Movie Details")),
//         body: BlocBuilder<MovieDetailsCubit, MovieDetails?>(
//           builder: (context, movie) {
//             if (movie == null) {
//               return Center(child: CircularProgressIndicator());
//             }
//             return SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   MoviePosterDetailsContainer(
//                     imgUrl: movie.large_cover_image,
//                     movieTitle: movie.title,
//                     year: movie.year,
//                   ),
//                   watchCustomButton(),
//                   RatingsAllContainers(
//                     rating: movie.rating,
//                     runtime: movie.runtime,
//                     like_count: movie.like_count,
//                   ),
//                   ScreenShotsContainer(
//                     img1: movie.large_screenshot_image1,
//                     img2: movie.large_screenshot_image2,
//                     img3: movie.large_screenshot_image3,
//                   ),
//                   // SimilarMoviesContainer(allMovies: allMovies),
//                   SummaryContainer(
//                     summaryText: movie.description_full,
//                   ),
//                   // MovieCastContainer(castList: castList),
//                   // MovieGenere(),
//                   // Image.network(movie.large_cover_image ??
//                   //     "https://example.com/default.jpg"),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       movie.title,
//                       style:
//                           TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("Rating: ${movie.rating ?? "N/A"}"),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("like_count: ${movie.like_count ?? "N/A"}"),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("runtime: ${movie.runtime ?? "N/A"}"),
//                   ),
//                   if (movie.genres != null)
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Wrap(
//                         spacing: 8.0,
//                         children: movie.genres!
//                             .map((genre) => Chip(label: Text(genre)))
//                             .toList(),
//                       ),
//                     ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("Year: ${movie.year}"),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(movie.description_full),
//                   ),
//                   if (movie.cast != null) ...[
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                         "Cast",
//                         style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white),
//                       ),
//                     ),
//                     // Image.network(movie.large_screenshot_image1 ??
//                     //     "https://example.com/default.jpg"),
//                     // Image.network(movie.large_screenshot_image2 ??
//                     //     "https://example.com/default.jpg"),
//                     // Image.network(movie.large_screenshot_image3 ??
//                     //     "https://example.com/default.jpg"),
//                     Column(
//                       children: movie.cast!
//                           .map((actor) => Container(
//                                 margin: EdgeInsets.all(5),
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(15),
//                                   color: Colors.grey.shade800,
//                                 ),
//                                 child: ListTile(
//                                   leading: actor.url_small_image != null
//                                       ? ClipRRect(
//                                           borderRadius:
//                                               BorderRadius.circular(10),
//                                           child: Image.network(
//                                               actor.url_small_image!))
//                                       : Icon(Icons.image_not_supported),
//                                   title: Text(
//                                     "Name : ${actor.name}",
//                                     style: TextStyle(color: Colors.white),
//                                   ),
//                                   subtitle: Text(
//                                     "Character : ${actor.character_name}" ?? "",
//                                     style: TextStyle(color: Colors.white),
//                                   ),
//                                 ),
//                               ))
//                           .toList(),
//                     ),
//                     if (movie.torrents != null)
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text("Torrents",
//                                 style: TextStyle(
//                                     fontSize: 18, fontWeight: FontWeight.bold)),
//                             Column(
//                               children: movie.torrents!.map((torrent) {
//                                 return ListTile(
//                                   title: Text(
//                                       "${torrent.quality} - ${torrent.size}"),
//                                   subtitle: Text("Magnet: ${torrent.url}"),
//                                   onTap: () {
//                                     // Handle torrent click (e.g., copy URL)
//                                   },
//                                 );
//                               }).toList(),
//                             ),
//                           ],
//                         ),
//                       ),
//                   ]
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// // Navigator.push(
// //   context,
// //   MaterialPageRoute(
// //     builder: (context) => MovieDetailsScreen(movieId: movie.id),
// //   ),
// // );

// //                   ],
// //                 ],
// //               ),
// //             );
// //           },
// //         ),
// //       ),
// //     );
// //   }
// // }
