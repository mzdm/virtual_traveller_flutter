import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:virtual_traveller_flutter/data/data_providers/remote/amadeus_api/fake_data.dart';
import 'package:virtual_traveller_flutter/data/models/location.dart';
import 'package:virtual_traveller_flutter/data/models/poi.dart';
import 'package:virtual_traveller_flutter/data/repositories/amadeus_repository.dart';

class MockAmadeusFakeDataProvider extends Mock
    implements AmadeusFakeDataProvider {}

// one item contains null category, which should be filtered out in fromJson
const mockFakePoiData =
    '''{"data":[{"type":"location","subType":"POINT_OF_INTEREST","id":"15C8B8148C","self":{"href":"https://test.api.amadeus.com/v1/reference-data/locations/pois/15C8B8148C","methods":["GET"]},"geoCode":{"latitude":41.392677,"longitude":2.153942},"name":"Dry Martini","rank":100,"tags":["bar","restaurant","nightlife","club","sightseeing","attraction","activities"]},{"type":"location","subType":"POINT_OF_INTEREST","id":"BD29CF2CCD","self":{"href":"https://test.api.amadeus.com/v1/reference-data/locations/pois/BD29CF2CCD","methods":["GET"]},"geoCode":{"latitude":41.399193,"longitude":2.159853},"name":"Con Gracia","category":"RESTAURANT","rank":100,"tags":["restaurant","sightseeing","commercialplace","professionalservices","activities"]},{"type":"location","subType":"POINT_OF_INTEREST","id":"24DE6CE737","self":{"href":"https://test.api.amadeus.com/v1/reference-data/locations/pois/24DE6CE737","methods":["GET"]},"geoCode":{"latitude":41.390198,"longitude":2.156974},"name":"Osmosis","category":"RESTAURANT","rank":100,"tags":["restaurant","shopping","transport","professionalservices"]}],"meta":{"count":120,"links":{"self":"https://test.api.amadeus.com/v1/reference-data/locations/pois?latitude=41.397158&longitude=2.160873","next":"https://test.api.amadeus.com/v1/reference-data/locations/pois?latitude=41.397158&longitude=2.160873&page[offset]=10&page[limit]=10","last":"https://test.api.amadeus.com/v1/reference-data/locations/pois?latitude=41.397158&longitude=2.160873&page[offset]=120&page[limit]=10","first":"https://test.api.amadeus.com/v1/reference-data/locations/pois?latitude=41.397158&longitude=2.160873&page[offset]=0&page[limit]=10","up":"https://test.api.amadeus.com/v1/reference-data/locations/pois?latitude=41.397158&longitude=2.160873"}}}''';

// TODO Refactor
void main() {
  group('Flights - POI', () {
    AmadeusRepository amadeusRepository;

    setUp(() {
      amadeusRepository = AmadeusRepository(
        amadeusBaseDataProvider: AmadeusFakeDataProvider(),
      );
    });

    test('fromJson POI List output', () async {
      final pois = await amadeusRepository.getPointsOfInterest(location: null);

      print(pois);
      expect(pois.length, 10);
      expect(
        [
          pois[0],
          pois[1],
          pois[pois.length - 1],
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
  });

  group('Flights - POI (mock)', () {
    MockAmadeusFakeDataProvider mockAmadeusFakeDataProvider;
    AmadeusRepository amadeusRepository;

    setUp(() {
      mockAmadeusFakeDataProvider = MockAmadeusFakeDataProvider();
      amadeusRepository = AmadeusRepository(
        amadeusBaseDataProvider: mockAmadeusFakeDataProvider,
      );
    });

    test('omit null items on which was throwed an exception', () async {
      when(mockAmadeusFakeDataProvider.getRawPointsOfInterest(location: null))
          .thenAnswer((_) async => mockFakePoiData);

      final pois = await amadeusRepository.getPointsOfInterest(location: null);

      verify(mockAmadeusFakeDataProvider.getRawPointsOfInterest(location: null))
          .called(1);

      expect(pois.length, 2);
      expect(
        [
          pois[0],
          pois[1],
        ],
        [
          POI(
            name: 'Con Gracia',
            category: CategoryPOI.RESTAURANT,
            geoCode: Location(latitude: 41.399193, longitude: 2.159853),
          ),
          POI(
            name: 'Osmosis',
            category: CategoryPOI.RESTAURANT,
            geoCode: Location(latitude: 41.390198, longitude: 2.156974),
          ),
        ],
      );
    });
  });
}
