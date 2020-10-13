import 'package:meta/meta.dart';
import 'package:virtual_traveller_flutter/data/data_providers/remote/amadeus_api/base_data.dart';
import 'package:virtual_traveller_flutter/data/models/destination.dart';
import 'package:virtual_traveller_flutter/data/models/location.dart';
import 'dart:convert';

/// **Quick links**
///
/// *Flights related*:
/// - [getNearestAirport]
/// - [getFlightOffersSearch]
/// - [getFlightCheapestDateSearch]
/// - [getAirportCitySearch]
/// - [getAirlineCodeLookup]
///
/// *Home Page & Destinations related*:
/// - [getFlightMostBooked]
/// - [getFlightMostTravelled]
/// - [getTravelRecommendation]
/// - [getHotelSearch]
/// - [getPointsOfInterest]
/// - [getSafePlace]
class AmadeusRepository {
  AmadeusRepository({
    @required this.amadeusBaseDataProvider,
  }) : assert(amadeusBaseDataProvider != null);

  final AmadeusBaseDataProvider amadeusBaseDataProvider;

  // Flights related
  Future<List<dynamic>> getNearestAirport(Location location) async {
    final rawData = await amadeusBaseDataProvider.getRawNearestAirport(location);
    final data = json.decode(rawData)['data'];

    return data;
  }

  Future<dynamic> getFlightOffersSearch() async {
    final rawData = await amadeusBaseDataProvider.getRawFlightOffersSearch();
    final data = json.decode(rawData)['data'];
    final dictionaries = json.decode(rawData)['dictionaries'];

    return [data, dictionaries];
  }

  Future<dynamic> getFlightCheapestDateSearch() async {
    final rawData = await amadeusBaseDataProvider.getRawFlightCheapestDateSearch();
    final data = json.decode(rawData)['data'];
    final dictionaries = json.decode(rawData)['dictionaries'];

    return [data, dictionaries];
  }

  Future<List<dynamic>> getAirportCitySearch() async {
    final rawData = await amadeusBaseDataProvider.getRawAirportCitySearch();
    final data = json.decode(rawData)['data'];

    return data;
  }

  Future<dynamic> getAirlineCodeLookup() async {
    final rawData = await amadeusBaseDataProvider.getRawAirlineCodeLookup();
    final data = json.decode(rawData)['data'][0];

    return data;
  }

  // Home Page & Destinations related
  Future<List<dynamic>> getFlightMostBooked() async {
    final rawData = await amadeusBaseDataProvider.getRawFlightMostBooked();
    final data = json.decode(rawData)['data'];

    return data;
  }

  Future<List<Destination>> getFlightMostTravelled() async {
    final rawData = await amadeusBaseDataProvider.getRawFlightMostTravelled();
    final data = json.decode(rawData)['data'];

    final destinations = (data as List).map((item) {
      return Destination.fromJson(item);
    }).toList();

    return destinations;
  }

  Future<List<dynamic>> getTravelRecommendation() async {
    final rawData = await amadeusBaseDataProvider.getRawTravelRecommendation();
    final data = json.decode(rawData)['data'];

    return data;
  }

  Future<dynamic> getHotelSearch() async {
    final rawData = await amadeusBaseDataProvider.getRawHotelSearch();
    // TODO: convert {newline} back to \n when doing in model fromJson
    // json decode produces an error if there is a newline \n
    final escapedData = rawData.replaceAll('\n', '{newline}');

    final data = json.decode(escapedData)['data'];
    final dictionaries = json.decode(escapedData)['dictionaries'];

    return [data, dictionaries];
  }

  Future<List<dynamic>> getPointsOfInterest(Location location) async {
    final rawData = await amadeusBaseDataProvider.getRawPointsOfInterest(location);
    final data = json.decode(rawData)['data'];

    return data;
  }

  Future<List<dynamic>> getSafePlace(Location location) async {
    final rawData = await amadeusBaseDataProvider.getRawSafePlace(location);
    final data = json.decode(rawData)['data'];

    return data;
  }
}
