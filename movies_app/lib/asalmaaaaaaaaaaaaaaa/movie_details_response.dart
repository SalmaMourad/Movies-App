import 'package:json_annotation/json_annotation.dart';

part 'movie_details_response.g.dart';

@JsonSerializable()
class MovieDetailsResponse {
  final String status;
  final String status_message;
  final MovieDetailsData? data;

  MovieDetailsResponse(
      {required this.status, required this.status_message, this.data});

  factory MovieDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MovieDetailsResponseToJson(this);
}

@JsonSerializable()
class MovieDetailsData {
  final MovieDetails movie;

  MovieDetailsData({required this.movie});

  factory MovieDetailsData.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsDataFromJson(json);
  Map<String, dynamic> toJson() => _$MovieDetailsDataToJson(this);
}

@JsonSerializable()
class MovieDetails {
  final int id;
  final String title;
  final String description_full;
  final String? large_cover_image;
  final String? large_screenshot_image1;
  final String? large_screenshot_image2;
  final String? large_screenshot_image3;
  final double? rating;
  final double? runtime;
  final double? like_count;
  final int year;
  final List<Cast>? cast;
  final List<String>? genres; // ✅ Add genres list
  final List<Torrent>? torrents; // ✅ Add torrents list

  MovieDetails({
    required this.id,
    required this.title,
    required this.description_full,
    this.large_cover_image,
    this.rating,
    this.runtime,
    this.like_count,
    required this.year,
    this.genres,
    this.torrents,
    this.cast,
    this.large_screenshot_image1,
    this.large_screenshot_image2,
    this.large_screenshot_image3,
  });

  factory MovieDetails.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$MovieDetailsToJson(this);
}

@JsonSerializable()
class Cast {
  final String name;
  final String? character_name;
  final String? url_small_image;

  Cast({required this.name, this.character_name, this.url_small_image});

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);
  Map<String, dynamic> toJson() => _$CastToJson(this);
}

@JsonSerializable()
class Torrent {
  final String url;
  final String hash;
  final String quality;
  final String type;
  final String size;

  Torrent({
    required this.url,
    required this.hash,
    required this.quality,
    required this.type,
    required this.size,
  });

  factory Torrent.fromJson(Map<String, dynamic> json) =>
      _$TorrentFromJson(json);
  Map<String, dynamic> toJson() => _$TorrentToJson(this);
}
