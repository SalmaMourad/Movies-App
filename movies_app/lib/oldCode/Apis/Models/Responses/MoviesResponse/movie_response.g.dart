// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieResponse _$MovieResponseFromJson(Map<String, dynamic> json) =>
    MovieResponse(
      status: json['status'] as String,
      status_message: json['status_message'] as String,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MovieResponseToJson(MovieResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'status_message': instance.status_message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      movie_count: (json['movie_count'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      page_number: (json['page_number'] as num).toInt(),
      movies: (json['movies'] as List<dynamic>?)
          ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'movie_count': instance.movie_count,
      'limit': instance.limit,
      'page_number': instance.page_number,
      'movies': instance.movies,
    };

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      year: (json['year'] as num).toInt(),
      rating: (json['rating'] as num).toDouble(),
      runtime: (json['runtime'] as num).toInt(),
      summary: json['summary'] as String?,
      background_image: json['background_image'] as String?,
      background_image_original: json['background_image_original'] as String?,
      large_cover_image: json['large_cover_image'] as String?,
      medium_cover_image: json['medium_cover_image'] as String?,
      small_cover_image: json['small_cover_image'] as String?,
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'year': instance.year,
      'rating': instance.rating,
      'runtime': instance.runtime,
      'summary': instance.summary,
      'background_image': instance.background_image,
      'background_image_original': instance.background_image_original,
      'large_cover_image': instance.large_cover_image,
      'medium_cover_image': instance.medium_cover_image,
      'small_cover_image': instance.small_cover_image,
    };
