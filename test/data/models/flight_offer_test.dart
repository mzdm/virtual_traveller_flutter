import 'package:flutter_test/flutter_test.dart';
import 'package:virtual_traveller_flutter/data/data_providers/remote/amadeus_api/fake_data.dart';
import 'package:virtual_traveller_flutter/data/models/flight_offer.dart';
import 'package:virtual_traveller_flutter/data/repositories/amadeus_repository.dart';

void main() {
  group('Flights - Offers Search', () {
    AmadeusRepository amadeusRepository;

    setUp(() {
      amadeusRepository = AmadeusRepository(
        amadeusBaseDataProvider: AmadeusFakeDataProvider(),
      );
    });

    test('fromJson Offers Search List output', () async {
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
}
