import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/newCodeWithCleanArc/ui/screens/movie_list_screen.dart';
import 'data/sources/api_service.dart';
import 'data/repository/movie_repository_impl.dart';
import 'domain/usecases/get_movies_usecase.dart';
import 'ui/cubit/movie_cubit.dart';
// import 'presentation/cubit/movie_cubit.dart';
// import 'presentation/screens/movie_list_screen.dart';

void main() {
  final dio = Dio();
  final apiService = ApiService(dio);
  final movieRepository = MovieRepositoryImpl(apiService: apiService);
  final getMoviesUseCase = GetMoviesUseCase(movieRepository);

  runApp(MyApp(getMoviesUseCase: getMoviesUseCase));
}

class MyApp extends StatelessWidget {
  final GetMoviesUseCase getMoviesUseCase;

  MyApp({required this.getMoviesUseCase});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieCubit(getMoviesUseCase)..loadMovies(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MovieListScreen(),
      ),
    );
  }
}
