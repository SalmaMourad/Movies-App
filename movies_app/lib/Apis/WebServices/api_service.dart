// import 'package:dio/dio.dart';
// import 'package:retrofit/retrofit.dart';
// import '../Models/Responses/MoviesResponse/movie_response.dart';

// part 'api_service.g.dart';

// @RestApi(baseUrl: "https://yts.mx/api/v2/")
// abstract class ApiService {
//   factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

//   @GET("list_movies.json")
//   Future<MovieResponse> getMovies({
//     @Query("limit") int? limit,
//     @Query("page") int? page,
//     @Query("quality") String? quality,
//     @Query("minimum_rating") int? minimumRating,
//     @Query("query_term") String? queryTerm,
//     @Query("genre") String? genre,
//     @Query("sort_by") String? sortBy,
//     @Query("order_by") String? orderBy,
//     @Query("with_rt_ratings") bool? withRtRatings,
//   });
// }
// // import 'package:dio/dio.dart';
// // import 'package:retrofit/retrofit.dart';
// // import '../Models/Responses/MoviesResponse/movie_response.dart';

// // part 'api_service.g.dart';

// // @RestApi(baseUrl: "https://yts.mx/api/v2/")
// // abstract class ApiService {
// //   factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

// //   @GET("list_movies.json")
// //   Future<MovieResponse> getMovies({
// //     @Query("limit") int? limit,
// //     @Query("page") int? page,
// //     @Query("quality") String? quality,
// //     @Query("minimum_rating") int? minimumRating,
// //     @Query("query_term") String? queryTerm,
// //     @Query("genre") String? genre,
// //     @Query("sort_by") String? sortBy,
// //     @Query("order_by") String? orderBy,
// //     @Query("with_rt_ratings") bool? withRtRatings,
// //   });
// // }

// // // import 'package:dio/dio.dart';
// // // import 'package:retrofit/retrofit.dart';
// // // // import '../../ANewfortest/movie_response.dart';
// // // import '../Models/Responses/MoviesResponse/movie_response.dart';

// // // part 'api_service.g.dart';

// // // @RestApi(baseUrl: "https://yts.mx/api/v2/")
// // // abstract class ApiService {
// // //   factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

// // //   @GET("list_movies.json")
// // //   Future<MovieResponse> getMovies(
// // //     @Query("limit") int? limit,
// // //     @Query("page") int? page,
// // //     @Query("quality") String? quality,
// // //     @Query("minimum_rating") int? minimumRating,
// // //     @Query("query_term") String? queryTerm,
// // //     @Query("genre") String? genre,
// // //     @Query("sort_by") String? sortBy,
// // //     @Query("order_by") String? orderBy,
// // //     @Query("with_rt_ratings") bool? withRtRatings,
// // //   );
// // // }

// // // // flutter pub run build_runner build --delete-conflicting-outputs
