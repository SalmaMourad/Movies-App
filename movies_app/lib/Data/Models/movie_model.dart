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

  @JsonKey(name: 'rating')
  final double? rating;

  @JsonKey(name: 'genres')
  final List<String>? genres;

  MovieModel({
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
          rating: rating,
          genres: genres,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
