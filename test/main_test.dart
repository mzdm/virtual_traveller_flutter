import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:virtual_traveller_flutter/data/data_providers/remote/amadeus_api/mocked_data.dart';
import 'package:virtual_traveller_flutter/data/models/flights/destination.dart';

void main() {
  test('a passing test', () {
    expect(true, true);
  });

  test('destinationTest', () async {
    final amadeusBaseDataProvider = AmadeusMockedDataProvider();
    final rawData = await amadeusBaseDataProvider.getRawFlightMostTravelled();
    final data = json.decode(rawData)['data'];

    final destinations = (data as List).map((item) {
      return Destination.fromJson(item);
    }).toList();

    print(destinations);
    expect(
      destinations,
      [
        Destination('PAR'),
        Destination('BCN'),
        Destination('TCI'),
        Destination('LON'),
        Destination('BRU'),
        Destination('NYC'),
        Destination('UIO'),
        Destination('SDQ'),
        Destination('OPO'),
        Destination('DXB'),
      ],
    );
  });
}
