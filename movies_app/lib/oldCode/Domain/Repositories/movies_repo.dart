import '../Models/Movies_model.dart';

abstract class MoviesRepoAbst {
  Future<List<Movies>> getMovies();
}
