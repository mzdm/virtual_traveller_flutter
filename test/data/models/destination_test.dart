import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:virtual_traveller_flutter/data/data_providers/remote/amadeus_api/base_data.dart';
import 'package:virtual_traveller_flutter/data/data_providers/remote/amadeus_api/fake_data.dart';
import 'package:virtual_traveller_flutter/data/models/destination.dart';

void main() {
  group('Destination model', () {
    AmadeusBaseDataProvider amadeusDataProvider;

    setUp(() {
      amadeusDataProvider = AmadeusFakeDataProvider();
    });

    test('Flights - Most booked', () async {
      final rawData = await amadeusDataProvider.getRawFlightMostTravelled(null);
      final data = json.decode(rawData)['data'];

      final destinations = (data as List).map((item) {
        try {
          return DestinationBase.fromJson(item);
        } catch (e) {
          print(e);
          return null;
        }
      }).toList()
        ..removeWhere((element) => element == null);

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

    test('Flights - Most travelled', () async {
      final rawData = await amadeusDataProvider.getRawFlightMostTravelled(null);
      final data = json.decode(rawData)['data'];

      final destinations = (data as List).map((item) {
        return DestinationBase.fromJson(item);
      }).toList();

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
      final rawData = await amadeusDataProvider.getRawTravelRecommendation(null);
      final data = json.decode(rawData)['data'];

      final destinations = (data as List).map((item) {
        try {
          return DestinationIATA.fromJson(item);
        } catch (e) {
          print(e);
          return null;
        }
      }).toList()
        ..removeWhere((element) => element == null);

      expect(destinations.length, 2);

      expect(destinations, [
        Destination.iata(name: 'PAR', subtype: 'CITY'),
        Destination.iata(name: 'MAD', subtype: 'CITY'),
      ]);

      expect(destinations, [
        DestinationIATA(name: 'PAR', subtype: 'CITY'),
        DestinationIATA(name: 'MAD', subtype: 'CITY'),
      ]);
    });
  });
}
