import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:virtual_traveller_flutter/data/models/location.dart';

part 'airport.freezed.dart';

part 'airport.g.dart';

@freezed
abstract class Airport with _$Airport {
  const factory Airport({
    @required String name,
    @required @JsonKey(name: 'iataCode') String airportIataCode,
    Address address,
    Location geoCode,
  }) = _Airport;

  factory Airport.fromJson(Map<String, dynamic> json) => _$AirportFromJson(json);
}

@freezed
abstract class Address with _$Address {
  const factory Address({
    String cityName,
    @required String cityCode,
    String countryName,
    String countryCode,
    String regionCode,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
}