import 'package:freezed_annotation/freezed_annotation.dart';

part 'destination.freezed.dart';

part 'destination.g.dart';

@freezed
abstract class Destination with _$Destination {
  const factory Destination(
    @JsonKey(name: 'destination') String name,
  ) = _Destination;

  factory Destination.fromJson(Map<String, dynamic> json) => _$DestinationFromJson(json);
}
