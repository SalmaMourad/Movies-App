import 'package:movies_app/MovieDetailsScreennnn/movie_details_response.dart';
import '../Data/DataSources/api_service.dart';

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
