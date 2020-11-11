import 'package:flutter_test/flutter_test.dart';
import 'package:virtual_traveller_flutter/data/data_providers/remote/amadeus_api/base_data.dart';
import 'package:virtual_traveller_flutter/data/data_providers/remote/amadeus_api/fake_data.dart';
import 'package:virtual_traveller_flutter/data/models/safety_rate.dart';
import 'package:virtual_traveller_flutter/data/repositories/amadeus_repository.dart';

void main() {
  group('Flights - Safety Rate', () {
    AmadeusBaseDataProvider amadeusBaseDataProvider;
    AmadeusRepository amadeusRepository;

    setUp(() {
      amadeusBaseDataProvider = AmadeusFakeDataProvider();
      amadeusRepository = AmadeusRepository(amadeusBaseDataProvider: amadeusBaseDataProvider);
    });

    test('fromJson SafetyRate List output', () async {
      final safetyRate = await amadeusRepository.getSafePlace(null);

      expect(
        safetyRate,
        SafetyRate(
          name: 'Barcelona',
          subType: 'CITY',
          safetyScores: SafetyScores(
            overall: 45,
            lgbtq: 39,
            medical: 0,
            physicalHarm: 36,
            politicalFreedom: 50,
            theft: 44,
            women: 34,
          ),
        ),
      );
    });
  });
}
