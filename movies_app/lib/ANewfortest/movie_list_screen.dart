// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'movie_cubit.dart';
// import 'movie_response.dart';

// class MovieListScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Movies")),
//       body: BlocBuilder<MovieCubit, List<Movie>>(
//         builder: (context, movies) {
//           if (movies.isEmpty) {
//             return Center(child: CircularProgressIndicator());
//           }
//           return ListView.builder(
//             itemCount: movies.length,
//             itemBuilder: (context, index) {
//               final movie = movies[index];
//               return ListTile(
//                 leading: movie.small_cover_image != null
//                     ? Image.network(movie.small_cover_image!)
//                     : Icon(Icons.movie),
//                 title: Text(movie.title),
//                 subtitle: Text("Rating: ${movie.rating}"),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
