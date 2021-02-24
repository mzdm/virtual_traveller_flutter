import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:virtual_traveller_flutter/data/models/location.dart';

part 'airport.freezed.dart';

part 'airport.g.dart';

@freezed
abstract class Airport with _$Airport {
  const factory Airport({
    @JsonKey(name: 'name') required String cityName,
    @JsonKey(name: 'iataCode') required String airportCode,
    required AirportAddress address,
    Location? geoCode,
  }) = _Airport;

  factory Airport.fromJson(Map<String, dynamic> json) => _$AirportFromJson(json);
}

@freezed
abstract class AirportAddress with _$AirportAddress {
  const factory AirportAddress({
    @Default('') String cityName,
    required String cityCode,
    @Default('') String countryName,
    @Default('') String countryCode,
    @Default('') String regionCode,
  }) = _AirportAddress;

  factory AirportAddress.fromJson(Map<String, dynamic> json) => _$AirportAddressFromJson(json);
}