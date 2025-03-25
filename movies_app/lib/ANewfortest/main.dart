// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'movie_cubit.dart';
// import 'movie_repository.dart';
// import 'movie_list_screen.dart';

// void main() {
//   final movieRepository = MovieRepository();
//   runApp(MyApp(movieRepository: movieRepository));
// }

// class MyApp extends StatelessWidget {
//   final MovieRepository movieRepository;

//   MyApp({required this.movieRepository});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => MovieCubit(movieRepository)..loadMovies(),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: MovieListScreen(),
//       ),
//     );
//   }
// }
