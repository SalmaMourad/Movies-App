import 'package:movies_app/Domain/Models/movie.dart';
import 'package:movies_app/MovieSuggestionsStuff/MovieSuggestionsRepository.dart';

class GetMovieSuggestionsUseCase {
  final MovieSuggestionsRepository repository;

  GetMovieSuggestionsUseCase(this.repository);

  Future<List<Movie>> call(int movieId) {
    return repository.getMovieSuggestions(movieId);
  }
}