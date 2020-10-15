import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:virtual_traveller_flutter/data/data_providers/remote/amadeus_api/mocked_data.dart';
import 'package:virtual_traveller_flutter/data/models/destination.dart';

void main() {
  group('Destination model', () {
    test('Flights - Most travelled', () async {
      final amadeusBaseDataProvider = AmadeusMockedDataProvider();
      final rawData = await amadeusBaseDataProvider.getRawFlightMostTravelled(null);
      final data = json.decode(rawData)['data'];

      final destinations = (data as List).map((item) {
        return DestinationBase.fromJson(item);
      }).toList();

      print(destinations);

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

      expect(
        destinations,
        [
          DestinationBase('PAR'),
          DestinationBase('BCN'),
          DestinationBase('TCI'),
          DestinationBase('LON'),
          DestinationBase('BRU'),
          DestinationBase('NYC'),
          DestinationBase('UIO'),
          DestinationBase('SDQ'),
          DestinationBase('OPO'),
          DestinationBase('DXB'),
        ],
      );
    });

    test('Flights - Travel recommendation', () async {
      final rawData = await AmadeusMockedDataProvider().getRawTravelRecommendation(null);
      final data = json.decode(rawData)['data'];

      final destinations = (data as List).map((item) {
        return DestinationIATA.fromJson(item);
      }).toList();

      print(destinations);

      expect(destinations, [
        Destination.iata('PAR'),
        Destination.iata('MAD'),
      ]);

      expect(destinations, [
        DestinationIATA('PAR'),
        DestinationIATA('MAD'),
      ]);
    });
  });
}
