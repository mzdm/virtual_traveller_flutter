import 'package:virtual_traveller_flutter/data/data_providers/remote/amadeus_api/api_service.dart';
import 'package:virtual_traveller_flutter/data/models/location.dart';
import 'package:http/http.dart' as http;

import 'base_data.dart';

/// This does the network calls.
class AmadeusRemoteDataProvider implements AmadeusBaseDataProvider {
  AmadeusRemoteDataProvider(this._apiService);

  final ApiService _apiService;

  String _accessToken;

  /// Fetches the given network call with query parameters.
  ///
  /// Check whether [_accessToken] is still valid otherwise
  /// generate a new one.
  Future<String> _getRawDataFromEndpoint(
    String endpointPath,
    Map<String, dynamic> queryParams,
  ) async {
    final Function func = () async {
      final response = await http.get(
        _apiService.getUri(endpointPath, queryParams).toString(),
        headers: {
          'Authorization': 'Bearer $_accessToken',
        },
      );

      print(
        'Request ${_apiService.getUri(endpointPath, queryParams).toString()} with token: $_accessToken\n'
        'Response: ${response.statusCode}: ${response.reasonPhrase}',
      );

      if (response.statusCode == 200) {
        return response.body;
      }

      throw (response);
    };

    try {
      return _checkTokenValidation(onChecked: func);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  /// Checks if the [_accessToken] is not null and is still valid.
  ///
  /// If:
  ///   - statusCode = 401 = UNAUTHORIZED = Access Token has expired -> generate a new one
  Future<T> _checkTokenValidation<T>({Future<T> Function() onChecked}) async {
    try {
      _accessToken ??= await _apiService.getAccessToken();
      return await onChecked();
    } on http.Response catch (response) {
      if (response.statusCode == 401) {
        print('token expired, requesting a new one');
        _accessToken = await _apiService.getAccessToken();
        return await onChecked();
      }
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
  /// the API provides the name, 3-letter IATA code, time zone and coordinates.
  @override
  Future<String> getRawNearestAirport(Location location) async {
    final endpointPath = 'v1/reference-data/locations/airports';
    final queryParams = {
      'latitude': location.lat, // required
      'longitude': location.long, // required
      'page[limit]': 3,
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
  @override
  Future<String> getRawFlightOffersSearch() async {
    final endpointPath = 'v2/shopping/flight-offers';
    final queryParams = {
      'originLocationCode': 'value',
      'destinationLocationCode': 'value',
      'departureDate': 'value',
      'adults': 'value',
    }..removeWhere((key, value) => key == null || value == null);

    return await _getRawDataFromEndpoint(endpointPath, queryParams);
  }

  // https://developers.amadeus.com/self-service/category/air/api-doc/flight-cheapest-date-search/api-reference
  @override
  Future<String> getRawFlightCheapestDateSearch() async {
    // TODO
    final endpointPath = 'v1/path';
    final queryParams = {
      'param1': 'value',
    };

    return await _getRawDataFromEndpoint(endpointPath, queryParams);
  }

  // https://developers.amadeus.com/self-service/category/air/api-doc/flight-offers-price/api-reference
  @override
  Future<String> getRawFlightOffersPrice() async {
    // TODO
    final endpointPath = 'v1/path';
    final queryParams = {
      'param1': 'value',
    };

    return await _getRawDataFromEndpoint(endpointPath, queryParams);
  }

  // https://developers.amadeus.com/self-service/category/air/api-doc/airport-and-city-search/api-reference
  @override
  Future<String> getRawAirportCitySearch() async {
    // TODO
    final endpointPath = 'v1/path';
    final queryParams = {
      'param1': 'value',
    };

    return await _getRawDataFromEndpoint(endpointPath, queryParams);
  }

  // https://developers.amadeus.com/self-service/category/air/api-doc/airline-code-lookup/api-reference
  @override
  Future<String> getRawAirlineCodeLookup() async {
    // TODO
    final endpointPath = 'v1/reference-data/airlines';
    final queryParams = {
      'airlineCodes': 'SWA',
    };

    return await _getRawDataFromEndpoint(endpointPath, queryParams);
  }

  // https://developers.amadeus.com/self-service/category/air/api-doc/flight-inspiration-search/api-reference
  @override
  Future<String> getRawFlightInspirationSearch() async {
    // TODO
    final endpointPath = 'v1/path';
    final queryParams = {
      'param1': 'value',
    };

    return await _getRawDataFromEndpoint(endpointPath, queryParams);
  }

  // https://developers.amadeus.com/self-service/category/air/api-doc/flight-most-booked-destinations/api-reference
  @override
  Future<String> getRawFlightMostBooked() async {
    // TODO
    final endpointPath = 'v1/path';
    final queryParams = {
      'param1': 'value',
    };

    return await _getRawDataFromEndpoint(endpointPath, queryParams);
  }

  // https://developers.amadeus.com/self-service/category/air/api-doc/flight-most-traveled-destinations/api-reference
  @override
  Future<String> getRawFlightMostTravelled() async {
    // TODO
    final endpointPath = 'v1/path';
    final queryParams = {
      'param1': 'value',
    };

    return await _getRawDataFromEndpoint(endpointPath, queryParams);
  }

  // https://developers.amadeus.com/self-service/category/trip/api-doc/travel-recommendations/api-reference
  @override
  Future<String> getRawTravelRecommendation() async {
    // TODO
    final endpointPath = 'v1/path';
    final queryParams = {
      'param1': 'value',
    };

    return await _getRawDataFromEndpoint(endpointPath, queryParams);
  }

  // https://developers.amadeus.com/self-service/category/hotel/api-doc/hotel-search/api-reference
  @override
  Future<String> getRawHotelSearch() async {
    // TODO
    final endpointPath = 'v1/path';
    final queryParams = {
      'param1': 'value',
    };

    return await _getRawDataFromEndpoint(endpointPath, queryParams);
  }

  // https://developers.amadeus.com/self-service/category/destination-content/api-doc/points-of-interest/api-reference
  @override
  Future<String> getRawPointsOfInterest() async {
    // TODO
    final endpointPath = 'v1/path';
    final queryParams = {
      'param1': 'value',
    };

    return await _getRawDataFromEndpoint(endpointPath, queryParams);
  }

  // https://developers.amadeus.com/self-service/category/destination-content/api-doc/safe-place-api/api-reference
  @override
  Future<String> getRawSafePlace() async {
    // TODO
    final endpointPath = 'v1/path';
    final queryParams = {
      'param1': 'value',
    };

    return await _getRawDataFromEndpoint(endpointPath, queryParams);
  }
}
