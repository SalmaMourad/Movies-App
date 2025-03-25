import 'package:dio/dio.dart';
import '../Apis/Models/Responses/MoviesResponse/movie_response.dart';
import '../Apis/WebServices/api_service.dart';
// import 'movie_response.dart';

class MovieRepository {
  late ApiService _apiService;

  MovieRepository() {
    final dio = Dio();
    _apiService = ApiService(dio);
  }

  Future<List<Movie>?> fetchMovies({int limit = 20, int page = 1}) async {
    try {
      final response = await _apiService.getMovies(limit, page, null, null, null, null, "rating", "desc", false);
      return response.data?.movies;
    } catch (e) {
      print("Error fetching movies: $e");
      return null;
    }
  }
}
