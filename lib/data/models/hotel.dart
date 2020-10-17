import 'package:freezed_annotation/freezed_annotation.dart';

part 'hotel.freezed.dart';

part 'hotel.g.dart';

@freezed
abstract class Hotel with _$Hotel {
  const factory Hotel({
    @required String name,
    @required @JsonKey(name: 'rating') String stars,
    double latitude,
    double longitude,
    HotelDistance hotelDistance,
    HotelAddress address,
    HotelContact contact,
    List<String> amenities,
  }) = _Hotel;

  factory Hotel.fromJson(Map<String, dynamic> json) => _$HotelFromJson(json);
}

@freezed
abstract class HotelDistance with _$HotelDistance {
  const factory HotelDistance({
    double distance,
    String distanceUnit,
  }) = _HotelDistance;

  factory HotelDistance.fromJson(Map<String, dynamic> json) => _$HotelDistanceFromJson(json);
}

@freezed
abstract class HotelAddress with _$HotelAddress {
  const factory HotelAddress({
    String countryCode,
    String cityName,
    List<String> lines,
  }) = _HotelAddress;

  factory HotelAddress.fromJson(Map<String, dynamic> json) => _$HotelAddressFromJson(json);
}

@freezed
abstract class HotelContact with _$HotelContact {
  const factory HotelContact({
    String phone,
    String email,
  }) = _HotelContact;

  factory HotelContact.fromJson(Map<String, dynamic> json) => _$HotelContactFromJson(json);
}
