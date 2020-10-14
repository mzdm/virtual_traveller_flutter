import 'package:meta/meta.dart';
import 'package:virtual_traveller_flutter/data/models/location.dart';
import 'package:virtual_traveller_flutter/data/models/poi.dart';

abstract class AmadeusBaseDataProvider {
  // Flights related
  Future<String> getRawNearestAirport(
    Location location,
  );

  Future<String> getRawFlightOffersSearch();

  Future<String> getRawFlightCheapestDateSearch();

  Future<String> getRawAirportCitySearch();

  Future<String> getRawAirlineCodeLookup();

  // Home Page & Destinations related
  Future<String> getRawFlightMostBooked();

  Future<String> getRawFlightMostTravelled(
    String originCityCode,
  );

  Future<String> getRawTravelRecommendation(
    List<String> cityCodes,
  );

  Future<String> getRawHotelSearch();

  Future<String> getRawPointsOfInterest({
    @required Location location,
    CategoryPOI category,
  });

  Future<String> getRawSafePlace(Location location);
}
