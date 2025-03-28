// movie_suggestions_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Domain/Models/movie.dart';
import 'package:movies_app/MovieSuggestionsStuff/MovieSuggestionsRepository.dart';

class MovieSuggestionsCubit extends Cubit<List<Movie>> {
  final MovieSuggestionsRepository repository;

  MovieSuggestionsCubit({required this.repository}) : super([]);

  Future<void> loadSuggestions(int movieId) async {
    try {
      final suggestions = await repository.getMovieSuggestions(movieId);
      emit(suggestions);
    } catch (e) {
      emit([]);
    }
  }
}