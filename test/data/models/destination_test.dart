import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:virtual_traveller_flutter/data/data_providers/remote/amadeus_api/mocked_data.dart';
import 'package:virtual_traveller_flutter/data/models/destination.dart';

void main() {
  test('destinationTest', () async {
    final amadeusBaseDataProvider = AmadeusMockedDataProvider();
    final rawData = await amadeusBaseDataProvider.getRawFlightMostTravelled(null);
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
