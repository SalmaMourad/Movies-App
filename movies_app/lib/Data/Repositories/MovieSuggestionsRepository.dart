// movie_suggestions_repository.dart
import 'package:movies_app/Data/DataSources/api_service.dart';
import 'package:movies_app/Data/Responses/movie_response.dart';
import 'package:movies_app/Domain/Models/movie.dart';

class MovieSuggestionsRepository {
  final ApiService apiService;

  MovieSuggestionsRepository({required this.apiService});



  Future<List<Movie>> getMovieSuggestions(int movieId) async {
    try {
      final response = await apiService.getMovieSuggestions(movieId: movieId);
      return response.data?.movies ?? [];
    } catch (e) {
      print("Error fetching movie suggestions: $e");
      return [];
    }
  }
}