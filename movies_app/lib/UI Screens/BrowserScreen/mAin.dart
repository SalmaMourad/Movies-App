import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/Data/Repositories/search_repository_implm.dart';
import 'package:movies_app/UI%20Screens/BrowserScreen/Screens/movie_list_screen.dart';
import 'package:movies_app/UI%20Screens/SearchScreen/Cubit/search_cubit.dart';
import '../../Data/DataSources/api_service.dart';
import '../../Data/Repositories/movie_repository_impl.dart';
// import '../../Data/Repositories/search_repository_impl.dart';
import '../../Domain/UseCases/get_movies_usecase.dart';
import '../../Domain/UseCases/search_movies_usecase.dart';
import '../SearchScreen/Screen/search_screen.dart';
import 'Cubit/movie_cubit.dart';
// import 'Cubit/search_cubit.dart';

void main() {
  final dio = Dio();
  final apiService = ApiService(dio);

  // Initialize Movies
  final movieRepository = MovieRepositoryImpl(apiService: apiService);
  final getMoviesUseCase = GetMoviesUseCase(movieRepository);

  // Initialize Search
  final searchRepository = SearchRepositoryImpl(apiService: apiService);
  final searchMoviesUseCase = SearchMoviesUseCase(searchRepository);

  runApp(MyApp(
    getMoviesUseCase: getMoviesUseCase,
    searchMoviesUseCase: searchMoviesUseCase,
  ));
}

class MyApp extends StatelessWidget {
  final GetMoviesUseCase getMoviesUseCase;
  final SearchMoviesUseCase searchMoviesUseCase;

  MyApp({required this.getMoviesUseCase, required this.searchMoviesUseCase});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => MovieCubit(getMoviesUseCase)..loadMovies()),
        BlocProvider(
            create: (context) =>
                SearchCubit(searchMoviesUseCase: searchMoviesUseCase)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SearchScreen(), //MovieListScreen
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:dio/dio.dart';
// import 'package:movies_app/UI%20Screens/BrowserScreen/Screens/movie_list_screen.dart';
// import '../../Data/DataSources/api_service.dart';
// import '../../Data/Repositories/movie_repository_impl.dart';
// import '../../Domain/UseCases/get_movies_usecase.dart';
// import 'Cubit/movie_cubit.dart';
// // import 'presentation/cubit/movie_cubit.dart';
// // import 'presentation/screens/movie_list_screen.dart';

// void main() {
//   final dio = Dio();
//   final apiService = ApiService(dio);
//   final movieRepository = MovieRepositoryImpl(apiService: apiService);
//   final getMoviesUseCase = GetMoviesUseCase(movieRepository);

//   runApp(MyApp(getMoviesUseCase: getMoviesUseCase));
// }

// class MyApp extends StatelessWidget {
//   final GetMoviesUseCase getMoviesUseCase;

//   MyApp({required this.getMoviesUseCase});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => MovieCubit(getMoviesUseCase)..loadMovies(),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: MovieListScreen(),
//       ),
//     );
//   }
// }
