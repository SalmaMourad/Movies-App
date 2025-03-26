import '../Repositories/movie_repository.dart';
import '../Models/movie.dart';

class GetMoviesUseCase {
  final MovieRepository repository;

  GetMoviesUseCase(this.repository);

  Future<List<Movie>> call({int? limit, int? page, String? genre}) {
    return repository.getMovies(limit: limit, page: page, genre: genre);
  }
}
