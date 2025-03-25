import 'package:collection/collection.dart';

class Meta {
  int? serverTime;
  String? serverTimezone;
  int? apiVersion;
  String? executionTime;

  Meta({
    this.serverTime,
    this.serverTimezone,
    this.apiVersion,
    this.executionTime,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        serverTime: json['server_time'] as int?,
        serverTimezone: json['server_timezone'] as String?,
        apiVersion: json['api_version'] as int?,
        executionTime: json['execution_time'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'server_time': serverTime,
        'server_timezone': serverTimezone,
        'api_version': apiVersion,
        'execution_time': executionTime,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Meta) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      serverTime.hashCode ^
      serverTimezone.hashCode ^
      apiVersion.hashCode ^
      executionTime.hashCode;
}
