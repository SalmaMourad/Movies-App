// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => MovieModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description_full'] as String?,
      largeCoverImage: json['large_cover_image'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      genres:
          (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description_full': instance.description,
      'large_cover_image': instance.largeCoverImage,
      'rating': instance.rating,
      'genres': instance.genres,
    };
