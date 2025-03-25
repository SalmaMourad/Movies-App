import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';
import 'meta.dart';
// import 'movies_response.g.dart';
@JsonSerializable()
class MoviesResponse {
  String? status;
  String? statusMessage;
  PagaDTO? data;
  Meta? meta;

  MoviesResponse({this.status, this.statusMessage, this.data, this.meta});

  factory MoviesResponse.fromJson(Map<String, dynamic> json) {
    return MoviesResponse(
      status: json['status'] as String?,
      statusMessage: json['status_message'] as String?,
      data: json['data'] == null
          ? null
          : PagaDTO.fromJson(json['data'] as Map<String, dynamic>),
      meta: json['@meta'] == null
          ? null
          : Meta.fromJson(json['@meta'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'status_message': statusMessage,
        'data': data?.toJson(),
        '@meta': meta?.toJson(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! MoviesResponse) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      status.hashCode ^ statusMessage.hashCode ^ data.hashCode ^ meta.hashCode;
}
