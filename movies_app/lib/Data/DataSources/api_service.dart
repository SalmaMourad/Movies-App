import 'package:dio/dio.dart';
import 'package:movies_app/Data/Responses/movie_response.dart';
import 'package:movies_app/asalmaaaaaaaaaaaaaaa/movie_details_response.dart';
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

  //  @GET("movie_details.json")
  // Future<MovieDetailsModel> getMovieDetailsinfo(
  //     @Query("movie_id") int movieId,
  //     @Query("with_images") bool withImages,
  //     @Query("with_cast") bool withCast);

       // ✅ New method to fetch specific movie details
  @GET("movie_details.json")
  Future<MovieDetailsResponse> getMovieDetailsinfo({
    @Query("movie_id") required int movieId,
    @Query("with_images") bool? withImages,
    @Query("with_cast") bool? withCast,
  });
@GET("movie_suggestions.json")
Future<MovieResponse> getMovieSuggestions(
  @Query("movie_id") int movieId,
);

}
