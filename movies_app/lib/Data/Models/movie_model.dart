import 'package:json_annotation/json_annotation.dart';
import '../../Domain/Models/movie.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel extends Movie {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'description_full')
  final String? description;

  @JsonKey(name: 'large_cover_image')
  final String? largeCoverImage;

  @JsonKey(name: 'medium_cover_image')
  final String? mediumCoverImage;

  @JsonKey(name: 'small_cover_image')
  final String? smallCoverImage;

  @JsonKey(name: 'rating')
  final double? rating;

  @JsonKey(name: 'genres')
  final List<String>? genres;

  MovieModel({
    this.mediumCoverImage,
    this.smallCoverImage,
    required this.id,
    required this.title,
    this.description,
    this.largeCoverImage,
    this.rating,
    this.genres,
  }) : super(
          id: id,
          title: title,
          description: description,
          largeCoverImage: largeCoverImage,
          mediumCoverImage: mediumCoverImage,
          smallCoverImage: smallCoverImage,
          rating: rating,
          genres: genres,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
