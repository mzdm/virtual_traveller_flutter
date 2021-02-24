import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.freezed.dart';

part 'location.g.dart';

@freezed
abstract class Location with _$Location {
  const factory Location({
    required double latitude,
    required double longitude,
  }) = _Location;

  factory Location.unknown() => const Location(latitude: 0, longitude: 0);

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
}
