import 'package:movies_app/Domain/Repositories/movies_repo.dart';

import '../Models/Movies_model.dart';

class GetMoviesUseCase {
  //const injection ->DI
  final MoviesRepoAbst moviesRepoAbst;
  GetMoviesUseCase(this.moviesRepoAbst);
  // Future<List<Movies>> invoke() {
  //   // usecase->repo(abstract)
  //   return null;
  // }
  //ERROR NOW 
}
