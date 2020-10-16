import 'package:flutter_test/flutter_test.dart';
import 'package:virtual_traveller_flutter/data/data_providers/remote/amadeus_api/base_data.dart';
import 'package:virtual_traveller_flutter/data/data_providers/remote/amadeus_api/mocked_data.dart';
import 'package:virtual_traveller_flutter/data/models/airport.dart';
import 'package:virtual_traveller_flutter/data/models/location.dart';
import 'package:virtual_traveller_flutter/data/repositories/amadeus_repository.dart';

void main() {
  group('Flights - Nearest Airport', () {
    AmadeusBaseDataProvider amadeusBaseDataProvider;
    AmadeusRepository amadeusRepository;

    setUp(() {
      amadeusBaseDataProvider = AmadeusMockedDataProvider();
      amadeusRepository = AmadeusRepository(amadeusBaseDataProvider: amadeusBaseDataProvider);
    });

    test('fromJson Airport List output', () async {
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
            name: 'HEATHROW',
            airportIataCode: 'LHR',
            address: Address(
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
            name: 'BIRMINGHAM',
            airportIataCode: 'BHX',
            address: Address(
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
            name: 'EAST MIDLANDS',
            airportIataCode: 'EMA',
            address: Address(
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
  });
}
