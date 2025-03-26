
import 'package:dio/dio.dart';
import '../../Apis/Models/Responses/MoviesResponse/movie_response.dart';
import '../../Apis/WebServices/api_service.dart';

class MovieRepository {
  final ApiService apiService;

  MovieRepository({required this.apiService});

  Future<MovieResponse> fetchMovies({int? limit, int? page, String? genre}) async {
    return await apiService.getMovies(
      limit: limit ?? 20,
      page: page ?? 1,
      genre: genre,
    );
  }
}
// import 'package:dio/dio.dart';
// import '../Apis/Models/Responses/MoviesResponse/movie_response.dart';
// import '../Apis/WebServices/api_service.dart';
// // import 'api_service.dart';
// // import 'Models/Responses/MoviesResponse/movie_response.dart';

// class MovieRepository {
//   final ApiService apiService;

//   MovieRepository({required this.apiService}); // Accept ApiService

//   Future<MovieResponse> fetchMovies({int? limit, int? page, String? genre}) async {
//     return await apiService.getMovies(
//       limit: limit ?? 20,
//       page: page ?? 1,
//       genre: genre,
//     );
//   }
// }

// // import 'package:dio/dio.dart';
// // import '../Apis/Models/Responses/MoviesResponse/movie_response.dart';
// // import '../Apis/WebServices/api_service.dart';
// // // import 'movie_response.dart';

// // class MovieRepository {
// //   late ApiService _apiService;

// //   MovieRepository() {
// //     final dio = Dio();
// //     _apiService = ApiService(dio);
// //   }

// //   Future<List<Movie>?> fetchMovies({int limit = 20, int page = 1}) async {
// //     try {
// //       final response = await _apiService.getMovies(
        
// //         // limit, page, null, null, null, null, "rating", "desc", false
        
// //          limit: 20, // Adjust limit as needed
// //         page: 1, 
// //         quality: "720p",
// //         minimumRating: 0,
// //         queryTerm: "", // Empty means fetch all
// //         genre: '', // Genre filter applied here
// //         sortBy: "year",
// //         orderBy: "desc",
// //         withRtRatings: true,
// //         );
// //       return response.data?.movies;
// //     } catch (e) {
// //       print("Error fetching movies: $e");
// //       return null;
// //     }
// //   }
// // }
