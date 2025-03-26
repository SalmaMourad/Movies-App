
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Apis/Models/Responses/MoviesResponse/movie_response.dart';
import 'movie_repository.dart';

class MovieCubit extends Cubit<List<Movie>> {
  final MovieRepository movieRepository;

  MovieCubit(this.movieRepository) : super([]);
void loadMovies({int? limit, int? page, String? genre}) async {
  try {
    final movieResponse = await movieRepository.fetchMovies(
      limit: limit,
      page: page,
      genre: genre,
    );
    emit(movieResponse.data?.movies ?? []);  // ✅ Corrected access
  } catch (e) {
    print("Error fetching movies: $e");
    emit([]);
  }
}
}


//   void loadMovies({int? limit, int? page, String? genre}) async {
//     try {
//       final movieResponse = await movieRepository.fetchMovies(
//         limit: limit,
//         page: page,
//         genre: genre,
//       );
//       emit(movieResponse.movies ?? []);
//     } catch (e) {
//       print("Error fetching movies: $e");
//       emit([]);
//     }
//   }
// }
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../Apis/Models/Responses/MoviesResponse/movie_response.dart';
// import 'movie_repository.dart';
// // import 'Models/Responses/MoviesResponse/movie_response.dart';

// class MovieCubit extends Cubit<MovieResponse?> {
//   final MovieRepository movieRepository;

//   MovieCubit(this.movieRepository) : super(null);

//   void loadMovies({int? limit, int? page, String? genre}) async {
//     try {
//       final movies = await movieRepository.fetchMovies(
//         limit: limit,
//         page: page,
//         genre: genre,
//       );
//       emit(movies);
//     } catch (e) {
//       print("Error fetching movies: $e");
//     }
//   }
// }

// import 'package:flutter_bloc/flutter_bloc.dart';
// // import '../Apis/api_service.dart';
// import '../Apis/Models/Responses/MoviesResponse/movie_response.dart';
// import 'package:dio/dio.dart';

// import '../Apis/WebServices/api_service.dart';

// class MovieCubit extends Cubit<List<Movie>> {
//   final ApiService apiService;

//   MovieCubit(this.apiService) : super([]);

//   Future<void> fetchMovies({String? selectedGenre}) async {
//     try {
//       final response = await apiService.getMovies(
//         limit: 20, // Adjust limit as needed
//         page: 1, 
//         quality: "720p",
//         minimumRating: 0,
//         queryTerm: "", // Empty means fetch all
//         genre: selectedGenre, // Genre filter applied here
//         sortBy: "year",
//         orderBy: "desc",
//         withRtRatings: true,
//       );

//       emit(response.data?.movies ?? []);
//     } catch (e) {
//       print("Error fetching movies: $e");
//       emit([]);
//     }
//   }
// }

// // import 'package:flutter_bloc/flutter_bloc.dart';
// // // import '../Apis/api_service.dart';
// // import '../Apis/Models/Responses/MoviesResponse/movie_response.dart';
// // import 'package:dio/dio.dart';

// // import '../Apis/WebServices/api_service.dart';

// // class MovieCubit extends Cubit<List<Movie>> {
// //   final ApiService apiService;

// //   MovieCubit(this.apiService) : super([]);

// //   Future<void> fetchMovies({String? genre}) async {
// //     try {
// //       final response = await apiService.getMovies(genre: genre);
// //       emit(response.data?.movies ?? []);
// //     } catch (e) {
// //       print("Error fetching movies: $e");
// //       emit([]);
// //     }
// //   }
// // }

// // // import 'package:flutter_bloc/flutter_bloc.dart';

// // // import '../Apis/Models/Responses/MoviesResponse/movie_response.dart';
// // // import 'movie_repository.dart';
// // // // import 'movie_response.dart';

// // // class MovieCubit extends Cubit<List<Movie>> {
// // //   final MovieRepository _repository;

// // //   MovieCubit(this._repository) : super([]);

// // //   Future<void> loadMovies() async {
// // //     final movies = await _repository.fetchMovies();
// // //     if (movies != null) {
// // //       emit(movies);
// // //     }
// // //   }
// // // }
