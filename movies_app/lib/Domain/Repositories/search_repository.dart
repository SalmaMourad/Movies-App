import '../../Domain/Models/movie.dart';

abstract class SearchRepository {
  Future<List<Movie>> searchMovies(String queryTerm);
}
