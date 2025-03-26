import '../../domain/repository/movie_repository.dart';
import '../../domain/entities/movie.dart';
import '../sources/api_service.dart';

class MovieRepositoryImpl implements MovieRepository {
  final ApiService apiService;

  MovieRepositoryImpl({required this.apiService});

  @override
  Future<List<Movie>> getMovies({int? limit, int? page, String? genre}) async {
    try {
      final response = await apiService.getMovies(
        limit: limit ?? 20,
        page: page ?? 1,
        genre: genre,
        sortBy: "rating",
        orderBy: "desc",
      );

      print("Raw API Response: ${response.toJson()}");  // ✅ Debug response

      return response.data?.movies ?? [];
    } catch (e) {
      print("Error fetching movies: $e");
      return [];
    }
  }
}

// import '../../domain/repository/movie_repository.dart';
// import '../../domain/entities/movie.dart';
// import '../models/movie_model.dart';
// import '../sources/api_service.dart';

// class MovieRepositoryImpl implements MovieRepository {
//   final ApiService apiService;

//   MovieRepositoryImpl({required this.apiService});

//   @override
//   Future<List<Movie>> getMovies({int? limit, int? page, String? genre}) async {
//     try {
//       final response = await apiService.getMovies(
//         limit: limit ?? 20,
//         page: page ?? 1,
//         genre: genre,
//         sortBy: "rating",
//         orderBy: "desc",
//       );

//       if (response.data?.movies == null) return []; // ✅ Handle null case

//       // ✅ Ensure parsing as MovieModel first
//       final List<MovieModel> movieModels = (response.data!.movies as List)
//           .map((movieJson) => MovieModel.fromJson(movieJson))
//           .toList();

//       return movieModels; // ✅ No need to map to Movie again, since MovieModel extends Movie
//     } catch (e) {
//       print("Error fetching movies: $e");
//       return [];
//     }
//   }
// }

// // import '../../domain/repository/movie_repository.dart';
// // import '../../domain/entities/movie.dart';
// // import '../models/movie_model.dart'; // ✅ Import MovieModel
// // import '../sources/api_service.dart';

// // class MovieRepositoryImpl implements MovieRepository {
// //   final ApiService apiService;

// //   MovieRepositoryImpl({required this.apiService});

// //   @override
// //   Future<List<Movie>> getMovies({int? limit, int? page, String? genre}) async {
// //     try {
// //       final response = await apiService.getMovies(
// //         limit: limit ?? 20,
// //         page: page ?? 1,
// //         genre: genre,
// //         sortBy: "rating",
// //         orderBy: "desc",
// //       );

// //       // ✅ Safely parse the movie list
// //       final List<MovieModel> movieModels = (response.data?.movies as List)
// //           .map((movieJson) => MovieModel.fromJson(movieJson)) // Convert JSON to MovieModel
// //           .toList();

// //       // ✅ Convert MovieModel list to Movie entity list
// //       return movieModels.map((movieModel) => Movie(
// //             id: movieModel.id,
// //             title: movieModel.title,
// //             description: movieModel.description,
// //             largeCoverImage: movieModel.largeCoverImage,
// //             rating: movieModel.rating,
// //             genres: movieModel.genres,
// //           )).toList();
// //     } catch (e) {
// //       print("Error fetching movies: $e");
// //       return []; // Return an empty list on error
// //     }
// //   }
// // }

// // // import '../../domain/repository/movie_repository.dart';
// // // import '../../domain/entities/movie.dart';
// // // import '../models/movie_model.dart'; // ✅ Import MovieModel
// // // import '../sources/api_service.dart';

// // // class MovieRepositoryImpl implements MovieRepository {
// // //   final ApiService apiService;

// // //   MovieRepositoryImpl({required this.apiService});

// // //   @override
// // //   Future<List<Movie>> getMovies({int? limit, int? page, String? genre}) async {
// // //     final response = await apiService.getMovies(
// // //       limit: limit ?? 20,
// // //       page: page ?? 1,
// // //       genre: genre,
// // //       sortBy: "rating",  // ✅ Sort movies by rating
// // //       orderBy: "desc",    // ✅ Order by highest rating
// // //     );

// // //     // Ensure response.data?.movies is a List<MovieModel>
// // //     final List<MovieModel> movieModels = (response.data?.movies ?? []).cast<MovieModel>();

// // //     // Convert MovieModel to Movie Entity
// // //     return movieModels.map((movieModel) => Movie(
// // //           id: movieModel.id,
// // //           title: movieModel.title,
// // //           description: movieModel.description,
// // //           largeCoverImage: movieModel.largeCoverImage,
// // //           rating: movieModel.rating,
// // //           genres: movieModel.genres,
// // //         )).toList();
// // //   }
// // // }

// // // // import '../../domain/repository/movie_repository.dart';
// // // // import '../../domain/entities/movie.dart';
// // // // import '../models/movie_model.dart'; // ✅ Import MovieModel
// // // // import '../sources/api_service.dart';

// // // // class MovieRepositoryImpl implements MovieRepository {
// // // //   final ApiService apiService;

// // // //   MovieRepositoryImpl({required this.apiService});

// // // //   @override
// // // //   Future<List<Movie>?> getMovies({int? limit, int? page, String? genre}) async {
// // // //     final response = await apiService.getMovies(
// // // //       limit: limit ?? 20,
// // // //       page: page ?? 1,
// // // //       genre: genre,
// // // //       sortBy: "rating",  // ✅ Sort movies by rating
// // // //       orderBy: "desc",    // ✅ Order by highest rating
// // // //     );

// // // //     // Ensure response.data?.movies is properly typed
// // // //     final List<MovieModel>? movieModels = response.data?.movies?.cast<MovieModel>();

// // // //     // Convert MovieModel to Movie Entity
// // // //     return movieModels?.map((movieModel) => Movie(
// // // //           id: movieModel.id,
// // // //           title: movieModel.title,
// // // //           description: movieModel.description,
// // // //           largeCoverImage: movieModel.largeCoverImage,
// // // //           rating: movieModel.rating,
// // // //           genres: movieModel.genres,
// // // //         )).toList();
// // // //   }
// // // // }

// // // // // import '../../domain/repository/movie_repository.dart';
// // // // // import '../../domain/entities/movie.dart';
// // // // // import '../sources/api_service.dart';

// // // // // class MovieRepositoryImpl implements MovieRepository {
// // // // //   final ApiService apiService;

// // // // //   MovieRepositoryImpl({required this.apiService});

// // // // //   @override
// // // // //   Future<List<Movie>?> getMovies({int? limit, int? page, String? genre}) async {
// // // // //     final response = await apiService.getMovies(
// // // // //       limit: limit ?? 20,
// // // // //       page: page ?? 1,
// // // // //       genre: genre,
// // // // //       sortBy: "rating",  // ✅ Sort movies by rating
// // // // //       orderBy: "desc",    // ✅ Order by highest rating
// // // // //     );
// // // // //     return response.data?.movies ?? [];
// // // // //   }
// // // // // }

