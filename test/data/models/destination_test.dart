import 'package:flutter_test/flutter_test.dart';
import 'package:virtual_traveller_flutter/data/data_providers/remote/amadeus_api/fake_data.dart';
import 'package:virtual_traveller_flutter/data/models/destination.dart';
import 'package:virtual_traveller_flutter/data/repositories/amadeus_repository.dart';

void main() {
  group('Flights - Destinations', () {
    AmadeusRepository amadeusRepository;

    setUp(() {
      amadeusRepository = AmadeusRepository(
        amadeusBaseDataProvider: AmadeusFakeDataProvider(),
      );
    });

    test('Flights - Most travelled', () async {
      final destinations = await amadeusRepository.getFlightMostTravelled(null);

      expect(
        destinations,
        [
          Destination.base('PAR'),
          Destination.base('BCN'),
          Destination.base('TCI'),
          Destination.base('LON'),
          Destination.base('BRU'),
          Destination.base('NYC'),
          Destination.base('UIO'),
          Destination.base('SDQ'),
          Destination.base('OPO'),
          Destination.base('DXB'),
        ],
      );
    });

    test('Flights - Travel recommendation', () async {
      final destinations =
          await amadeusRepository.getTravelRecommendation(null);

      expect(destinations.length, 2);

      expect(
        destinations,
        [
          DestinationIATA(name: 'PAR', subtype: 'CITY'),
          DestinationIATA(name: 'MAD', subtype: 'CITY'),
        ],
      );
    });
  });
}
