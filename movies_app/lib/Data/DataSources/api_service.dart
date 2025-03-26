import 'package:dio/dio.dart';
import 'package:movies_app/Data/Responses/movie_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://yts.mx/api/v2/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("list_movies.json")
  Future<MovieResponse> getMovies({
    @Query("limit") int? limit = 60,//was 20
    @Query("page") int? page = 1,
    @Query("quality") String? quality,
    @Query("minimum_rating") int? minimumRating,
    @Query("query_term") String? queryTerm,
    @Query("genre") String? genre,
    @Query("sort_by") String? sortBy = "rating",
    @Query("order_by") String? orderBy = "desc",
    @Query("with_rt_ratings") bool? withRtRatings = false,
  });
}

// import 'package:dio/dio.dart';
// import 'package:movies_app/gpt/data/models/movie_response.dart';
// import 'package:retrofit/retrofit.dart';
// // import '../Models/Responses/MoviesResponse/movie_response.dart';

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