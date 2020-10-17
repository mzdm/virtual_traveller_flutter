import 'package:meta/meta.dart';
import 'package:virtual_traveller_flutter/data/models/location.dart';

// TODO: Add APIs: Multicity search; AI Photos
/// **Quick links**
///
/// *Flights related*:
/// - [getRawNearestAirport]
/// - [getRawFlightOffersSearch]
/// - [getRawFlightCheapestDateSearch]
/// - [getRawAirportCitySearch]
/// - [getRawAirlineCodeLookup]
///
/// *Home Page & Destinations related*:
/// - [getRawFlightMostBooked]
/// - [getRawFlightMostTravelled]
/// - [getRawTravelRecommendation]
/// - [getRawHotelSearch]
/// - [getRawPointsOfInterest]
/// - [getRawSafePlace]
abstract class AmadeusBaseDataProvider {
  // Flights related
  /// *"What are the nearest major airports to this location?"*
  ///
  /// The Airport Nearest Relevant API finds the closest major airports to a starting point.
  /// The API provides a list of commercial airports within a 500km (311mi) radius of a
  /// given point that are ordered by relevance, which considers their distance from
  /// the starting point and their yearly flight traffic. For each airport,
  /// the API provides the name, 3-letter [IATA code](http://www.iata.org/publications/Pages/code-search.aspx),
  /// time zone and coordinates.
  ///
  /// *[Nearest Airport API docs](https://developers.amadeus.com/self-service/category/air/api-doc/airport-nearest-relevant/api-reference)*
  Future<String> getRawNearestAirport(
    Location location,
  );

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
  /// *[Flight Offers Search API docs](https://developers.amadeus.com/self-service/category/air/api-doc/flight-offers-search/api-reference)*
  Future<String> getRawFlightOffersSearch({
    @required String originCity,
    @required String destinationCity,
    @required String departureDate,
    String returnDate,
    @required int adults,
    int children,
    int infants,
    String travelClass,
    bool nonStop,
    String currencyCode,
    int maxPrice,
  });

  /// *"What are the cheapest dates to fly from Munich to Sao Paulo?"*
  ///
  /// The Flight Cheapest Date Search API finds the cheapest dates to travel from
  /// one city to another. The API provides list of flight options with dates and prices,
  /// and allows you to order by price, departure date or duration.
  /// The API provides a link to [Flight Offers Search](https://developers.amadeus.com/self-service/category/air/api-doc/flight-offers-search)
  /// to complete the flight search using the chosen dates.
  ///
  /// *[Flight Cheapest Date Search API docs](https://developers.amadeus.com/self-service/category/air/api-doc/flight-cheapest-date-search/api-reference)*
  Future<String> getRawFlightCheapestDateSearch({
    @required String originCity,
    @required String destinationCity,
  });

  /// *"Which cities and airports begin with Lon..?"*
  ///
  /// The Airport & City Search API finds airports and cities that match a specific word or string
  /// of letters. Using this API, you can automatically suggest airports based on what the
  /// traveler enters in the search field. The API provides a list of airports/cities ordered by
  /// yearly passenger volume with the name, 3-letter IATA code, time zone and
  /// coordinates of each airport.
  ///
  /// *[Airport & City Search API docs](https://developers.amadeus.com/self-service/category/air/api-doc/airport-and-city-search/api-reference)*
  Future<String> getRawAirportCitySearch(
    String textSearchKeyword,
  );

  /// *"What is the name of the airline with the given IATA code EK?"*
  ///
  /// The Airline Code Lookup API lets you find the name of an airline by
  /// its IATA or ICAO airline code. You can search for multiple airline names by
  /// including various airline codes in the same request.
  ///
  /// *[Airline Code Lookup API docs](https://developers.amadeus.com/self-service/category/air/api-doc/airline-code-lookup/api-reference)*
  Future<String> getRawAirlineCodeLookup(
    String airlineCode,
  );

  // Home Page & Destinations related
  /// *"Which destinations are most frequently booked by travelers in New Delhi?"*
  ///
  /// Get insight into local booking trends by finding which destinations are most frequently
  /// booked by travelers in a specific city. The Flight Most Booked Destinations API provides a
  /// list of the most booked destinations by travelers from a given city, each with a
  /// flight score (flights to the destination as a percentage of total departures) and
  /// a traveler score (number of passengers traveling to the destination as a
  /// percentage of total passenger departures).
  ///
  /// *[Flight Most Booked Destinations API docs](https://developers.amadeus.com/self-service/category/air/api-doc/flight-most-booked-destinations/api-reference)*
  Future<String> getRawFlightMostBooked(
    String originCityCode,
  );

  /// *"What are the most visited destinations among travelers in New York City?"*
  ///
  /// Get insight into local travel habits by finding which destinations are most visited by
  /// travelers from a specific city. The Flight Most Traveled Destinations API returns a
  /// list of the most popular flight destinations among travelers from a
  /// given city, each with a flight score (flights to the destination as a
  /// percentage of total departures) and a traveler score
  /// (number of passengers traveling to the destination as a percentage of total passenger departures).
  ///
  /// *[Flight Most Traveled Destinations API docs](https://developers.amadeus.com/self-service/category/air/api-doc/flight-most-traveled-destinations/api-reference)*
  Future<String> getRawFlightMostTravelled(
    String originCityCode,
  );

  /// *"If a traveler has shown interest in Berlin, what other destinations would he/she like?"*
  ///
  /// The Travel Recommendations API provides travelers personalized destination recommendations
  /// based on their location and an input destination, such as a previously
  /// searched flight destination or city of interest. The API uses Artificial Intelligence
  /// trained on Amadeus historical flight search data to determine which destinations are
  /// also popular among travelers with similar profiles, and provides a list of
  /// recommended destinations with name, IATA code, coordinates and similarity score.
  ///
  /// The API recommends destinations for travelers in the following countries of departure:
  ///   - France, UK, Germany, Italy, Spain, Netherlands, USA, Argentina, Mexico and South Africa
  ///
  /// Use case in this app:
  ///   - store locally city codes which user has searched for and use them for recommendations
  ///   - if it is first time user, display random
  ///
  /// *[Travel Recommendations API docs](https://developers.amadeus.com/self-service/category/trip/api-doc/travel-recommendations/api-reference)*
  Future<String> getRawTravelRecommendation(
    List<String> cityCodes,
  );

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
  ///
  /// *[Hotel Search API docs](https://developers.amadeus.com/self-service/category/hotel/api-doc/hotel-search/api-reference)*
  Future<String> getRawHotelSearch({
    @required String cityCode,
    String language,
  });

  /// *"What are the best places to visit in Barcelona?"*
  ///
  /// The Points of Interest API finds the best attractions in a given city or area.
  /// The API provides a ranked list of attractions and the
  /// name, coordinates, category (sights, beach/park, historical, nightlife, restaurant or shopping),
  /// tags and score for each one. The scores are powered by the [AVUXI TopPlace](https://www.avuxi.com/)
  /// algorithm which analyzes millions of online reviews, photos and comments to determine popularity.
  ///
  /// Scores indicate positive traveler sentiments and may not reflect the most visited attractions.
  ///
  /// *[Points of Interest API docs](https://developers.amadeus.com/self-service/category/destination-content/api-doc/points-of-interest/api-reference)*
  Future<String> getRawPointsOfInterest({
    @required Location location,
    List<String> categories,
  });

  /// *"How safe is this location?"*
  ///
  /// The Safe Place API provides updated safety and security ratings for over 40,000 cities and
  /// neighborhoods worldwide, helping travelers consult and compare destination safety.
  /// The API returns an overall safety score and scores for six categories:
  /// women's safety, health, physical threats, theft, political freedom and LGBTQ safety.
  /// The scores are powered by the GeoSure GeoSafeScores](https://geosureglobal.com/)
  /// algorithm which analyzes crime, health and economic data, official travel alerts,
  /// local reporting and a variety of other sources.
  ///
  /// *[Safe Place API docs](https://developers.amadeus.com/self-service/category/destination-content/api-doc/safe-place-api/api-reference)*
  Future<String> getRawSafePlace(
    Location location,
  );
}
