import 'package:freezed_annotation/freezed_annotation.dart';

part 'flight_offer.freezed.dart';

part 'flight_offer.g.dart';

@freezed
abstract class FlightOffer with _$FlightOffer {
  const factory FlightOffer({
    @Default(false) bool oneWay,
    @Default(0) int numberOfBookableSeats,
    FlightOfferDataPrice? price,
    @Default(<FlightOfferDataTravellers>[])
    @JsonKey(name: 'travelerPricings')
        List<FlightOfferDataTravellers> travellers,
    required List<FlightOfferDataItineraries> itineraries,
    @Default(<String, dynamic>{})
    @JsonKey(ignore: true)
        Map<String, dynamic> carriersDictionary,
  }) = _FlightOffer;

  factory FlightOffer.fromJson(Map<String, dynamic> json) =>
      _$FlightOfferFromJson(json);
}

@freezed
abstract class FlightOfferDataTravellers with _$FlightOfferDataTravellers {
  const factory FlightOfferDataTravellers({
    @Default('ADULT') String travelerType,
    FlightOfferDataPrice? price,
  }) = _FlightOfferDataTravellers;

  factory FlightOfferDataTravellers.fromJson(Map<String, dynamic> json) => _$FlightOfferDataTravellersFromJson(json);
}

@freezed
abstract class FlightOfferDataPrice with _$FlightOfferDataPrice {
  const factory FlightOfferDataPrice({
    @Default('EUR') String currency,
    @Default('-') String total,
  }) = _FlightOfferDataPrice;

  factory FlightOfferDataPrice.fromJson(Map<String, dynamic> json) => _$FlightOfferDataPriceFromJson(json);
}

@freezed
abstract class FlightOfferDataItineraries with _$FlightOfferDataItineraries {
  const factory FlightOfferDataItineraries({
    @Default('PT0M') @JsonKey(name: 'duration') String stopDuration, // stop duration in ISO8601 PnYnMnDTnHnMnS format, e.g. PT2H10M (= time not flying ?)
    @Default(<FlightOfferDataItinerariesSegments>[])
        List<FlightOfferDataItinerariesSegments> segments,
  }) = _FlightOfferDataItineraries;

  factory FlightOfferDataItineraries.fromJson(Map<String, dynamic> json) => _$FlightOfferDataItinerariesFromJson(json);
}

@freezed
abstract class FlightOfferDataItinerariesSegments with _$FlightOfferDataItinerariesSegments {
  const factory FlightOfferDataItinerariesSegments({
    FlightOfferDataEndpoint? departure,
    FlightOfferDataEndpoint? arrival,
    @Default('') String duration,
    @Default(-1) int numberOfStops,
    @Default('') String carrierCode,
    FlightOfferDataAircraft? aircraft,
  }) = _FlightOfferDataItinerariesSegments;

  factory FlightOfferDataItinerariesSegments.fromJson(Map<String, dynamic> json) => _$FlightOfferDataItinerariesSegmentsFromJson(json);
}

@freezed
abstract class FlightOfferDataEndpoint with _$FlightOfferDataEndpoint {
  const factory FlightOfferDataEndpoint({
    @Default('') String iataCode,
    @Default('') String terminal,
    @Default('') String at, // local date and time in ISO8601 https://en.wikipedia.org/wiki/ISO_8601 YYYY-MM-ddThh:mm:ss format, e.g. 2017-02-10T20:40:00
  }) = _FlightOfferDataEndpoint;

  factory FlightOfferDataEndpoint.fromJson(Map<String, dynamic> json) => _$FlightOfferDataEndpointFromJson(json);
}

@freezed
abstract class FlightOfferDataAircraft with _$FlightOfferDataAircraft {
  const factory FlightOfferDataAircraft({
    @Default('') String code,
  }) = _FlightOfferDataAircraft;

  factory FlightOfferDataAircraft.fromJson(Map<String, dynamic> json) => _$FlightOfferDataAircraftFromJson(json);
}


