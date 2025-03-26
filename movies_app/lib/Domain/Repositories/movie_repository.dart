import 'package:movies_app/Domain/Models/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getMovies({int? limit, int? page, String? genre});
}
