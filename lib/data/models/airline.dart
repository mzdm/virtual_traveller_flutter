import 'package:freezed_annotation/freezed_annotation.dart';

part 'airline.freezed.dart';

part 'airline.g.dart';

@freezed
abstract class Airline with _$Airline {
  const factory Airline({
    required String iataCode,
    required String businessName,
    @Default('') String commonName,
  }) = _Airline;

  factory Airline.fromJson(Map<String, dynamic> json) => _$AirlineFromJson(json);
}