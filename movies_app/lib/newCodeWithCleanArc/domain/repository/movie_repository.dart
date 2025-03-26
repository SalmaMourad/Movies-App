import 'package:movies_app/newCodeWithCleanArc/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getMovies({int? limit, int? page, String? genre});
}
