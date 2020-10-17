import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:virtual_traveller_flutter/data/data_providers/remote/amadeus_api/base_data.dart';
import 'package:virtual_traveller_flutter/data/models/airline.dart';
import 'package:virtual_traveller_flutter/data/models/airport.dart';
import 'package:virtual_traveller_flutter/data/models/destination.dart';
import 'package:virtual_traveller_flutter/data/models/location.dart';
import 'dart:convert';

import 'package:virtual_traveller_flutter/data/models/poi.dart';
import 'package:virtual_traveller_flutter/data/models/safety_rate.dart';

// TODO List safety null remove; Try Catch Function for fromJson (where output List)
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
  Future<List<dynamic>> getNearestAirport(
    Location location,
  ) async {
    final rawData = await amadeusBaseDataProvider.getRawNearestAirport(location);
    final data = json.decode(rawData)['data'];

    /// We don't need Airport IATA code, but we need the city's code,
    /// which is needed for flights & destinations searching.
    ///
    /// So this will also filter out cities with multiple airports.
    final uniqueCityList = <String>{};
    final airports = (data as List).map((item) {
      try {
        final airport = Airport.fromJson(item);
        final cityCode = airport.address.cityCode;

        if (uniqueCityList.contains(cityCode)) {
          return null;
        }

        uniqueCityList.add(cityCode);
        return airport;
      } catch (e) {
        print(e);
        return null;
      }
    }).toList()
      ..removeWhere((element) => element == null);

    return airports;
  }

  // TODO
  Future<dynamic> getFlightOffersSearch({
    @required String originCity,
    @required String destinationCity,
    @required String departureDate,
    String returnDate,
    @required int adults,
    int children = 0,
    int infants = 0,
    String travelClass,
    bool nonStop,
    String currencyCode = 'USD',
    int maxPrice,
  }) async {
    final rawData = await amadeusBaseDataProvider.getRawFlightOffersSearch(
      originCity: originCity,
      destinationCity: destinationCity,
      departureDate: departureDate,
      returnDate: returnDate,
      adults: adults,
      children: children,
      infants: infants,
      travelClass: travelClass,
      nonStop: nonStop,
      currencyCode: currencyCode,
      maxPrice: maxPrice,
    );
    final data = json.decode(rawData)['data'];
    final dictionaries = json.decode(rawData)['dictionaries'];

    return [data, dictionaries];
  }

  // TODO
  Future<dynamic> getFlightCheapestDateSearch({
    @required String originCity,
    @required String destinationCity,
  }) async {
    final rawData = await amadeusBaseDataProvider.getRawFlightCheapestDateSearch(
      originCity: originCity,
      destinationCity: destinationCity,
    );
    final data = json.decode(rawData)['data'];
    final dictionaries = json.decode(rawData)['dictionaries'];

    return [data, dictionaries];
  }

  Future<List<Airport>> getAirportCitySearch(
    String textSearchKeyword,
  ) async {
    final rawData = await amadeusBaseDataProvider.getRawAirportCitySearch(textSearchKeyword);
    final data = json.decode(rawData)['data'];

    final uniqueCityList = <String>{};
    final airports = (data as List).map((item) {
      try {
        final airport = Airport.fromJson(item);
        final cityCode = airport.address.cityCode;

        if (uniqueCityList.contains(cityCode)) {
          return null;
        }

        uniqueCityList.add(cityCode);
        return airport;
      } catch (e) {
        print(e);
        return null;
      }
    }).toList()
      ..removeWhere((element) => element == null);

    return airports;
  }

  Future<Airline> getAirlineCodeLookup(
    String airlineCode,
  ) async {
    final rawData = await amadeusBaseDataProvider.getRawAirlineCodeLookup(airlineCode);
    final data = json.decode(rawData)['data'][0];

    final airport = Airline.fromJson(data);

    return airport;
  }

  // Home Page & Destinations related
  Future<List<Destination>> getFlightMostBooked(
    String originCityCode,
  ) async {
    final rawData = await amadeusBaseDataProvider.getRawFlightMostBooked(originCityCode);
    final data = json.decode(rawData)['data'];

    final destinations = (data as List).map((item) {
      try {
        return DestinationBase.fromJson(item);
      } catch (e) {
        print(e);
        return null;
      }
    }).toList()
      ..removeWhere((element) => element == null);

    return destinations;
  }

  Future<List<Destination>> getFlightMostTravelled(
    String originCityCode,
  ) async {
    final rawData = await amadeusBaseDataProvider.getRawFlightMostTravelled(originCityCode);
    final data = json.decode(rawData)['data'];

    final destinations = (data as List).map((item) {
      try {
        return DestinationBase.fromJson(item);
      } catch (e) {
        print(e);
        return null;
      }
    }).toList()
      ..removeWhere((element) => element == null);

    return destinations;
  }

  Future<List<Destination>> getTravelRecommendation(
    List<String> cityCodes,
  ) async {
    final rawData = await amadeusBaseDataProvider.getRawTravelRecommendation(cityCodes);
    final data = json.decode(rawData)['data'];

    final destinations = (data as List).map((item) {
      try {
        return DestinationIATA.fromJson(item);
      } catch (e) {
        print(e);
        return null;
      }
    }).toList()
      ..removeWhere((element) => element == null);

    return destinations;
  }

  // TODO
  Future<dynamic> getHotelSearch({
    @required cityCode,
    String language,
  }) async {
    final rawData = await amadeusBaseDataProvider.getRawHotelSearch(
      cityCode: cityCode,
      language: language,
    );
    // TODO: convert {newline} back to \n when doing in model fromJson
    // json decode produces an error if there is a newline \n
    final escapedData = rawData.replaceAll('\n', '{newline}');

    final data = json.decode(escapedData)['data'];
    final dictionaries = json.decode(escapedData)['dictionaries'];

    return [data, dictionaries];
  }

  Future<List<POI>> getPointsOfInterest(
    Location location,
    List<CategoryPOI> categoriesList,
  ) async {
    final categoriesStrList = categoriesList == null
        ? null
        : categoriesList.map((category) => describeEnum(category)).toList();

    final rawData = await amadeusBaseDataProvider.getRawPointsOfInterest(
      location: location,
      categories: categoriesStrList,
    );
    final data = json.decode(rawData)['data'];

    final pois = (data as List).map((item) {
      /// This safely does *fromJson* method of the given class on each
      /// item of the list.
      ///
      /// If it fails, then it will return *null*, which will be then omitted from the
      /// final output list.
      try {
        return POI.fromJson(item);
      } catch (e) {
        print(e);
        return null;
      }
    }).toList()
      ..removeWhere((element) => element == null);

    return pois;
  }

  Future<SafetyRate> getSafePlace(
    Location location,
  ) async {
    final rawData = await amadeusBaseDataProvider.getRawSafePlace(location);
    final data = json.decode(rawData)['data'][0];

    final safetyRate = SafetyRate.fromJson(data);

    return safetyRate;
  }
}
