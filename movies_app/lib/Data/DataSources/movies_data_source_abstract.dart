import '../../Domain/Models/Movies_model.dart';

abstract class MoviesDataSourceAbst {
  Future<List<Movies>> getMovies();
}
