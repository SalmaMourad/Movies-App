import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Domain/Models/movie.dart';
import '../../../Domain/UseCases/search_movies_usecase.dart';

class SearchCubit extends Cubit<List<Movie>> {
  final SearchMoviesUseCase searchMoviesUseCase;

  SearchCubit({required this.searchMoviesUseCase}) : super([]);

  void searchMovies(String query) async {
    try {
      final movies = await searchMoviesUseCase.call(query);
      emit(movies);
    } catch (e) {
      emit([]); // Emit empty list on error
    }
  }

  void clearSearch() {
    emit([]); // Clears search results when exiting the search screen
  }
}
//context.read<SearchCubit>().searchMovies("query");
