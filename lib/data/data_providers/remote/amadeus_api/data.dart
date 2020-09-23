import 'package:virtual_traveller_flutter/data/data_providers/remote/amadeus_api/api_service.dart';
import 'package:virtual_traveller_flutter/data/models/location.dart';
import 'package:http/http.dart' as http;

abstract class AmadeusBaseDataProvider {
  // Flights related
  Future<String> getRawNearestAirport(Location location);

  Future<String> getRawFlightOffersSearch();

  Future<String> getRawFlightCheapestDateSearch();

  Future<String> getRawFlightOffersPrice();

  Future<String> getRawAirportCitySearch();

  Future<String> getRawAirlineCodeLookup();

  // Home Page & Destinations related
  Future<String> getRawFlightInspirationSearch();

  Future<String> getRawFlightMostBooked();

  Future<String> getRawFlightMostTravelled();

  Future<String> getRawTravelRecommendation();

  Future<String> getRawHotelSearch();

  Future<String> getRawPointsOfInterest();

  Future<String> getRawSafePlace();
}

/// This does the network calls.
class AmadeusRemoteDataProvider implements AmadeusBaseDataProvider {
  AmadeusRemoteDataProvider(this._apiService);

  final ApiService _apiService;

  String _accessToken;

  Future<String> getRawDataFromResponse(
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

      throw(response);
    };

    try {
      return _checkTokenValidation(onChecked: func);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  /// Check if the _accessToken is not null and is valid.
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
  @override
  Future<String> getRawNearestAirport(Location location) {
    // TODO
  }

  // https://developers.amadeus.com/self-service/category/air/api-doc/flight-offers-search/api-reference
  @override
  Future<String> getRawFlightOffersSearch() async {
    // TODO
  }

  // https://developers.amadeus.com/self-service/category/air/api-doc/flight-cheapest-date-search/api-reference
  @override
  Future<String> getRawFlightCheapestDateSearch() async {
    // TODO
  }

  // https://developers.amadeus.com/self-service/category/air/api-doc/flight-offers-price/api-reference
  @override
  Future<String> getRawFlightOffersPrice() async {
    // TODO
  }

  // https://developers.amadeus.com/self-service/category/air/api-doc/airport-and-city-search/api-reference
  @override
  Future<String> getRawAirportCitySearch() async {
    final endpointPath = 'v1/reference-data/locations';
    final queryParams = {
      'subType': null,
    };

    return await getRawDataFromResponse(endpointPath, queryParams);
  }

  // https://developers.amadeus.com/self-service/category/air/api-doc/airline-code-lookup/api-reference
  @override
  Future<String> getRawAirlineCodeLookup() async {
    final endpointPath = 'v1/reference-data/airlines';
    final queryParams = {
      'airlineCodes': 'SWA',
    };

    return await getRawDataFromResponse(endpointPath, queryParams);
  }

  // https://developers.amadeus.com/self-service/category/air/api-doc/flight-inspiration-search/api-reference
  @override
  Future<String> getRawFlightInspirationSearch() async {
    // TODO
  }

  // https://developers.amadeus.com/self-service/category/air/api-doc/flight-most-booked-destinations/api-reference
  @override
  Future<String> getRawFlightMostBooked() async {
    // TODO
  }

  // https://developers.amadeus.com/self-service/category/air/api-doc/flight-most-traveled-destinations/api-reference
  @override
  Future<String> getRawFlightMostTravelled() async {
    // TODO
  }

  // https://developers.amadeus.com/self-service/category/trip/api-doc/travel-recommendations/api-reference
  @override
  Future<String> getRawTravelRecommendation() async {
    // TODO
  }

  // https://developers.amadeus.com/self-service/category/hotel/api-doc/hotel-search/api-reference
  @override
  Future<String> getRawHotelSearch() async {
    // TODO
  }

  // https://developers.amadeus.com/self-service/category/destination-content/api-doc/points-of-interest/api-reference
  @override
  Future<String> getRawPointsOfInterest() async {
    // TODO
  }

  // https://developers.amadeus.com/self-service/category/destination-content/api-doc/safe-place-api/api-reference
  @override
  Future<String> getRawSafePlace() async {
    // TODO
  }
}
