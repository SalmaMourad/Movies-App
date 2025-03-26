import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Domain/Models/movie.dart';
import '../../../Domain/UseCases/get_movies_usecase.dart';

class MovieCubit extends Cubit<List<Movie>> {
  final GetMoviesUseCase getMoviesUseCase;

  MovieCubit(this.getMoviesUseCase) : super([]);

  void loadMovies({String? genre}) async {
    try {
      final movies = await getMoviesUseCase.call(genre: genre);
      emit(movies);
    } catch (e) {
      print("Error fetching movies: $e");
      emit([]);
    }
  }
}
