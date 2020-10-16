import 'package:flutter_test/flutter_test.dart';
import 'package:virtual_traveller_flutter/data/data_providers/remote/amadeus_api/mocked_data.dart';
import 'package:virtual_traveller_flutter/data/models/location.dart';
import 'package:virtual_traveller_flutter/data/models/poi.dart';
import 'package:virtual_traveller_flutter/data/repositories/amadeus_repository.dart';

void main() {
  // TODO test state when in json response the value of category is null, then it should be excluded from the output list
  test('Flights - Points of Interests', () async {
    final amadeusBaseDataProvider = AmadeusRepository(amadeusBaseDataProvider: AmadeusMockedDataProvider());
    final destinations = await amadeusBaseDataProvider.getPointsOfInterest(null, null);

    print(destinations);
    expect(destinations.length, 10);
    expect(
      [
        destinations[0],
        destinations[1],
        destinations[destinations.length - 1],
      ],
      [
        POI(
          name: 'Casa Batlló',
          category: CategoryPOI.SIGHTS,
          geoCode: Location(latitude: 41.39165, longitude: 2.164772),
        ),
        POI(
          name: 'La Pepita',
          category: CategoryPOI.RESTAURANT,
          geoCode: Location(latitude: 41.397987, longitude: 2.161159),
        ),
        POI(
          name: 'Osmosis',
          category: CategoryPOI.RESTAURANT,
          geoCode: Location(latitude: 41.390198, longitude: 2.156974),
        ),
      ],
    );
  });
}
