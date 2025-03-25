import 'package:movies_app/Domain/Models/Movies_model.dart';
import 'package:movies_app/Domain/Repositories/movies_repo.dart';

import '../DataSources/movies_data_source_abstract.dart';

class MoviesRepoImplementation implements MoviesRepoAbst {
  MoviesDataSourceAbst moviesDataSourceAbst;
  MoviesRepoImplementation(this.moviesDataSourceAbst);
  @override
  Future<List<Movies>> getMovies() {
    // TODO: implement getMovies
    throw UnimplementedError();
  }
}
