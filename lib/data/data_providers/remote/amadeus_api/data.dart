import 'package:virtual_traveller_flutter/data/data_providers/remote/amadeus_api/api_service.dart';
import 'package:virtual_traveller_flutter/data/models/location.dart';
import 'package:http/http.dart' as http;

import 'base_data.dart';

/// This does the network calls.
class AmadeusRemoteDataProvider implements AmadeusBaseDataProvider {
  AmadeusRemoteDataProvider(this._apiService);

  final ApiService _apiService;

  /// Fetches the given network call with query parameters.
  ///
  /// First checks whether accessToken is still valid otherwise
  /// generate a new one.
  Future<String> _getRawDataFromEndpoint(
    String endpointPath,
    Map<String, dynamic> queryParams,
  ) async {
    final Function func = () async {
      final response = await http.get(
        _apiService.getUri(endpointPath, queryParams).toString(),
        headers: {
          'Authorization': 'Bearer ${_apiService.accessToken}',
        },
      );

      print(
        'Request ${_apiService.getUri(endpointPath, queryParams).toString()} with token: ${_apiService.accessToken}\n'
        'Response: ${response.statusCode}: ${response.reasonPhrase}',
      );

      if (response.statusCode == 200) {
        return response.body;
      }

      throw (response);
    };

    try {
      return _apiService.checkTokenValidation(onChecked: func);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  // https://developers.amadeus.com/self-service/category/air/api-doc/airport-nearest-relevant/api-reference
  /// *"What are the nearest major airports to this location?"*
  ///
  /// The Airport Nearest Relevant API finds the closest major airports to a starting point.
  /// The API provides a list of commercial airports within a 500km (311mi) radius of a
  /// given point that are ordered by relevance, which considers their distance from
  /// the starting point and their yearly flight traffic. For each airport,
  /// the API provides the name, 3-letter [IATA code](http://www.iata.org/publications/Pages/code-search.aspx),
  /// time zone and coordinates.
  @override
  Future<String> getRawNearestAirport(Location location) async {
    final endpointPath = 'v1/reference-data/locations/airports';
    final queryParams = {
      'latitude': location.lat, // ---required---
      'longitude': location.long, // ---required---
      'page[limit]': 3 // maximum items in one page
    };

    return await _getRawDataFromEndpoint(endpointPath, queryParams);
  }

  // https://developers.amadeus.com/self-service/category/air/api-doc/flight-offers-search/api-reference
  /// *"What are the cheapest flights from Madrid to Paris on June 1st?"*
  ///
  /// The Flight Offers Search API searches over 500 airlines to find the
  /// cheapest flights for a given itinerary. The API lets you search flights between
  /// two cities, perform multi-city searches for longer itineraries and
  /// access one-way combinable fares to offer the cheapest options possible.
  /// For each itinerary, the API provides a list of flight offers with prices,
  /// fare details, airline names, baggage allowances and departure terminals.
  /// This API forms the first step in the [flight booking flow](https://developers.amadeus.com/get-started/create-a-flight-booking-engine-651).
  /// Once a flight is chosen, confirm the real-time price using [Flight Offers Price](https://developers.amadeus.com/self-service/category/air/api-doc/flight-offers-price)
  /// and book the flight with [Flight Create Orders](https://developers.amadeus.com/self-service/category/air/api-doc/flight-create-orders).
  ///
  /// [IATA code](http://www.iata.org/publications/Pages/code-search.aspx)
  @override
  Future<String> getRawFlightOffersSearch() async {
    final endpointPath = 'v2/shopping/flight-offers';
    final queryParams = {
      'originLocationCode': 'SYD', // ---required---; IATA code
      'destinationLocationCode': 'BKK', // ---required---; IATA code
      'departureDate': '2017-12-25', // ---required---; ISO 8601 YYYY-MM-DD format, e.g. 2017-12-25
      'returnDate': '2018-02-28', // format same as departureDate, if null then it is one-way, otherwise round-trip
      'adults': 1, // ---required---, the number of adult travelers (age 12 or older on date of departure)
      'children': 0, // the number of child travelers (older than age 2 and younger than age 12 on date of departure)
      'infants': 0, // the number of infant travelers (whose age is less or equal to 2 on date of departure), infants travel on the lap of an adult traveler, and thus the number of infants must not exceed the number of adults
      'travelClass': 'ECONOMY', // ECONOMY, PREMIUM_ECONOMY, BUSINESS, FIRST; if no travel class is specified, the search considers any travel class
      'nonStop': false, // if set to true, the search will find only flights going from the origin to the destination with no stop in between
      'currencyCode': 'EUR', // the preferred currency for the flight offers, currency is specified in the ISO 4217 format, e.g. EUR for Euro
      'maxPrice': 500, // maximum price per traveler, by default, no limit is applied, if specified, the value should be a positive number with no decimals
      'max': 100, // maximum number of flight offers to return, if specified, the value should be greater than or equal to 1
    }..removeWhere((_, value) => value == null);

    return await _getRawDataFromEndpoint(endpointPath, queryParams);
  }

  // https://developers.amadeus.com/self-service/category/air/api-doc/flight-cheapest-date-search/api-reference
  @override
  Future<String> getRawFlightCheapestDateSearch() async {
    // TODO
    final endpointPath = 'v1/path';
    final queryParams = {
      '__': '__',
    }..removeWhere((_, value) => value == null);

    return await _getRawDataFromEndpoint(endpointPath, queryParams);
  }

  // https://developers.amadeus.com/self-service/category/air/api-doc/flight-offers-price/api-reference
  @override
  Future<String> getRawFlightOffersPrice() async {
    // TODO
    final endpointPath = 'v1/path';
    final queryParams = {
      '__': '__',
    }..removeWhere((_, value) => value == null);

    return await _getRawDataFromEndpoint(endpointPath, queryParams);
  }

  // https://developers.amadeus.com/self-service/category/air/api-doc/airport-and-city-search/api-reference
  @override
  Future<String> getRawAirportCitySearch() async {
    // TODO
    final endpointPath = 'v1/path';
    final queryParams = {
      '__': '__',
    }..removeWhere((_, value) => value == null);

    return await _getRawDataFromEndpoint(endpointPath, queryParams);
  }

  // https://developers.amadeus.com/self-service/category/air/api-doc/airline-code-lookup/api-reference
  @override
  Future<String> getRawAirlineCodeLookup() async {
    // TODO
    final endpointPath = 'v1/reference-data/airlines';
    final queryParams = {
      'airlineCodes': 'SWA',
    }..removeWhere((_, value) => value == null);

    return await _getRawDataFromEndpoint(endpointPath, queryParams);
  }

  // https://developers.amadeus.com/self-service/category/air/api-doc/flight-inspiration-search/api-reference
  @override
  Future<String> getRawFlightInspirationSearch() async {
    // TODO
    final endpointPath = 'v1/path';
    final queryParams = {
      '__': '__',
    }..removeWhere((_, value) => value == null);

    return await _getRawDataFromEndpoint(endpointPath, queryParams);
  }

  // https://developers.amadeus.com/self-service/category/air/api-doc/flight-most-booked-destinations/api-reference
  @override
  Future<String> getRawFlightMostBooked() async {
    // TODO
    final endpointPath = 'v1/path';
    final queryParams = {
      '__': '__',
    }..removeWhere((_, value) => value == null);

    return await _getRawDataFromEndpoint(endpointPath, queryParams);
  }

  // https://developers.amadeus.com/self-service/category/air/api-doc/flight-most-traveled-destinations/api-reference
  @override
  Future<String> getRawFlightMostTravelled() async {
    // TODO
    final endpointPath = 'v1/path';
    final queryParams = {
      '__': '__',
    }..removeWhere((_, value) => value == null);

    return await _getRawDataFromEndpoint(endpointPath, queryParams);
  }

  // https://developers.amadeus.com/self-service/category/trip/api-doc/travel-recommendations/api-reference
  @override
  Future<String> getRawTravelRecommendation() async {
    // TODO
    final endpointPath = 'v1/path';
    final queryParams = {
      '__': '__',
    }..removeWhere((_, value) => value == null);

    return await _getRawDataFromEndpoint(endpointPath, queryParams);
  }

  // https://developers.amadeus.com/self-service/category/hotel/api-doc/hotel-search/api-reference
  @override
  Future<String> getRawHotelSearch() async {
    // TODO
    final endpointPath = 'v1/path';
    final queryParams = {
      '__': '__',
    }..removeWhere((_, value) => value == null);

    return await _getRawDataFromEndpoint(endpointPath, queryParams);
  }

  // https://developers.amadeus.com/self-service/category/destination-content/api-doc/points-of-interest/api-reference
  @override
  Future<String> getRawPointsOfInterest() async {
    // TODO
    final endpointPath = 'v1/path';
    final queryParams = {
      '__': '__',
    }..removeWhere((_, value) => value == null);

    return await _getRawDataFromEndpoint(endpointPath, queryParams);
  }

  // https://developers.amadeus.com/self-service/category/destination-content/api-doc/safe-place-api/api-reference
  @override
  Future<String> getRawSafePlace() async {
    // TODO
    final endpointPath = 'v1/path';
    final queryParams = {
      '__': '__',
    }..removeWhere((_, value) => value == null);

    return await _getRawDataFromEndpoint(endpointPath, queryParams);
  }
}
