import 'package:json_annotation/json_annotation.dart';

part 'movie_response.g.dart';

@JsonSerializable()
class MovieResponse {
  final String status;
  final String status_message;
  final Data? data;

  MovieResponse(
      {required this.status, required this.status_message, this.data});

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MovieResponseToJson(this);
}

@JsonSerializable()
class Data {
  final int movie_count;
  final int limit;
  final int page_number;
  final List<Movie>? movies;

  Data(
      {required this.movie_count,
      required this.limit,
      required this.page_number,
      this.movies});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

// @JsonSerializable()
// class Movie {
//   final int id;
//   final String title;
//   final String year;
//   final String rating;
//   final String runtime;
//   final String? summary;
//   final String? background_image;
//   final String? small_cover_image;

//   Movie({
//     required this.id,
//     required this.title,
//     required this.year,
//     required this.rating,
//     required this.runtime,
//     this.summary,
//     this.background_image,
//     this.small_cover_image,
//   });

//   factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
//   Map<String, dynamic> toJson() => _$MovieToJson(this);
// }
@JsonSerializable()
class Movie {
  final int id;
  final String title;
  final int year; // Changed from String to int
  final double rating; // Changed from String to double
  final int runtime; // Changed from String to int
  final String? summary;
  final String? background_image;
  final String? background_image_original;
  final String? large_cover_image;
  final String? medium_cover_image;
  final String? small_cover_image;

  Movie({
    required this.id,
    required this.title,
    required this.year,
    required this.rating,
    required this.runtime,
    this.summary,
    this.background_image,
    this.background_image_original,
    this.large_cover_image,
    this.medium_cover_image,
    this.small_cover_image,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
