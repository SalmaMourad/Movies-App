import 'package:collection/collection.dart';

import 'movie.dart';

class PagaDTO {//WAS Data
  int? movieCount;
  int? limit;
  int? pageNumber;
  List<MovieDTO>? movies;

  PagaDTO({this.movieCount, this.limit, this.pageNumber, this.movies});

  factory PagaDTO.fromJson(Map<String, dynamic> json) => PagaDTO(
        movieCount: json['movie_count'] as int?,
        limit: json['limit'] as int?,
        pageNumber: json['page_number'] as int?,
        movies: (json['movies'] as List<dynamic>?)
            ?.map((e) => MovieDTO.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'movie_count': movieCount,
        'limit': limit,
        'page_number': pageNumber,
        'movies': movies?.map((e) => e.toJson()).toList(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! PagaDTO) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      movieCount.hashCode ^
      limit.hashCode ^
      pageNumber.hashCode ^
      movies.hashCode;
}
