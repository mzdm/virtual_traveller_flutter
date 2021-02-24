import 'package:freezed_annotation/freezed_annotation.dart';

part 'destination.freezed.dart';

part 'destination.g.dart';

@freezed
abstract class Destination with _$Destination {
  const factory Destination.base(
    @JsonKey(name: 'destination') String name,
  ) = DestinationBase;

  @Assert('subtype == \'CITY\'', 'destination is not city')
  const factory Destination.iata({
    @JsonKey(name: 'iataCode') required String name,
    required String subtype,
  }) = DestinationIATA;

  factory Destination.fromJson(Map<String, dynamic> json) => _$DestinationFromJson(json);
}
