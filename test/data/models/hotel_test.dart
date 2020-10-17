import 'package:flutter_test/flutter_test.dart';
import 'package:virtual_traveller_flutter/data/data_providers/remote/amadeus_api/base_data.dart';
import 'package:virtual_traveller_flutter/data/data_providers/remote/amadeus_api/mocked_data.dart';
import 'package:virtual_traveller_flutter/data/models/hotel.dart';
import 'package:virtual_traveller_flutter/data/repositories/amadeus_repository.dart';

void main() {
  group('Flights API', () {
    AmadeusBaseDataProvider amadeusBaseDataProvider;
    AmadeusRepository amadeusRepository;

    setUp(() {
      amadeusBaseDataProvider = AmadeusMockedDataProvider();
      amadeusRepository = AmadeusRepository(amadeusBaseDataProvider: amadeusBaseDataProvider);
    });

    test('Hotel Search: fromJson Hotel List output', () async {
      final hotels = await amadeusRepository.getHotelSearch(cityCode: null);

      expect(hotels.length, 2);
      expect(
        hotels,
        [
          Hotel(
            name: 'CONCORDE OPERA PARIS OPERA PARIS',
            stars: '2',
            latitude: 48.85693,
            longitude: 2.3412,
            hotelDistance: HotelDistance(
              distance: 0.4,
              distanceUnit: 'KM',
            ),
            address: HotelAddress(
              countryCode: 'FR',
              cityName: 'PARIS',
              lines: [
                'LEFISTON STREET',
              ],
            ),
            contact: HotelContact(
              phone: '1-305-436-1811',
              email: null,
            ),
            amenities: [
              'HANDICAP_FAC',
              'ACC_BATHS',
              'ACC_WASHBASIN',
              'ACC_BATH_CTRLS',
              'ACC_LIGHT_SW',
              'ACC_ELEVATORS',
              'ACC_TOILETS',
              'SERV_DOGS_ALWD',
              'DIS_PARKG',
              'HANDRAIL_BTHRM',
              'ADAPTED_PHONES',
              'ADAPT_RM_DOORS',
              'ACC_RM_WCHAIR',
              'TV_SUB/CAPTION',
              'ACC_WCHAIR',
              'HANDRAIL_BTHRM',
              'EXT_ROOM_ENTRY',
              'EMERG_LIGHTING',
              'EXTINGUISHERS',
              'FIRE_SAFETY',
              'RESTRIC_RM_ACC',
              'SMOKE_DETECTOR',
              'SPRINKLERS',
              'KIDS_WELCOME',
              'ELEVATOR',
              'INT_HOTSPOTS',
              'FREE_INTERNET',
              'LAUNDRY_SVC',
              'NO_PORN_FILMS',
              'PARKING',
              'PETS_ALLOWED',
              'SWIMMING_POOL',
              'AIR_CONDITIONING',
              'KITCHEN',
              'NONSMOKING_RMS',
              'TELEVISION',
              'WI-FI_IN_ROOM',
            ],
          ),
          Hotel(
            name: 'BEST WESTERN AU TROCADERO',
            stars: '3',
            latitude: 48.85326,
            longitude: 2.33855,
            hotelDistance: HotelDistance(
              distance: 0.5,
              distanceUnit: 'KM',
            ),
            address: HotelAddress(
              countryCode: 'FR',
              cityName: 'PARIS',
              lines: [
                '3 AVENUE RAYMOND-POINCARE ',
              ],
            ),
            contact: HotelContact(
              phone: '33-1-47273330',
              email: null,
            ),
            amenities: [
              'BAR',
              'ICE_MACHINES',
              'RESTAURANT',
              'ACC_BATHS',
              'ACC_TOILETS',
              'HANDRAIL_BTHRM',
              'ACC_RM_WCHAIR',
              'BABY-SITTING',
              'KIDS_WELCOME',
              'ELEVATOR',
              'WIFI',
              'LAUNDRY_SVC',
              'LOUNGE',
              'AIR_CONDITIONING',
              'HAIR_DRYER',
              'MINIBAR',
              'NONSMOKING_RMS',
              'ROOM_SERVICE',
              'TELEVISION',
              'WI-FI_IN_ROOM',
              'EXT_ROOM_ENTRY',
              'EMERG_LIGHTING',
              'EXTINGUISHERS',
              'FIRE_SAFETY',
              'SMOKE_DETECTOR',
              'VIDEO_SURVEIL',
            ],
          ),
        ],
      );
    });
  });
}
