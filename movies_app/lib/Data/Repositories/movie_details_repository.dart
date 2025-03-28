import 'package:movies_app/Data/Responses/movie_details_response.dart';
import '../DataSources/api_service.dart';

class MovieDetailsRepository {
  final ApiService apiService;

  MovieDetailsRepository({required this.apiService});

  Future<MovieDetailsResponse> fetchMovieDetails(int movieId) async {
    return await apiService.getMovieDetailsinfo(
      movieId: movieId,
      withImages: true,
      withCast: true,
    );
  }
}
