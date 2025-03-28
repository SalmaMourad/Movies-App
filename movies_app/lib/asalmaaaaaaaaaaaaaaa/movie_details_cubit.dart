import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/asalmaaaaaaaaaaaaaaa/movie_details_response.dart';
import 'movie_details_repository.dart';

class MovieDetailsCubit extends Cubit<MovieDetails?> {
  final MovieDetailsRepository movieDetailsRepository;

  MovieDetailsCubit(this.movieDetailsRepository) : super(null);

  void loadMovieDetails(int movieId) async {
    try {
      final response = await movieDetailsRepository.fetchMovieDetails(movieId);
      emit(response.data?.movie);
    } catch (e) {
      print("Error fetching movie details: $e");
      emit(null);
    }
  }
}
