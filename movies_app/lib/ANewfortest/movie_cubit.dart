import 'package:flutter_bloc/flutter_bloc.dart';

import '../Apis/Models/Responses/MoviesResponse/movie_response.dart';
import 'movie_repository.dart';
// import 'movie_response.dart';

class MovieCubit extends Cubit<List<Movie>> {
  final MovieRepository _repository;

  MovieCubit(this._repository) : super([]);

  Future<void> loadMovies() async {
    final movies = await _repository.fetchMovies();
    if (movies != null) {
      emit(movies);
    }
  }
}
