import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:virtual_traveller_flutter/data/data_providers/remote/amadeus_api/base_data.dart';
import 'package:virtual_traveller_flutter/data/models/airline.dart';
import 'package:virtual_traveller_flutter/data/models/airport.dart';
import 'package:virtual_traveller_flutter/data/models/destination.dart';
import 'package:virtual_traveller_flutter/data/models/flight_offer.dart';
import 'package:virtual_traveller_flutter/data/models/hotel.dart';
import 'package:virtual_traveller_flutter/data/models/location.dart';
import 'dart:convert';

import 'package:virtual_traveller_flutter/data/models/poi.dart';
import 'package:virtual_traveller_flutter/data/models/safety_rate.dart';

// TODO: Check if models fits with Amadeus API models
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
  Future<List<Airport>> getNearestAirport(
    Location location,
  ) async {
    final rawData = await amadeusBaseDataProvider.getRawNearestAirport(location);
    final data = json.decode(rawData)['data'];

    /// We don't need AIRPORT IATA code, but we need the CITY's code,
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

  Future<List<FlightOffer>> getFlightOffersSearch({
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
    final Map<String, dynamic> carriersDictionary = json.decode(rawData)['dictionaries']['carriers'];

    final flightOffers = (data as List).map((item) {
      try {
        return FlightOffer.fromJson(item).copyWith(
          carriersDictionary: carriersDictionary,
        );
      } catch (e) {
        print(e);
        return null;
      }
    }).toList()
      ..removeWhere((element) => element == null);

    return flightOffers;
  }

  Future<List<Airport>> getAirportCitySearch(
    String textSearchKeyword,
  ) async {
    print('DATA CALLED: getAirportCitySearch (src: amadeus_repository.dart)');

    final rawData = await amadeusBaseDataProvider.getRawAirportCitySearch(textSearchKeyword);
    final data = json.decode(rawData)['data'];

    final uniqueCityList = <String>{};
    // TODO: Remove list check. User can search for city and also airport code in Search flights offer API
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
  Future<List<Destination>> getFlightMostTravelled(
    String originCityCode,
  ) async {
    print('DATA CALLED: getFlightMostTravelled (src: amadeus_repository.dart)');

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

  Future<List<Hotel>> getHotelSearch({
    @required String cityCode,
    String language,
  }) async {
    print('DATA CALLED: getHotelSearch (src: amadeus_repository.dart)');

    final rawData = await amadeusBaseDataProvider.getRawHotelSearch(
      cityCode: cityCode,
      language: language,
    );
    // TODO: convert {newline} back to \n when doing in model fromJson
    // TODO: add description property to model
    // json decode produces an error if there is a newline \n, so firstly replace it
    final escapedData = rawData.replaceAll('\n', '{newline}');
    final data = json.decode(escapedData)['data'];

    final hotels = (data as List).map((item) {
      try {
        return Hotel.fromJson(item['hotel']);
      } catch (e) {
        print(e);
        return null;
      }
    }).toList()
      ..removeWhere((element) => element == null);

    return hotels;
  }

  Future<List<POI>> getPointsOfInterest({
    @required Location location,
    List<CategoryPOI> categoriesList,
  }) async {
    final categoriesStrList = categoriesList == null
        ? null
        : categoriesList.map((category) => describeEnum(category)).toList();

    final rawData = await amadeusBaseDataProvider.getRawPointsOfInterest(
      location: location,
      categories: categoriesStrList,
    );
    final data = json.decode(rawData)['data'];

    final pois = (data as List).map((item) {
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
