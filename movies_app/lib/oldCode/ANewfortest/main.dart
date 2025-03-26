
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'movie_cubit.dart';
import 'movie_list_screen copy.dart';
import 'movie_repository.dart';
import 'movie_list_screen.dart';
import '../../Apis/WebServices/api_service.dart';

void main() {
  final dio = Dio();
  final apiService = ApiService(dio);
  final movieRepository = MovieRepository(apiService: apiService);

  runApp(MyApp(movieRepository: movieRepository));
}

class MyApp extends StatelessWidget {
  final MovieRepository movieRepository;

  MyApp({required this.movieRepository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieCubit(movieRepository)..loadMovies(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MovieListScreen(),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:dio/dio.dart';
// import 'package:movies_app/ANewfortest/movie_list_screen%20copy.dart';
// // import 'api_service.dart';
// import '../Apis/WebServices/api_service.dart';
// import 'movie_cubit.dart';
// import 'movie_repository.dart';
// import 'movie_list_screen.dart';

// void main() {
//   final dio = Dio();
//   final apiService = ApiService(dio); // Initialize ApiService
//   final movieRepository = MovieRepository(apiService: apiService); // Pass to repository

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
