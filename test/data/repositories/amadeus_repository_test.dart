import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:virtual_traveller_flutter/data/data_providers/remote/amadeus_api/base_data.dart';
import 'package:virtual_traveller_flutter/data/data_providers/remote/amadeus_api/fake_data.dart';
import 'package:virtual_traveller_flutter/data/models/airline.dart';
import 'package:virtual_traveller_flutter/data/models/airport.dart';
import 'package:virtual_traveller_flutter/data/models/destination.dart';
import 'package:virtual_traveller_flutter/data/models/flight_offer.dart';
import 'package:virtual_traveller_flutter/data/models/hotel.dart';
import 'package:virtual_traveller_flutter/data/models/location.dart';
import 'package:virtual_traveller_flutter/data/models/poi.dart';
import 'package:virtual_traveller_flutter/data/models/safety_rate.dart';
import 'package:virtual_traveller_flutter/data/repositories/amadeus_repository.dart';

class MockAmadeusFakeDataProvider extends Mock
    implements AmadeusFakeDataProvider {}

// one item contains null category, which should be filtered out in SafetyRate fromJson
const mockFakePoiData =
    '''{"data":[{"type":"location","subType":"POINT_OF_INTEREST","id":"15C8B8148C","self":{"href":"https://test.api.amadeus.com/v1/reference-data/locations/pois/15C8B8148C","methods":["GET"]},"geoCode":{"latitude":41.392677,"longitude":2.153942},"name":"Dry Martini","rank":100,"tags":["bar","restaurant","nightlife","club","sightseeing","attraction","activities"]},{"type":"location","subType":"POINT_OF_INTEREST","id":"BD29CF2CCD","self":{"href":"https://test.api.amadeus.com/v1/reference-data/locations/pois/BD29CF2CCD","methods":["GET"]},"geoCode":{"latitude":41.399193,"longitude":2.159853},"name":"Con Gracia","category":"RESTAURANT","rank":100,"tags":["restaurant","sightseeing","commercialplace","professionalservices","activities"]},{"type":"location","subType":"POINT_OF_INTEREST","id":"24DE6CE737","self":{"href":"https://test.api.amadeus.com/v1/reference-data/locations/pois/24DE6CE737","methods":["GET"]},"geoCode":{"latitude":41.390198,"longitude":2.156974},"name":"Osmosis","category":"RESTAURANT","rank":100,"tags":["restaurant","shopping","transport","professionalservices"]}],"meta":{"count":120,"links":{"self":"https://test.api.amadeus.com/v1/reference-data/locations/pois?latitude=41.397158&longitude=2.160873","next":"https://test.api.amadeus.com/v1/reference-data/locations/pois?latitude=41.397158&longitude=2.160873&page[offset]=10&page[limit]=10","last":"https://test.api.amadeus.com/v1/reference-data/locations/pois?latitude=41.397158&longitude=2.160873&page[offset]=120&page[limit]=10","first":"https://test.api.amadeus.com/v1/reference-data/locations/pois?latitude=41.397158&longitude=2.160873&page[offset]=0&page[limit]=10","up":"https://test.api.amadeus.com/v1/reference-data/locations/pois?latitude=41.397158&longitude=2.160873"}}}''';

void main() {
  group('Amadeus API methods', () {
    AmadeusBaseDataProvider amadeusBaseDataProvider;
    AmadeusRepository amadeusRepository;

    setUp(() {
      amadeusBaseDataProvider = AmadeusFakeDataProvider();
      amadeusRepository = AmadeusRepository(
        amadeusBaseDataProvider: amadeusBaseDataProvider,
      );
    });

    group('Airline Code Lookup', () {
      test('fromJson Airline model output', () async {
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

    group('Nearest Airport', () {
      test('fromJson Airport model List output', () async {
        final airports = await amadeusRepository.getNearestAirport(null);

        expect(airports.length, 6);
        expect(
          [
            airports[0],
            airports[1],
            airports[airports.length - 1],
          ],
          [
            Airport(
              cityName: 'HEATHROW',
              airportCode: 'LHR',
              address: AirportAddress(
                cityName: 'LONDON',
                cityCode: 'LON',
                countryName: 'UNITED KINGDOM',
                countryCode: 'GB',
                regionCode: 'EUROP',
              ),
              geoCode: Location(
                latitude: 51.47294,
                longitude: -0.45061,
              ),
            ),
            Airport(
              cityName: 'BIRMINGHAM',
              airportCode: 'BHX',
              address: AirportAddress(
                cityName: 'BIRMINGHAM',
                cityCode: 'BHX',
                countryName: 'UNITED KINGDOM',
                countryCode: 'GB',
                regionCode: 'EUROP',
              ),
              geoCode: Location(
                latitude: 52.45386,
                longitude: -1.74803,
              ),
            ),
            Airport(
              cityName: 'EAST MIDLANDS',
              airportCode: 'EMA',
              address: AirportAddress(
                cityName: 'NOTTINGHAM',
                cityCode: 'NQT',
                countryName: 'UNITED KINGDOM',
                countryCode: 'GB',
                regionCode: 'EUROP',
              ),
              geoCode: Location(
                latitude: 52.83111,
                longitude: -1.32806,
              ),
            ),
          ],
        );
      });
    });

    group('Airport & City Search', () {
      test('fromJson Airport model List output', () async {
        final airports = await amadeusRepository.getAirportCitySearch(null);

        // fake data have 2 similar values (city and airport code), if both same then it
        // will be filtered while doing fromJson because we only need unique city codes
        // not airport codes
        expect(airports.length, 4);
        // TODO: Add more
        expect(
          airports[0],
          Airport(
            cityName: 'MUNICH INTERNATIONAL',
            airportCode: 'MUC',
            address: AirportAddress(
              cityName: 'MUNICH',
              cityCode: 'MUC',
              countryName: 'GERMANY',
              countryCode: 'DE',
              regionCode: 'EUROP',
            ),
            geoCode: Location(
              latitude: 48.35378,
              longitude: 11.78609,
            ),
          ),
        );
      });
    });

    group('Safety Rate', () {
      test('fromJson SafetyRate model List output', () async {
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

    group('Hotel Search', () {
      test('fromJson Hotel model List output', () async {
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

    group('Flight Offers Search', () {
      test('fromJson Flight Offer model List output', () async {
        final flightOffers = await amadeusRepository.getFlightOffersSearch(
          originCity: null,
          destinationCity: null,
          departureDate: null,
          adults: null,
        );

        expect(flightOffers.length, 3);
        expect(
          flightOffers[0],
          FlightOffer(
            oneWay: false,
            numberOfBookableSeats: 9,
            price: FlightOfferDataPrice(
              currency: 'EUR',
              total: '546.70',
            ),
            travellers: [
              FlightOfferDataTravellers(
                travelerType: 'ADULT',
                price: FlightOfferDataPrice(
                  currency: 'EUR',
                  total: '546.70',
                ),
              ),
            ],
            itineraries: [
              FlightOfferDataItineraries(
                stopDuration: 'PT32H15M',
                segments: [
                  FlightOfferDataItinerariesSegments(
                    departure: FlightOfferDataEndpoint(
                      iataCode: 'SYD',
                      terminal: '1',
                      at: '2021-02-01T19:15:00',
                    ),
                    arrival: FlightOfferDataEndpoint(
                      iataCode: 'SIN',
                      terminal: '1',
                      at: '2021-02-02T00:30:00',
                    ),
                    duration: 'PT8H15M',
                    numberOfStops: 0,
                    carrierCode: 'TR',
                    aircraft: FlightOfferDataAircraft(code: '789'),
                  ),
                  FlightOfferDataItinerariesSegments(
                    departure: FlightOfferDataEndpoint(
                      iataCode: 'SIN',
                      terminal: '1',
                      at: '2021-02-02T22:05:00',
                    ),
                    arrival: FlightOfferDataEndpoint(
                      iataCode: 'DMK',
                      terminal: '1',
                      at: '2021-02-02T23:30:00',
                    ),
                    duration: 'PT2H25M',
                    numberOfStops: 0,
                    carrierCode: 'TR',
                    aircraft: FlightOfferDataAircraft(code: '788'),
                  ),
                ],
              ),
              FlightOfferDataItineraries(
                stopDuration: 'PT15H',
                segments: [
                  FlightOfferDataItinerariesSegments(
                    departure: FlightOfferDataEndpoint(
                      iataCode: 'DMK',
                      terminal: '1',
                      at: '2021-02-05T23:15:00',
                    ),
                    arrival: FlightOfferDataEndpoint(
                      iataCode: 'SIN',
                      terminal: '1',
                      at: '2021-02-06T02:50:00',
                    ),
                    duration: 'PT2H35M',
                    numberOfStops: 0,
                    carrierCode: 'TR',
                    aircraft: FlightOfferDataAircraft(code: '788'),
                  ),
                  FlightOfferDataItinerariesSegments(
                    departure: FlightOfferDataEndpoint(
                      iataCode: 'SIN',
                      terminal: '1',
                      at: '2021-02-06T06:55:00',
                    ),
                    arrival: FlightOfferDataEndpoint(
                      iataCode: 'SYD',
                      terminal: '1',
                      at: '2021-02-06T18:15:00',
                    ),
                    duration: 'PT8H20M',
                    numberOfStops: 0,
                    carrierCode: 'TR',
                    aircraft: FlightOfferDataAircraft(code: '789'),
                  ),
                ],
              ),
            ],
            carriersDictionary: {
              'TR': 'SCOOT',
              'AA': 'TEST',
            },
          ),
        );
      });
    });

    group('Flight Most Travelled', () {
      test('fromJson Destination model List output', () async {
        final destinations =
            await amadeusRepository.getFlightMostTravelled(null);

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
    });

    group('Travel Recommendation', () {
      test('fromJson Destination model List output', () async {
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

    group('Points of Interests', () {
      test('fromJson POI List output', () async {
        final pois =
            await amadeusRepository.getPointsOfInterest(location: null);

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

      group('fromJson POI List output (mock)', () {
        MockAmadeusFakeDataProvider mockAmadeusFakeDataProvider;
        AmadeusRepository amadeusRepository;

        setUp(() {
          mockAmadeusFakeDataProvider = MockAmadeusFakeDataProvider();
          amadeusRepository = AmadeusRepository(
            amadeusBaseDataProvider: mockAmadeusFakeDataProvider,
          );
        });

        test('omit null items on which was throwed an exception', () async {
          when(mockAmadeusFakeDataProvider.getRawPointsOfInterest(
                  location: null))
              .thenAnswer((_) async => mockFakePoiData);

          final pois =
              await amadeusRepository.getPointsOfInterest(location: null);

          verify(mockAmadeusFakeDataProvider.getRawPointsOfInterest(
                  location: null))
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
    });
  });
}
