import 'package:virtual_traveller_flutter/data/models/location.dart';

abstract class AmadeusBaseDataProvider {
  // Flights related
  Future<String> getRawNearestAirport(Location location);

  Future<String> getRawFlightOffersSearch();

  Future<String> getRawFlightCheapestDateSearch();

  Future<String> getRawAirportCitySearch();

  Future<String> getRawAirlineCodeLookup();

  // Home Page & Destinations related
  Future<String> getRawFlightMostBooked();

  Future<String> getRawFlightMostTravelled(String originCityCode);

  Future<String> getRawTravelRecommendation(List<String> cityCodes);

  Future<String> getRawHotelSearch();

  Future<String> getRawPointsOfInterest(Location location);

  Future<String> getRawSafePlace(Location location);
}
