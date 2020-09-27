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
      final valueSafeMap = <String, String>{};
      queryParams.forEach((key, value) {
        if (value != null) {
          valueSafeMap[key] = value.toString();
        }
      });
      queryParams = valueSafeMap;

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
      'latitude': location.lat, // ---REQUIRED---
      'longitude': location.long, // ---REQUIRED---
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
      'originLocationCode': 'SYD', // ---REQUIRED---, IATA code
      'destinationLocationCode': 'BKK', // ---REQUIRED---, IATA code
      'adults': 1, // ---REQUIRED---, the number of adult travelers (age 12 or older on date of departure)
      'departureDate': '2017-12-25', // ---REQUIRED---, ISO 8601 YYYY-MM-DD format, e.g. 2017-12-25
      'returnDate': '2018-02-28', // format same as departureDate, if null then it is one-way, otherwise round-trip
      'children': 0, // the number of child travelers (older than age 2 and younger than age 12 on date of departure)
      'infants': 0, // the number of infant travelers (whose age is less or equal to 2 on date of departure), infants travel on the lap of an adult traveler, and thus the number of infants must not exceed the number of adults
      'travelClass': 'ECONOMY', // ECONOMY, PREMIUM_ECONOMY, BUSINESS, FIRST; if no travel class is specified, the search considers any travel class
      'nonStop': false, // if set to true, the search will find only flights going from the origin to the destination with no stop in between
      'currencyCode': 'EUR', // the preferred currency for the flight offers, currency is specified in the ISO 4217 format, e.g. EUR for Euro
      'maxPrice': 500, // maximum price per traveler, by default, no limit is applied, if specified, the value should be a positive number with no decimals
      'max': 100, // maximum number of flight offers to return, if specified, the value should be greater than or equal to 1 (default 250)
    };

    return await _getRawDataFromEndpoint(endpointPath, queryParams);
  }

  // https://developers.amadeus.com/self-service/category/air/api-doc/flight-cheapest-date-search/api-reference
  /// *"What are the cheapest dates to fly from Munich to Sao Paulo?"*
  ///
  /// The Flight Cheapest Date Search API finds the cheapest dates to travel from
  /// one city to another. The API provides list of flight options with dates and prices,
  /// and allows you to order by price, departure date or duration.
  /// The API provides a link to [Flight Offers Search](https://developers.amadeus.com/self-service/category/air/api-doc/flight-offers-search)
  /// to complete the flight search using the chosen dates.
  @override
  Future<String> getRawFlightCheapestDateSearch() async {
    // TODO
    final endpointPath = 'v1/shopping/flight-dates';
    final queryParams = {
      '__': '__',
    };

    return await _getRawDataFromEndpoint(endpointPath, queryParams);
  }

  // https://developers.amadeus.com/self-service/category/air/api-doc/airport-and-city-search/api-reference
  /// *"Which cities and airports begin with Lon..?"*
  ///
  /// The Airport & City Search API finds airports and cities that match a specific word or string
  /// of letters. Using this API, you can automatically suggest airports based on what the
  /// traveler enters in the search field. The API provides a list of airports/cities ordered by
  /// yearly passenger volume with the name, 3-letter IATA code, time zone and
  /// coordinates of each airport.
  @override
  Future<String> getRawAirportCitySearch() async {
    // TODO
    final endpointPath = 'v1/reference-data/locations';
    final queryParams = {
      '__': '__',
    };

    return await _getRawDataFromEndpoint(endpointPath, queryParams);
  }

  // https://developers.amadeus.com/self-service/category/air/api-doc/airline-code-lookup/api-reference
  /// *"What is the name of the airline with the given IATA code EK?"*
  ///
  /// The Airline Code Lookup API lets you find the name of an airline by
  /// its IATA or ICAO airline code. You can search for multiple airline names by
  /// including various airline codes in the same request.
  @override
  Future<String> getRawAirlineCodeLookup() async {
    final endpointPath = 'v1/reference-data/airlines';
    final queryParams = {
      // Code of the airline following IATA standard (IATA table codes: http://www.iata.org/publications/Pages/code-search.aspx)
      // or ICAO standard (ICAO airlines table codes: https://en.wikipedia.org/wiki/List_of_airline_codes).

      // Several airlines can be selected at once by sending a list separated by a coma (i.e. AF, SWA).
      'airlineCodes': 'BA',
    };

    return await _getRawDataFromEndpoint(endpointPath, queryParams);
  }

  // https://developers.amadeus.com/self-service/category/air/api-doc/flight-inspiration-search/api-reference
  /// *"What are the cheapest places to fly from Boston?*
  ///
  /// Help travelers discover their next destination by finding the cheapest
  /// flight destinations from a specific city. The Flight Inspiration Search API provides
  /// a list of destinations from a given city that is ordered by price and
  /// can be filtered by departure date or maximum price. The API provides
  /// a link to [Flight Offers Search](https://developers.amadeus.com/self-service/category/air/api-doc/flight-offers-search)
  /// to search for flights once a destination is chosen and a link to
  /// [Flight Cheapest Date Search](https://developers.amadeus.com/self-service/category/air/api-doc/flight-cheapest-date-search)
  /// to check the cheapest dates to fly.
  @override
  Future<String> getRawFlightInspirationSearch() async {
    // TODO
    final endpointPath = 'v1/shopping/flight-destinations';
    final queryParams = {
      '__': '__',
    };

    return await _getRawDataFromEndpoint(endpointPath, queryParams);
  }

  // https://developers.amadeus.com/self-service/category/air/api-doc/flight-most-booked-destinations/api-reference
  /// *"Which destinations are most frequently booked by travelers in New Delhi?"*
  ///
  /// Get insight into local booking trends by finding which destinations are most frequently
  /// booked by travelers in a specific city. The Flight Most Booked Destinations API provides a
  /// list of the most booked destinations by travelers from a given city, each with a
  /// flight score (flights to the destination as a percentage of total departures) and
  /// a traveler score (number of passengers traveling to the destination as a
  /// percentage of total passenger departures).
  @override
  Future<String> getRawFlightMostBooked() async {
    // TODO
    final endpointPath = 'v1/travel/analytics/air-traffic/booked';
    final queryParams = {
      '__': '__',
    };

    return await _getRawDataFromEndpoint(endpointPath, queryParams);
  }

  // https://developers.amadeus.com/self-service/category/air/api-doc/flight-most-traveled-destinations/api-reference
  /// *"What are the most visited destinations among travelers in New York City?"*
  ///
  /// Get insight into local travel habits by finding which destinations are most visited by
  /// travelers from a specific city. The Flight Most Traveled Destinations API returns a
  /// list of the most popular flight destinations among travelers from a
  /// given city, each with a flight score (flights to the destination as a
  /// percentage of total departures) and a traveler score
  /// (number of passengers traveling to the destination as a percentage of total passenger departures).
  @override
  Future<String> getRawFlightMostTravelled() async {
    // TODO
    final endpointPath = 'v1/travel/analytics/air-traffic/traveled';
    final queryParams = {
      '__': '__',
    };

    return await _getRawDataFromEndpoint(endpointPath, queryParams);
  }

  // https://developers.amadeus.com/self-service/category/trip/api-doc/travel-recommendations/api-reference
  /// *"If a traveler has shown interest in Berlin, what other destinations would he/she like?"*
  ///
  /// The Travel Recommendations API provides travelers personalized destination recommendations
  /// based on their location and an input destination, such as a previously
  /// searched flight destination or city of interest. The API uses Artificial Intelligence
  /// trained on Amadeus historical flight search data to determine which destinations are
  /// also popular among travelers with similar profiles, and provides a list of
  /// recommended destinations with name, IATA code, coordinates and similarity score.
  @override
  Future<String> getRawTravelRecommendation() async {
    // TODO
    final endpointPath = 'v1/reference-data/recommended-locations';
    final queryParams = {
      '__': '__',
    };

    return await _getRawDataFromEndpoint(endpointPath, queryParams);
  }

  // https://developers.amadeus.com/self-service/category/hotel/api-doc/hotel-search/api-reference
  /// *"What are the best hotel deals during my trip?"*
  ///
  /// The Hotel Search API finds the best deals at over 150,000 hotels worldwide.
  /// The API provides a list of the cheapest hotels in a given location with
  /// detailed information on each hotel and the option to filter by
  /// category, chain, facilities or budget range. Once a hotel is chosen, the API provides the
  /// available rooms and prices. The API as three endpoints - the first finds the
  /// cheapest available hotels in a chosen city, the second shows room and amenity details and
  /// the third fetches the real-time price of the desired room.
  ///
  /// You can combine this API with the [Hotel Booking API](https://developers.amadeus.com/self-service/category/hotel/api-doc/hotel-booking)
  /// to build a complete [hotel booking engine](https://developers.amadeus.com/blog/build-hotel-booking-engine-amadeus-api).
  @override
  Future<String> getRawHotelSearch() async {
    // TODO
    final endpointPath = 'v2/shopping/hotel-offers';
    final queryParams = {
      '__': '__',
    };

    return await _getRawDataFromEndpoint(endpointPath, queryParams);
  }

  // https://developers.amadeus.com/self-service/category/destination-content/api-doc/points-of-interest/api-reference
  /// *"What are the best places to visit in Barcelona?"*
  ///
  /// The Points of Interest API finds the best attractions in a given city or area.
  /// The API provides a ranked list of attractions and the
  /// name, coordinates, category (sights, beach/park, historical, nightlife, restaurant or shopping),
  /// tags and score for each one. The scores are powered by the [AVUXI TopPlace](https://www.avuxi.com/)
  /// algorithm which analyzes millions of online reviews, photos and comments to determine popularity.
  @override
  Future<String> getRawPointsOfInterest(Location location) async {
    // TODO
    final endpointPath = 'v1/reference-data/locations/pois';
    final queryParams = {
      'latitude': location.lat, // ---REQUIRED---
      'longitude': location.long, // ---REQUIRED---
      '__': '__',
      '__': '__',
    };

    return await _getRawDataFromEndpoint(endpointPath, queryParams);
  }

  // https://developers.amadeus.com/self-service/category/destination-content/api-doc/safe-place-api/api-reference
  /// *"How safe is this location?"*
  ///
  /// The Safe Place API provides updated safety and security ratings for over 40,000 cities and
  /// neighborhoods worldwide, helping travelers consult and compare destination safety.
  /// The API returns an overall safety score and scores for six categories:
  /// women's safety, health, physical threats, theft, political freedom and LGBTQ safety.
  /// The scores are powered by the GeoSure GeoSafeScores](https://geosureglobal.com/)
  /// algorithm which analyzes crime, health and economic data, official travel alerts,
  /// local reporting and a variety of other sources.
  @override
  Future<String> getRawSafePlace(Location location) async {
    final endpointPath = 'v1/safety/safety-rated-locations';
    final queryParams = {
      'latitude': location.lat, // ---REQUIRED---
      'longitude': location.long, // ---REQUIRED---
      'page[limit]': 1, // maximum items in one page (enough is to see safety only of the city and not also of the each district)
    };

    return await _getRawDataFromEndpoint(endpointPath, queryParams);
  }
}
