import 'package:flutter_test/flutter_test.dart';
import 'package:virtual_traveller_flutter/data/data_providers/remote/amadeus_api/base_data.dart';
import 'package:virtual_traveller_flutter/data/data_providers/remote/amadeus_api/fake_data.dart';
import 'package:virtual_traveller_flutter/data/models/airline.dart';
import 'package:virtual_traveller_flutter/data/repositories/amadeus_repository.dart';

void main() {
  group('Flights - Airline Code lookup', () {
    AmadeusBaseDataProvider amadeusBaseDataProvider;
    AmadeusRepository amadeusRepository;

    setUp(() {
      amadeusBaseDataProvider = AmadeusFakeDataProvider();
      amadeusRepository = AmadeusRepository(amadeusBaseDataProvider: amadeusBaseDataProvider);
    });

    test('fromJson Airline output', () async {
      final airline = await amadeusRepository.getAirlineCodeLookup(null);

      expect(
        airline,
        Airline(
          iataCode: 'BA',
          businessName: 'BRITISH AIRWAYS',
          commonName: 'BRITISH A/W',
        ),
      );
    });
  });
}
