import 'package:movies_app/Data/Responses/movie_response.dart';
import 'package:movies_app/Domain/Models/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getMovies({int? limit, int? page, String? genre});
   Future<MovieResponse> fetchMovieSuggestions(int movieId) ;
}

  //  Future<List<MovieSuggestion>> fetchMovieSuggestions(int movieId);
// }

// abstract class MovieRepository {
//   Future<List<Movie>> getMovies({int? limit, int? page, String? genre});
//    Future<List<MovieSuggestion>> fetchMovieSuggestions(int movieId);
// }
