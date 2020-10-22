import 'package:flutter_test/flutter_test.dart';
import 'package:virtual_traveller_flutter/data/data_providers/remote/amadeus_api/base_data.dart';
import 'package:virtual_traveller_flutter/data/data_providers/remote/amadeus_api/mocked_data.dart';
import 'package:virtual_traveller_flutter/data/models/airport.dart';
import 'package:virtual_traveller_flutter/data/models/location.dart';
import 'package:virtual_traveller_flutter/data/repositories/amadeus_repository.dart';

void main() {
  group('Flights API', () {
    AmadeusBaseDataProvider amadeusBaseDataProvider;
    AmadeusRepository amadeusRepository;

    setUp(() {
      amadeusBaseDataProvider = AmadeusMockedDataProvider();
      amadeusRepository = AmadeusRepository(amadeusBaseDataProvider: amadeusBaseDataProvider);
    });

    test('Nearest Airport: fromJson Airport List output', () async {
      final airports = await amadeusRepository.getNearestAirport(null);

      expect(airports.length, 6);
      expect(
        [
          airports[0],
          airports[1],
          airports[airports.length - 1],
        ],
        [
          Airport(
            cityName: 'HEATHROW',
            airportCode: 'LHR',
            address: AirportAddress(
              cityName: 'LONDON',
              cityCode: 'LON',
              countryName: 'UNITED KINGDOM',
              countryCode: 'GB',
              regionCode: 'EUROP',
            ),
            geoCode: Location(
              latitude: 51.47294,
              longitude: -0.45061,
            ),
          ),
          Airport(
            cityName: 'BIRMINGHAM',
            airportCode: 'BHX',
            address: AirportAddress(
              cityName: 'BIRMINGHAM',
              cityCode: 'BHX',
              countryName: 'UNITED KINGDOM',
              countryCode: 'GB',
              regionCode: 'EUROP',
            ),
            geoCode: Location(
              latitude: 52.45386,
              longitude: -1.74803,
            ),
          ),
          Airport(
            cityName: 'EAST MIDLANDS',
            airportCode: 'EMA',
            address: AirportAddress(
              cityName: 'NOTTINGHAM',
              cityCode: 'NQT',
              countryName: 'UNITED KINGDOM',
              countryCode: 'GB',
              regionCode: 'EUROP',
            ),
            geoCode: Location(
              latitude: 52.83111,
              longitude: -1.32806,
            ),
          ),
        ],
      );
    });

    test('Airport & City Search: fromJson Airport List output', () async {
      final airports = await amadeusRepository.getAirportCitySearch(null);

      // orig mocked data have 2 values, but same city, where duplicate
      // will be filtered while doing fromJson because we only need unique city codes
      // not airport codes
      expect(airports.length, 4);
      // TODO: Add more
      expect(
        airports[0],
        Airport(
          cityName: 'MUNICH INTERNATIONAL',
          airportCode: 'MUC',
          address: AirportAddress(
            cityName: 'MUNICH',
            cityCode: 'MUC',
            countryName: 'GERMANY',
            countryCode: 'DE',
            regionCode: 'EUROP',
          ),
          geoCode: Location(
            latitude: 48.35378,
            longitude: 11.78609,
          ),
        ),
      );
    });
  });
}
