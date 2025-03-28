//all code get movie combinedd
// // api_service.dart
// import 'package:dio/dio.dart';
// import 'package:movies_app/Data/Responses/movie_response.dart';
// import 'package:movies_app/asalmaaaaaaaaaaaaaaa/movie_details_response.dart';
// import 'package:retrofit/retrofit.dart';

// part 'api_service.g.dart';

// @RestApi(baseUrl: "https://yts.mx/api/v2/")
// abstract class ApiService {
//   factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

//   @GET("list_movies.json")
//   Future<MovieResponse> getMovies({
//     @Query("limit") int? limit = 60, //was 20
//     @Query("page") int? page = 1,
//     @Query("quality") String? quality,
//     @Query("minimum_rating") int? minimumRating,
//     @Query("query_term") String? queryTerm,
//     @Query("genre") String? genre,
//     @Query("sort_by") String? sortBy = "rating",
//     @Query("order_by") String? orderBy = "desc",
//     @Query("with_rt_ratings") bool? withRtRatings = false,
//   });

//   @GET("movie_details.json")
//   Future<MovieDetailsResponse> getMovieDetailsinfo({
//     @Query("movie_id") required int movieId,
//     @Query("with_images") bool? withImages,
//     @Query("with_cast") bool? withCast,
//   });
// }

// //movie_model.dart

// import 'package:json_annotation/json_annotation.dart';
// import '../../Domain/Models/movie.dart';

// part 'movie_model.g.dart';

// @JsonSerializable()
// class MovieModel extends Movie {
//   @JsonKey(name: 'id')
//   final int id;

//   @JsonKey(name: 'title')
//   final String title;

//   @JsonKey(name: 'description_full')
//   final String? description;

//   @JsonKey(name: 'large_cover_image')
//   final String? largeCoverImage;

//   @JsonKey(name: 'rating')
//   final double? rating;

//   @JsonKey(name: 'genres')
//   final List<String>? genres;

//   MovieModel({
//     required this.id,
//     required this.title,
//     this.description,
//     this.largeCoverImage,
//     this.rating,
//     this.genres,
//   }) : super(
//           id: id,
//           title: title,
//           description: description,
//           largeCoverImage: largeCoverImage,
//           rating: rating,
//           genres: genres,
//         );

//   factory MovieModel.fromJson(Map<String, dynamic> json) =>
//       _$MovieModelFromJson(json);

//   Map<String, dynamic> toJson() => _$MovieModelToJson(this);
// }

// // movie_repository_impl.dart
// import 'package:movies_app/Data/Responses/movie_response.dart';

// import '../../Domain/Repositories/movie_repository.dart';
// import '../../Domain/Models/movie.dart';
// import '../DataSources/api_service.dart';

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

//       print("Raw API Response: ${response.toJson()}");  

//       return response.data?.movies ?? [];
//     } catch (e) {
//       print("Error fetching movies: $e");
//       return [];
//     }
//   }
   
// }

// import 'package:json_annotation/json_annotation.dart';
// import '../Models/movie_model.dart';

// part 'movie_response.g.dart';

// @JsonSerializable()
// class MovieResponse {
//   @JsonKey(name: "data")
//   final DataWrapper? data;

//   MovieResponse({this.data});

//   factory MovieResponse.fromJson(Map<String, dynamic> json) =>
//       _$MovieResponseFromJson(json);

//   Map<String, dynamic> toJson() => _$MovieResponseToJson(this);
// }

// @JsonSerializable()
// class DataWrapper {
//   @JsonKey(name: "movies")
//   final List<MovieModel>? movies;

//   DataWrapper({this.movies});

//   factory DataWrapper.fromJson(Map<String, dynamic> json) =>
//       _$DataWrapperFromJson(json);

//   Map<String, dynamic> toJson() => _$DataWrapperToJson(this);
// }
// // in domian layer
// class Movie {
//   final int id;
//   final String title;
//   final String? description;
//   final String? largeCoverImage;
//   final double? rating;
//   final List<String>? genres;

//   Movie({
//     required this.id,
//     required this.title,
//     this.description,
//     this.largeCoverImage,
//     this.rating,
//     this.genres,
//   });
// }
// import 'package:movies_app/Data/Responses/movie_response.dart';
// import 'package:movies_app/Domain/Models/movie.dart';

// abstract class MovieRepository {
//   Future<List<Movie>> getMovies({int? limit, int? page, String? genre});
// }
// import '../Repositories/movie_repository.dart';
// import '../Models/movie.dart';

// class GetMoviesUseCase {
//   final MovieRepository repository;

//   GetMoviesUseCase(this.repository);

//   Future<List<Movie>> call({int? limit, int? page, String? genre}) {
//     return repository.getMovies(limit: limit, page: page, genre: genre);
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:movies_app/Domain/Models/movie.dart';
// // import '../../../oldCode/ANewfortest/movie_list_screen copy.dart';
// import '../Cubit/movie_cubit.dart';

// class MovieListScreen extends StatefulWidget {
//   @override
//   _MovieListScreenState createState() => _MovieListScreenState();
// }

// class _MovieListScreenState extends State<MovieListScreen> {
//   int selectedCategoryIndex = 0;
//   final List<String> categories = [
//     "All",
//     "Action",
//     "Drama",
//     "Comedy",
//     "Horror"
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.black,
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Category Tabs
//             SizedBox(
//               height: 52,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: categories.length,
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         selectedCategoryIndex = index;
//                       });
//                       BlocProvider.of<MovieCubit>(context).loadMovies(
//                           genre: categories[index] == "All"
//                               ? null
//                               : categories[index]);
//                     },
//                     child: CategoryTab(
//                         title: categories[index],
//                         isSelected: index == selectedCategoryIndex),
//                   );
//                 },
//               ),
//             ),

//             // Movie List
//             Expanded(
//               child: BlocBuilder<MovieCubit, List<Movie>>(
//                 builder: (context, movies) {
//                   if (movies.isEmpty)
//                     return Center(child: CircularProgressIndicator());
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: GridView.builder(
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                         crossAxisSpacing: 15,
//                         mainAxisSpacing: 15,
//                         childAspectRatio: 0.7,
//                       ),
//                       itemCount: movies.length,
//                       itemBuilder: (context, index) {
//                         final movie = movies[index];
//                         return MovieCard(
//                           movieName: movie.title,
//                           movieImagePath: movie.largeCoverImage ??
//                               "https://example.com/default-image.jpg",
//                           movieRating: movie.rating?.toString() ?? "N/A",
//                         );
//                       },
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );

    
//   }
  
// }

