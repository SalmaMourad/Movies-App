import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/asalmaaaaaaaaaaaaaaa/movie_details_repository.dart';
import 'package:movies_app/asalmaaaaaaaaaaaaaaa/movie_details_screen.dart';
import '../../Data/DataSources/api_service.dart';
import '../../Data/Repositories/movie_repository_impl.dart';
void main() {
  final dio = Dio();
  final apiService = ApiService(dio);
  final movieRepository = MovieRepositoryImpl(apiService: apiService);
  final movieDetailsRepository = MovieDetailsRepository(apiService: apiService);

  runApp(MyApp(
    movieRepository: movieRepository,
    movieDetailsRepository: movieDetailsRepository,
  ));
}

class MyApp extends StatelessWidget {
  final MovieRepositoryImpl movieRepository;
  final MovieDetailsRepository movieDetailsRepository;
  

  MyApp({required this.movieRepository, required this.movieDetailsRepository});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: movieRepository),
        RepositoryProvider.value(value: movieDetailsRepository),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  MovieDetailsScreen(movieId: 15),
      ),
    );
  }
}

// import 'Cubit/search_cubit.dart';

// void main() {
//   final dio = Dio();
//   final apiService = ApiService(dio);

//   // Initialize Movies
//   final movieRepository = MovieRepositoryImpl(apiService: apiService);
//   final getMoviesUseCase = GetMoviesUseCase(movieRepository);
//   // final movieRepository = MovieRepositoryImpl(moviesApi);


//   // Initialize Search
//   final searchRepository = SearchRepositoryImpl(apiService: apiService);
//   final searchMoviesUseCase = SearchMoviesUseCase(searchRepository);

//   runApp(MyApp(
//     getMoviesUseCase: getMoviesUseCase,
//     searchMoviesUseCase: searchMoviesUseCase,
//   ));
// }

// class MyApp extends StatelessWidget {
//   final GetMoviesUseCase getMoviesUseCase;
//   final SearchMoviesUseCase searchMoviesUseCase;

//   MyApp({required this.getMoviesUseCase, required this.searchMoviesUseCase});

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(
//             create: (context) => MovieCubit(getMoviesUseCase)..loadMovies()),
//         BlocProvider(
//             create: (context) =>
//                 SearchCubit(searchMoviesUseCase: searchMoviesUseCase)),
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: MovieDetailsScreen(movieId: 10,), //MovieListScreen  SearchScreen
//       ),
//     );
//   }
// }