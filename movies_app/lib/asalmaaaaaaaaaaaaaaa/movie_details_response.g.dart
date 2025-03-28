// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailsResponse _$MovieDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    MovieDetailsResponse(
      status: json['status'] as String,
      status_message: json['status_message'] as String,
      data: json['data'] == null
          ? null
          : MovieDetailsData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MovieDetailsResponseToJson(
        MovieDetailsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'status_message': instance.status_message,
      'data': instance.data,
    };

MovieDetailsData _$MovieDetailsDataFromJson(Map<String, dynamic> json) =>
    MovieDetailsData(
      movie: MovieDetails.fromJson(json['movie'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MovieDetailsDataToJson(MovieDetailsData instance) =>
    <String, dynamic>{
      'movie': instance.movie,
    };

MovieDetails _$MovieDetailsFromJson(Map<String, dynamic> json) => MovieDetails(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description_full: json['description_full'] as String,
      large_cover_image: json['large_cover_image'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      runtime: (json['runtime'] as num?)?.toDouble(),
      like_count: (json['like_count'] as num?)?.toDouble(),
      year: (json['year'] as num).toInt(),
      genres:
          (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
      torrents: (json['torrents'] as List<dynamic>?)
          ?.map((e) => Torrent.fromJson(e as Map<String, dynamic>))
          .toList(),
      cast: (json['cast'] as List<dynamic>?)
          ?.map((e) => Cast.fromJson(e as Map<String, dynamic>))
          .toList(),
      large_screenshot_image1: json['large_screenshot_image1'] as String?,
      large_screenshot_image2: json['large_screenshot_image2'] as String?,
      large_screenshot_image3: json['large_screenshot_image3'] as String?,
    );

Map<String, dynamic> _$MovieDetailsToJson(MovieDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description_full': instance.description_full,
      'large_cover_image': instance.large_cover_image,
      'large_screenshot_image1': instance.large_screenshot_image1,
      'large_screenshot_image2': instance.large_screenshot_image2,
      'large_screenshot_image3': instance.large_screenshot_image3,
      'rating': instance.rating,
      'runtime': instance.runtime,
      'like_count': instance.like_count,
      'year': instance.year,
      'cast': instance.cast,
      'genres': instance.genres,
      'torrents': instance.torrents,
    };

Cast _$CastFromJson(Map<String, dynamic> json) => Cast(
      name: json['name'] as String,
      character_name: json['character_name'] as String?,
      url_small_image: json['url_small_image'] as String?,
    );

Map<String, dynamic> _$CastToJson(Cast instance) => <String, dynamic>{
      'name': instance.name,
      'character_name': instance.character_name,
      'url_small_image': instance.url_small_image,
    };

Torrent _$TorrentFromJson(Map<String, dynamic> json) => Torrent(
      url: json['url'] as String,
      hash: json['hash'] as String,
      quality: json['quality'] as String,
      type: json['type'] as String,
      size: json['size'] as String,
    );

Map<String, dynamic> _$TorrentToJson(Torrent instance) => <String, dynamic>{
      'url': instance.url,
      'hash': instance.hash,
      'quality': instance.quality,
      'type': instance.type,
      'size': instance.size,
    };
