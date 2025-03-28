import 'package:movies_app/Domain/Repositories/search_repository.dart';
import '../../Domain/Models/movie.dart';

class SearchMoviesUseCase {
  final SearchRepository repository;

  SearchMoviesUseCase(this.repository);

  Future<List<Movie>> call(String query) {
    return repository.searchMovies(query);
  }
}
