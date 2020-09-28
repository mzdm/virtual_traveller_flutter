import 'package:virtual_traveller_flutter/data/data_providers/remote/amadeus_api/base_data.dart';

/// Use for tests & when playing with things so API quota is saved.
/// TODO: Reduce repetitive lines
class AmadeusMockedDataProvider implements AmadeusBaseDataProvider {
  Future<T> simulateRemoteDataDelay<T>(T data) {
    return Future.delayed(Duration(milliseconds: 1500), () => data);
  }

  // https://developers.amadeus.com/self-service/category/air/api-doc/airport-nearest-relevant/api-reference
  @override
  Future<String> getRawNearestAirport(_) async {
    final data = '''
    {
  "meta": {
    "count": 32,
    "links": {
      "self": "https://test.api.amadeus.com/v1/reference-data/locations/airports?latitude=51.57285&longitude=-0.44161",
      "next": "https://test.api.amadeus.com/v1/reference-data/locations/airports?latitude=51.57285&longitude=-0.44161&page%5Boffset%5D=10",
      "last": "https://test.api.amadeus.com/v1/reference-data/locations/airports?latitude=51.57285&longitude=-0.44161&page%5Boffset%5D=22"
    }
  },
  "data": [
    {
      "type": "location",
      "subType": "AIRPORT",
      "name": "HEATHROW",
      "detailedName": "LONDON/GB:HEATHROW",
      "timeZoneOffset": "+01:00",
      "iataCode": "LHR",
      "geoCode": {
        "latitude": 51.47294,
        "longitude": -0.45061
      },
      "address": {
        "cityName": "LONDON",
        "cityCode": "LON",
        "countryName": "UNITED KINGDOM",
        "countryCode": "GB",
        "regionCode": "EUROP"
      },
      "distance": {
        "value": 11,
        "unit": "KM"
      },
      "analytics": {
        "flights": {
          "score": 39
        },
        "travelers": {
          "score": 45
        }
      },
      "relevance": 350.54587
    },
    {
      "type": "location",
      "subType": "AIRPORT",
      "name": "GATWICK",
      "detailedName": "LONDON/GB:GATWICK",
      "timeZoneOffset": "+01:00",
      "iataCode": "LGW",
      "geoCode": {
        "latitude": 51.15609,
        "longitude": -0.17818
      },
      "address": {
        "cityName": "LONDON",
        "cityCode": "LON",
        "countryName": "UNITED KINGDOM",
        "countryCode": "GB",
        "regionCode": "EUROP"
      },
      "distance": {
        "value": 49,
        "unit": "KM"
      },
      "analytics": {
        "flights": {
          "score": 27
        },
        "travelers": {
          "score": 27
        }
      },
      "relevance": 53.62667
    },
    {
      "type": "location",
      "subType": "AIRPORT",
      "name": "LUTON",
      "detailedName": "LONDON/GB:LUTON",
      "timeZoneOffset": "+01:00",
      "iataCode": "LTN",
      "geoCode": {
        "latitude": 51.87472,
        "longitude": -0.36833
      },
      "address": {
        "cityName": "LONDON",
        "cityCode": "LON",
        "countryName": "UNITED KINGDOM",
        "countryCode": "GB",
        "regionCode": "EUROP"
      },
      "distance": {
        "value": 33,
        "unit": "KM"
      },
      "analytics": {
        "flights": {
          "score": 11
        },
        "travelers": {
          "score": 10
        }
      },
      "relevance": 33.10184
    },
    {
      "type": "location",
      "subType": "AIRPORT",
      "name": "STANSTED",
      "detailedName": "LONDON/GB:STANSTED",
      "timeZoneOffset": "+01:00",
      "iataCode": "STN",
      "geoCode": {
        "latitude": 51.885,
        "longitude": 0.235
      },
      "address": {
        "cityName": "LONDON",
        "cityCode": "LON",
        "countryName": "UNITED KINGDOM",
        "countryCode": "GB",
        "regionCode": "EUROP"
      },
      "distance": {
        "value": 58,
        "unit": "KM"
      },
      "analytics": {
        "flights": {
          "score": 16
        },
        "travelers": {
          "score": 15
        }
      },
      "relevance": 27.50241
    },
    {
      "type": "location",
      "subType": "AIRPORT",
      "name": "CITY AIRPORT",
      "detailedName": "LONDON/GB:CITY AIRPORT",
      "timeZoneOffset": "+01:00",
      "iataCode": "LCY",
      "geoCode": {
        "latitude": 51.50528,
        "longitude": 0.05528
      },
      "address": {
        "cityName": "LONDON",
        "cityCode": "LON",
        "countryName": "UNITED KINGDOM",
        "countryCode": "GB",
        "regionCode": "EUROP"
      },
      "distance": {
        "value": 35,
        "unit": "KM"
      },
      "analytics": {
        "flights": {
          "score": 8
        },
        "travelers": {
          "score": 4
        }
      },
      "relevance": 21.78754
    },
    {
      "type": "location",
      "subType": "AIRPORT",
      "name": "BIRMINGHAM",
      "detailedName": "BIRMINGHAM/GB:BIRMINGHAM",
      "timeZoneOffset": "+01:00",
      "iataCode": "BHX",
      "geoCode": {
        "latitude": 52.45386,
        "longitude": -1.74803
      },
      "address": {
        "cityName": "BIRMINGHAM",
        "cityCode": "BHX",
        "countryName": "UNITED KINGDOM",
        "countryCode": "GB",
        "regionCode": "EUROP"
      },
      "distance": {
        "value": 132,
        "unit": "KM"
      },
      "analytics": {
        "flights": {
          "score": 10
        },
        "travelers": {
          "score": 8
        }
      },
      "relevance": 7.73356
    },
    {
      "type": "location",
      "subType": "AIRPORT",
      "name": "MANCHESTER AIRPORT",
      "detailedName": "MANCHESTER/GB:MANCHESTER AIRPO",
      "timeZoneOffset": "+01:00",
      "iataCode": "MAN",
      "geoCode": {
        "latitude": 53.35374,
        "longitude": -2.27495
      },
      "address": {
        "cityName": "MANCHESTER",
        "cityCode": "MAN",
        "countryName": "UNITED KINGDOM",
        "countryCode": "GB",
        "regionCode": "EUROP"
      },
      "distance": {
        "value": 233,
        "unit": "KM"
      },
      "analytics": {
        "flights": {
          "score": 18
        },
        "travelers": {
          "score": 17
        }
      },
      "relevance": 7.71084
    },
    {
      "type": "location",
      "subType": "AIRPORT",
      "name": "SOUTHAMPTON",
      "detailedName": "SOUTHAMPTON/GB",
      "timeZoneOffset": "+01:00",
      "iataCode": "SOU",
      "geoCode": {
        "latitude": 50.95026,
        "longitude": -1.3568
      },
      "address": {
        "cityName": "SOUTHAMPTON",
        "cityCode": "SOU",
        "countryName": "UNITED KINGDOM",
        "countryCode": "GB",
        "regionCode": "EUROP"
      },
      "distance": {
        "value": 94,
        "unit": "KM"
      },
      "analytics": {
        "flights": {
          "score": 4
        },
        "travelers": {
          "score": 2
        }
      },
      "relevance": 4.4788
    },
    {
      "type": "location",
      "subType": "AIRPORT",
      "name": "BRISTOL",
      "detailedName": "BRISTOL/GB:BRISTOL",
      "timeZoneOffset": "+01:00",
      "iataCode": "BRS",
      "geoCode": {
        "latitude": 51.38267,
        "longitude": -2.71909
      },
      "address": {
        "cityName": "BRISTOL",
        "cityCode": "BRS",
        "countryName": "UNITED KINGDOM",
        "countryCode": "GB",
        "regionCode": "EUROP"
      },
      "distance": {
        "value": 159,
        "unit": "KM"
      },
      "analytics": {
        "flights": {
          "score": 7
        },
        "travelers": {
          "score": 5
        }
      },
      "relevance": 4.08617
    },
    {
      "type": "location",
      "subType": "AIRPORT",
      "name": "EAST MIDLANDS",
      "detailedName": "NOTTINGHAM/GB:EAST MIDLANDS",
      "timeZoneOffset": "+01:00",
      "iataCode": "EMA",
      "geoCode": {
        "latitude": 52.83111,
        "longitude": -1.32806
      },
      "address": {
        "cityName": "NOTTINGHAM",
        "cityCode": "NQT",
        "countryName": "UNITED KINGDOM",
        "countryCode": "GB",
        "regionCode": "EUROP"
      },
      "distance": {
        "value": 152,
        "unit": "KM"
      },
      "analytics": {
        "flights": {
          "score": 4
        },
        "travelers": {
          "score": 3
        }
      },
      "relevance": 2.66099
    }
  ]
}
    ''';

    return simulateRemoteDataDelay(data);
  }

  // https://developers.amadeus.com/self-service/category/air/api-doc/flight-offers-search/api-reference
  @override
  Future<String> getRawFlightOffersSearch() async {
    final data = '''
    {
  "meta": {
    "count": 3,
    "links": {
      "self": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=SYD&destinationLocationCode=BKK&departureDate=2021-02-01&returnDate=2021-02-05&adults=1&max=3"
    }
  },
  "data": [
    {
      "type": "flight-offer",
      "id": "1",
      "source": "GDS",
      "instantTicketingRequired": false,
      "nonHomogeneous": false,
      "oneWay": false,
      "lastTicketingDate": "2020-08-04",
      "numberOfBookableSeats": 9,
      "itineraries": [
        {
          "duration": "PT32H15M",
          "segments": [
            {
              "departure": {
                "iataCode": "SYD",
                "terminal": "1",
                "at": "2021-02-01T19:15:00"
              },
              "arrival": {
                "iataCode": "SIN",
                "terminal": "1",
                "at": "2021-02-02T00:30:00"
              },
              "carrierCode": "TR",
              "number": "13",
              "aircraft": {
                "code": "789"
              },
              "operating": {
                "carrierCode": "TR"
              },
              "duration": "PT8H15M",
              "id": "1",
              "numberOfStops": 0,
              "blacklistedInEU": false
            },
            {
              "departure": {
                "iataCode": "SIN",
                "terminal": "1",
                "at": "2021-02-02T22:05:00"
              },
              "arrival": {
                "iataCode": "DMK",
                "terminal": "1",
                "at": "2021-02-02T23:30:00"
              },
              "carrierCode": "TR",
              "number": "868",
              "aircraft": {
                "code": "788"
              },
              "operating": {
                "carrierCode": "TR"
              },
              "duration": "PT2H25M",
              "id": "2",
              "numberOfStops": 0,
              "blacklistedInEU": false
            }
          ]
        },
        {
          "duration": "PT15H",
          "segments": [
            {
              "departure": {
                "iataCode": "DMK",
                "terminal": "1",
                "at": "2021-02-05T23:15:00"
              },
              "arrival": {
                "iataCode": "SIN",
                "terminal": "1",
                "at": "2021-02-06T02:50:00"
              },
              "carrierCode": "TR",
              "number": "867",
              "aircraft": {
                "code": "788"
              },
              "operating": {
                "carrierCode": "TR"
              },
              "duration": "PT2H35M",
              "id": "5",
              "numberOfStops": 0,
              "blacklistedInEU": false
            },
            {
              "departure": {
                "iataCode": "SIN",
                "terminal": "1",
                "at": "2021-02-06T06:55:00"
              },
              "arrival": {
                "iataCode": "SYD",
                "terminal": "1",
                "at": "2021-02-06T18:15:00"
              },
              "carrierCode": "TR",
              "number": "12",
              "aircraft": {
                "code": "789"
              },
              "operating": {
                "carrierCode": "TR"
              },
              "duration": "PT8H20M",
              "id": "6",
              "numberOfStops": 0,
              "blacklistedInEU": false
            }
          ]
        }
      ],
      "price": {
        "currency": "EUR",
        "total": "546.70",
        "base": "334.00",
        "fees": [
          {
            "amount": "0.00",
            "type": "SUPPLIER"
          },
          {
            "amount": "0.00",
            "type": "TICKETING"
          }
        ],
        "grandTotal": "546.70"
      },
      "pricingOptions": {
        "fareType": [
          "PUBLISHED"
        ],
        "includedCheckedBagsOnly": true
      },
      "validatingAirlineCodes": [
        "HR"
      ],
      "travelerPricings": [
        {
          "travelerId": "1",
          "fareOption": "STANDARD",
          "travelerType": "ADULT",
          "price": {
            "currency": "EUR",
            "total": "546.70",
            "base": "334.00"
          },
          "fareDetailsBySegment": [
            {
              "segmentId": "1",
              "cabin": "ECONOMY",
              "fareBasis": "O2TR24",
              "class": "O",
              "includedCheckedBags": {
                "weight": 20,
                "weightUnit": "KG"
              }
            },
            {
              "segmentId": "2",
              "cabin": "ECONOMY",
              "fareBasis": "O2TR24",
              "class": "O",
              "includedCheckedBags": {
                "weight": 20,
                "weightUnit": "KG"
              }
            },
            {
              "segmentId": "5",
              "cabin": "ECONOMY",
              "fareBasis": "X2TR24",
              "class": "X",
              "includedCheckedBags": {
                "weight": 20,
                "weightUnit": "KG"
              }
            },
            {
              "segmentId": "6",
              "cabin": "ECONOMY",
              "fareBasis": "H2TR24",
              "class": "H",
              "includedCheckedBags": {
                "weight": 20,
                "weightUnit": "KG"
              }
            }
          ]
        }
      ]
    },
    {
      "type": "flight-offer",
      "id": "2",
      "source": "GDS",
      "instantTicketingRequired": false,
      "nonHomogeneous": false,
      "oneWay": false,
      "lastTicketingDate": "2020-08-04",
      "numberOfBookableSeats": 9,
      "itineraries": [
        {
          "duration": "PT32H15M",
          "segments": [
            {
              "departure": {
                "iataCode": "SYD",
                "terminal": "1",
                "at": "2021-02-01T19:15:00"
              },
              "arrival": {
                "iataCode": "SIN",
                "terminal": "1",
                "at": "2021-02-02T00:30:00"
              },
              "carrierCode": "TR",
              "number": "13",
              "aircraft": {
                "code": "789"
              },
              "operating": {
                "carrierCode": "TR"
              },
              "duration": "PT8H15M",
              "id": "1",
              "numberOfStops": 0,
              "blacklistedInEU": false
            },
            {
              "departure": {
                "iataCode": "SIN",
                "terminal": "1",
                "at": "2021-02-02T22:05:00"
              },
              "arrival": {
                "iataCode": "DMK",
                "terminal": "1",
                "at": "2021-02-02T23:30:00"
              },
              "carrierCode": "TR",
              "number": "868",
              "aircraft": {
                "code": "788"
              },
              "operating": {
                "carrierCode": "TR"
              },
              "duration": "PT2H25M",
              "id": "2",
              "numberOfStops": 0,
              "blacklistedInEU": false
            }
          ]
        },
        {
          "duration": "PT16H35M",
          "segments": [
            {
              "departure": {
                "iataCode": "DMK",
                "terminal": "1",
                "at": "2021-02-05T16:25:00"
              },
              "arrival": {
                "iataCode": "SIN",
                "terminal": "1",
                "at": "2021-02-05T20:00:00"
              },
              "carrierCode": "TR",
              "number": "869",
              "aircraft": {
                "code": "788"
              },
              "operating": {
                "carrierCode": "TR"
              },
              "duration": "PT2H35M",
              "id": "7",
              "numberOfStops": 0,
              "blacklistedInEU": false
            },
            {
              "departure": {
                "iataCode": "SIN",
                "terminal": "1",
                "at": "2021-02-06T02:00:00"
              },
              "arrival": {
                "iataCode": "SYD",
                "terminal": "1",
                "at": "2021-02-06T13:00:00"
              },
              "carrierCode": "TR",
              "number": "2",
              "aircraft": {
                "code": "788"
              },
              "operating": {
                "carrierCode": "TR"
              },
              "duration": "PT8H",
              "id": "8",
              "numberOfStops": 0,
              "blacklistedInEU": false
            }
          ]
        }
      ],
      "price": {
        "currency": "EUR",
        "total": "546.70",
        "base": "334.00",
        "fees": [
          {
            "amount": "0.00",
            "type": "SUPPLIER"
          },
          {
            "amount": "0.00",
            "type": "TICKETING"
          }
        ],
        "grandTotal": "546.70"
      },
      "pricingOptions": {
        "fareType": [
          "PUBLISHED"
        ],
        "includedCheckedBagsOnly": true
      },
      "validatingAirlineCodes": [
        "HR"
      ],
      "travelerPricings": [
        {
          "travelerId": "1",
          "fareOption": "STANDARD",
          "travelerType": "ADULT",
          "price": {
            "currency": "EUR",
            "total": "546.70",
            "base": "334.00"
          },
          "fareDetailsBySegment": [
            {
              "segmentId": "1",
              "cabin": "ECONOMY",
              "fareBasis": "O2TR24",
              "class": "O",
              "includedCheckedBags": {
                "weight": 20,
                "weightUnit": "KG"
              }
            },
            {
              "segmentId": "2",
              "cabin": "ECONOMY",
              "fareBasis": "O2TR24",
              "class": "O",
              "includedCheckedBags": {
                "weight": 20,
                "weightUnit": "KG"
              }
            },
            {
              "segmentId": "7",
              "cabin": "ECONOMY",
              "fareBasis": "X2TR24",
              "class": "X",
              "includedCheckedBags": {
                "weight": 20,
                "weightUnit": "KG"
              }
            },
            {
              "segmentId": "8",
              "cabin": "ECONOMY",
              "fareBasis": "H2TR24",
              "class": "H",
              "includedCheckedBags": {
                "weight": 20,
                "weightUnit": "KG"
              }
            }
          ]
        }
      ]
    },
    {
      "type": "flight-offer",
      "id": "3",
      "source": "GDS",
      "instantTicketingRequired": false,
      "nonHomogeneous": false,
      "oneWay": false,
      "lastTicketingDate": "2020-08-04",
      "numberOfBookableSeats": 9,
      "itineraries": [
        {
          "duration": "PT13H30M",
          "segments": [
            {
              "departure": {
                "iataCode": "SYD",
                "terminal": "1",
                "at": "2021-02-01T14:00:00"
              },
              "arrival": {
                "iataCode": "SIN",
                "terminal": "1",
                "at": "2021-02-01T19:15:00"
              },
              "carrierCode": "TR",
              "number": "3",
              "aircraft": {
                "code": "788"
              },
              "operating": {
                "carrierCode": "TR"
              },
              "duration": "PT8H15M",
              "id": "3",
              "numberOfStops": 0,
              "blacklistedInEU": false
            },
            {
              "departure": {
                "iataCode": "SIN",
                "terminal": "1",
                "at": "2021-02-01T22:05:00"
              },
              "arrival": {
                "iataCode": "DMK",
                "terminal": "1",
                "at": "2021-02-01T23:30:00"
              },
              "carrierCode": "TR",
              "number": "868",
              "aircraft": {
                "code": "788"
              },
              "operating": {
                "carrierCode": "TR"
              },
              "duration": "PT2H25M",
              "id": "4",
              "numberOfStops": 0,
              "blacklistedInEU": false
            }
          ]
        },
        {
          "duration": "PT15H",
          "segments": [
            {
              "departure": {
                "iataCode": "DMK",
                "terminal": "1",
                "at": "2021-02-05T23:15:00"
              },
              "arrival": {
                "iataCode": "SIN",
                "terminal": "1",
                "at": "2021-02-06T02:50:00"
              },
              "carrierCode": "TR",
              "number": "867",
              "aircraft": {
                "code": "788"
              },
              "operating": {
                "carrierCode": "TR"
              },
              "duration": "PT2H35M",
              "id": "5",
              "numberOfStops": 0,
              "blacklistedInEU": false
            },
            {
              "departure": {
                "iataCode": "SIN",
                "terminal": "1",
                "at": "2021-02-06T06:55:00"
              },
              "arrival": {
                "iataCode": "SYD",
                "terminal": "1",
                "at": "2021-02-06T18:15:00"
              },
              "carrierCode": "TR",
              "number": "12",
              "aircraft": {
                "code": "789"
              },
              "operating": {
                "carrierCode": "TR"
              },
              "duration": "PT8H20M",
              "id": "6",
              "numberOfStops": 0,
              "blacklistedInEU": false
            }
          ]
        }
      ],
      "price": {
        "currency": "EUR",
        "total": "552.70",
        "base": "340.00",
        "fees": [
          {
            "amount": "0.00",
            "type": "SUPPLIER"
          },
          {
            "amount": "0.00",
            "type": "TICKETING"
          }
        ],
        "grandTotal": "552.70"
      },
      "pricingOptions": {
        "fareType": [
          "PUBLISHED"
        ],
        "includedCheckedBagsOnly": true
      },
      "validatingAirlineCodes": [
        "HR"
      ],
      "travelerPricings": [
        {
          "travelerId": "1",
          "fareOption": "STANDARD",
          "travelerType": "ADULT",
          "price": {
            "currency": "EUR",
            "total": "552.70",
            "base": "340.00"
          },
          "fareDetailsBySegment": [
            {
              "segmentId": "3",
              "cabin": "ECONOMY",
              "fareBasis": "O2TR24",
              "class": "O",
              "includedCheckedBags": {
                "weight": 20,
                "weightUnit": "KG"
              }
            },
            {
              "segmentId": "4",
              "cabin": "ECONOMY",
              "fareBasis": "X2TR24",
              "class": "X",
              "includedCheckedBags": {
                "weight": 20,
                "weightUnit": "KG"
              }
            },
            {
              "segmentId": "5",
              "cabin": "ECONOMY",
              "fareBasis": "X2TR24",
              "class": "X",
              "includedCheckedBags": {
                "weight": 20,
                "weightUnit": "KG"
              }
            },
            {
              "segmentId": "6",
              "cabin": "ECONOMY",
              "fareBasis": "H2TR24",
              "class": "H",
              "includedCheckedBags": {
                "weight": 20,
                "weightUnit": "KG"
              }
            }
          ]
        }
      ]
    }
  ],
  "dictionaries": {
    "locations": {
      "DMK": {
        "cityCode": "BKK",
        "countryCode": "TH"
      },
      "SIN": {
        "cityCode": "SIN",
        "countryCode": "SG"
      },
      "SYD": {
        "cityCode": "SYD",
        "countryCode": "AU"
      }
    },
    "aircraft": {
      "789": "BOEING 787-9",
      "77W": "BOEING 777-300ER"
    },
    "currencies": {
      "EUR": "EURO"
    },
    "carriers": {
      "TR": "SCOOT"
    }
  }
}
    ''';

    return simulateRemoteDataDelay(data);
  }

  // https://developers.amadeus.com/self-service/category/air/api-doc/airport-and-city-search/api-reference
  @override
  Future<String> getRawAirportCitySearch() async {
    final data = '''
    {
  "meta": {
    "count": 2,
    "links": {
      "self": "https://test.api.amadeus.com/v1/reference-data/locations?subType=CITY,AIRPORT&keyword=MUC&countryCode=DE"
    }
  },
  "data": [
    {
      "type": "location",
      "subType": "CITY",
      "name": "MUNICH INTERNATIONAL",
      "detailedName": "MUNICH/DE:MUNICH INTERNATIONAL",
      "id": "CMUC",
      "self": {
        "href": "https://test.api.amadeus.com/v1/reference-data/locations/CMUC",
        "methods": [
          "GET"
        ]
      },
      "timeZoneOffset": "+02:00",
      "iataCode": "MUC",
      "geoCode": {
        "latitude": 48.35378,
        "longitude": 11.78609
      },
      "address": {
        "cityName": "MUNICH",
        "cityCode": "MUC",
        "countryName": "GERMANY",
        "countryCode": "DE",
        "regionCode": "EUROP"
      },
      "analytics": {
        "travelers": {
          "score": 27
        }
      }
    },
    {
      "type": "location",
      "subType": "AIRPORT",
      "name": "MUNICH INTERNATIONAL",
      "detailedName": "MUNICH/DE:MUNICH INTERNATIONAL",
      "id": "AMUC",
      "self": {
        "href": "https://test.api.amadeus.com/v1/reference-data/locations/AMUC",
        "methods": [
          "GET"
        ]
      },
      "timeZoneOffset": "+02:00",
      "iataCode": "MUC",
      "geoCode": {
        "latitude": 48.35378,
        "longitude": 11.78609
      },
      "address": {
        "cityName": "MUNICH",
        "cityCode": "MUC",
        "countryName": "GERMANY",
        "countryCode": "DE",
        "regionCode": "EUROP"
      },
      "analytics": {
        "travelers": {
          "score": 27
        }
      }
    }
  ]
}
    ''';

    return simulateRemoteDataDelay(data);
  }

  // https://developers.amadeus.com/self-service/category/air/api-doc/airline-code-lookup/api-reference
  @override
  Future<String> getRawAirlineCodeLookup() async {
    final data = '''
    {
  "meta": {
    "count": 1,
    "links": {
      "self": "https://test.api.amadeus.com/v1/reference-data/airlines?airlineCodes=BA"
    }
  },
  "data": [
    {
      "type": "airline",
      "iataCode": "BA",
      "icaoCode": "BAW",
      "businessName": "BRITISH AIRWAYS",
      "commonName": "BRITISH A/W"
    }
  ]
}
    ''';

    return simulateRemoteDataDelay(data);
  }

  // https://developers.amadeus.com/self-service/category/air/api-doc/flight-most-booked-destinations/api-reference
  @override
  Future<String> getRawFlightMostBooked() async {
    final data = '''
    {
  "meta": {
    "count": 10,
    "links": {
      "self": "https://test.api.amadeus.com/v1/travel/analytics/air-traffic/booked?originCityCode=MAD&page%5Blimit%5D=10&page%5Boffset%5D=0&period=2017-08"
    }
  },
  "data": [
    {
      "type": "air-traffic",
      "destination": "PAR",
      "subType": "BOOKED",
      "analytics": {
        "flights": {
          "score": 100
        },
        "travelers": {
          "score": 100
        }
      }
    },
    {
      "type": "air-traffic",
      "destination": "TCI",
      "subType": "BOOKED",
      "analytics": {
        "flights": {
          "score": 61
        },
        "travelers": {
          "score": 80
        }
      }
    },
    {
      "type": "air-traffic",
      "destination": "LON",
      "subType": "BOOKED",
      "analytics": {
        "flights": {
          "score": 93
        },
        "travelers": {
          "score": 65
        }
      }
    },
    {
      "type": "air-traffic",
      "destination": "BCN",
      "subType": "BOOKED",
      "analytics": {
        "flights": {
          "score": 91
        },
        "travelers": {
          "score": 61
        }
      }
    },
    {
      "type": "air-traffic",
      "destination": "NYC",
      "subType": "BOOKED",
      "analytics": {
        "flights": {
          "score": 61
        },
        "travelers": {
          "score": 51
        }
      }
    },
    {
      "type": "air-traffic",
      "destination": "BRU",
      "subType": "BOOKED",
      "analytics": {
        "flights": {
          "score": 41
        },
        "travelers": {
          "score": 39
        }
      }
    },
    {
      "type": "air-traffic",
      "destination": "UIO",
      "subType": "BOOKED",
      "analytics": {
        "flights": {
          "score": 48
        },
        "travelers": {
          "score": 37
        }
      }
    },
    {
      "type": "air-traffic",
      "destination": "SDQ",
      "subType": "BOOKED",
      "analytics": {
        "flights": {
          "score": 15
        },
        "travelers": {
          "score": 19
        }
      }
    },
    {
      "type": "air-traffic",
      "destination": "DXB",
      "subType": "BOOKED",
      "analytics": {
        "flights": {
          "score": 22
        },
        "travelers": {
          "score": 11
        }
      }
    },
    {
      "type": "air-traffic",
      "destination": "OPO",
      "subType": "BOOKED",
      "analytics": {
        "flights": {
          "score": 18
        },
        "travelers": {
          "score": 8
        }
      }
    }
  ]
}
    ''';

    return simulateRemoteDataDelay(data);
  }

  // https://developers.amadeus.com/self-service/category/air/api-doc/flight-most-traveled-destinations/api-reference
  @override
  Future<String> getRawFlightMostTravelled() async {
    final data = '''
    {
  "meta": {
    "count": 10,
    "links": {
      "self": "https://test.api.amadeus.com/v1/travel/analytics/air-traffic/traveled?max=10&originCityCode=MAD&page%5Blimit%5D=10&page%5Boffset%5D=0&period=2017-01&sort=analytics.travelers.score"
    }
  },
  "data": [
    {
      "type": "air-traffic",
      "destination": "PAR",
      "subType": "TRAVELED",
      "analytics": {
        "flights": {
          "score": 74
        },
        "travelers": {
          "score": 100
        }
      }
    },
    {
      "type": "air-traffic",
      "destination": "BCN",
      "subType": "TRAVELED",
      "analytics": {
        "flights": {
          "score": 100
        },
        "travelers": {
          "score": 78
        }
      }
    },
    {
      "type": "air-traffic",
      "destination": "TCI",
      "subType": "TRAVELED",
      "analytics": {
        "flights": {
          "score": 33
        },
        "travelers": {
          "score": 67
        }
      }
    },
    {
      "type": "air-traffic",
      "destination": "LON",
      "subType": "TRAVELED",
      "analytics": {
        "flights": {
          "score": 71
        },
        "travelers": {
          "score": 56
        }
      }
    },
    {
      "type": "air-traffic",
      "destination": "BRU",
      "subType": "TRAVELED",
      "analytics": {
        "flights": {
          "score": 23
        },
        "travelers": {
          "score": 38
        }
      }
    },
    {
      "type": "air-traffic",
      "destination": "NYC",
      "subType": "TRAVELED",
      "analytics": {
        "flights": {
          "score": 43
        },
        "travelers": {
          "score": 22
        }
      }
    },
    {
      "type": "air-traffic",
      "destination": "UIO",
   
    ''';

    return simulateRemoteDataDelay(data);
  }

  // https://developers.amadeus.com/self-service/category/trip/api-doc/travel-recommendations/api-reference
  @override
  Future<String> getRawTravelRecommendation() async {
    final data = '''
    {
  "meta": {
    "links": {
      "self": "https://test.api.amadeus.com/v1/reference-data/recommended-locations?cityCodes=LON&travelerCountryCode=FR"
    },
    "count": 2
  },
  "data": [
    {
      "type": "recommended-location",
      "subtype": "CITY",
      "name": "PARIS",
      "iataCode": "PAR",
      "geoCode": {
        "longiture": 2.34276,
        "latitude": 48.85755
      },
      "relevance": 0.71
    },
    {
      "type": "recommended-location",
      "subtype": "CITY",
      "name": "MADRID",
      "iataCode": "MAD",
      "geoCode": {
        "longiture": 3.70348,
        "latitude": 40.41654
      },
      "relevance": 0.68
    }
  ]
}
    ''';

    return simulateRemoteDataDelay(data);
  }

  // https://developers.amadeus.com/self-service/category/hotel/api-doc/hotel-search/api-reference
  @override
  Future<String> getRawHotelSearch() async {
    final data = '''
    {
  "data": [
    {
      "type": "hotel-offers",
      "hotel": {
        "type": "hotel",
        "hotelId": "EAMIAMAP",
        "chainCode": "EA",
        "dupeId": "700107767",
        "name": "CONCORDE OPERA PARIS OPERA PARIS",
        "rating": "2",
        "cityCode": "MIA",
        "latitude": 48.85693,
        "longitude": 2.3412,
        "hotelDistance": {
          "distance": 0.4,
          "distanceUnit": "KM"
        },
        "address": {
          "lines": [
            "LEFISTON STREET"
          ],
          "cityName": "PARIS",
          "countryCode": "FR"
        },
        "contact": {
          "phone": "1-305-436-1811",
          "fax": "1-305-436-1864"
        },
        "amenities": [
          "HANDICAP_FAC",
          "ACC_BATHS",
          "ACC_WASHBASIN",
          "ACC_BATH_CTRLS",
          "ACC_LIGHT_SW",
          "ACC_ELEVATORS",
          "ACC_TOILETS",
          "SERV_DOGS_ALWD",
          "DIS_PARKG",
          "HANDRAIL_BTHRM",
          "ADAPTED_PHONES",
          "ADAPT_RM_DOORS",
          "ACC_RM_WCHAIR",
          "TV_SUB/CAPTION",
          "ACC_WCHAIR",
          "HANDRAIL_BTHRM",
          "EXT_ROOM_ENTRY",
          "EMERG_LIGHTING",
          "EXTINGUISHERS",
          "FIRE_SAFETY",
          "RESTRIC_RM_ACC",
          "SMOKE_DETECTOR",
          "SPRINKLERS",
          "KIDS_WELCOME",
          "ELEVATOR",
          "INT_HOTSPOTS",
          "FREE_INTERNET",
          "LAUNDRY_SVC",
          "NO_PORN_FILMS",
          "PARKING",
          "PETS_ALLOWED",
          "SWIMMING_POOL",
          "AIR_CONDITIONING",
          "KITCHEN",
          "NONSMOKING_RMS",
          "TELEVISION",
          "WI-FI_IN_ROOM"
        ],
        "media": [
          {
            "uri": "http://pdt.multimediarepository.testing.amadeus.com/cmr/retrieve/hotel/69810B23CB8644A18AF760DC66BE41A6",
            "category": "EXTERIOR"
          }
        ]
      },
      "available": true,
      "offers": [
        {
          "id": "ECF8AD653801C3A81B3D04BAEF0D85AF182E8FB2115B0FAD144D49FAD108C60D",
          "rateCode": "RAC",
          "room": {
            "type": "A0C",
            "typeEstimated": {
              "category": "ACCESSIBLE_ROOM",
              "beds": 1,
              "bedType": "QUEEN"
            },
            "description": {
              "lang": "EN",
              "text": "NIGHTLY VALUE RATE\nSTANDARD STUDIO 1 QUEEN NONSMKNG ACCESSIBLE\nFREE WIFI"
            }
          },
          "guests": {
            "adults": 1
          },
          "price": {
            "currency": "USD",
            "base": "114.99",
            "total": "129.94",
            "variations": {
              "average": {
                "base": "114.99"
              },
              "changes": [
                {
                  "startDate": "2019-01-22",
                  "endDate": "2019-01-23",
                  "base": "114.99"
                }
              ]
            }
          }
        }
      ],
      "self": "https://test.api.amadeus.com/v2/shopping/hotel-offers/by-hotel?hotelId=EAMIAMAP&adults=1&paymentPolicy=NONE&view=FULL"
    },
    {
      "type": "hotel-offers",
      "hotel": {
        "type": "hotel",
        "hotelId": "BWPAR261",
        "chainCode": "BW",
        "dupeId": "700019804",
        "name": "BEST WESTERN AU TROCADERO",
        "rating": "3",
        "cityCode": "PAR",
        "latitude": 48.85326,
        "longitude": 2.33855,
        "hotelDistance": {
          "distance": 0.5,
          "distanceUnit": "KM"
        },
        "address": {
          "lines": [
            "3 AVENUE RAYMOND-POINCARE "
          ],
          "postalCode": "FR75116",
          "cityName": "PARIS",
          "countryCode": "FR"
        },
        "contact": {
          "fax": "33-1-47278085",
          "phone": "33-1-47273330"
        },
        "description": {
          "lang": "en",
          "text": "The best western au trocadero is located in one of the most elegant district of paris, facing the trocadero, the eiffel tower and champ de mars. You will enjoy the friendly setting."
        },
        "amenities": [
          "BAR",
          "ICE_MACHINES",
          "RESTAURANT",
          "ACC_BATHS",
          "ACC_TOILETS",
          "HANDRAIL_BTHRM",
          "ACC_RM_WCHAIR",
          "BABY-SITTING",
          "KIDS_WELCOME",
          "ELEVATOR",
          "WIFI",
          "LAUNDRY_SVC",
          "LOUNGE",
          "AIR_CONDITIONING",
          "HAIR_DRYER",
          "MINIBAR",
          "NONSMOKING_RMS",
          "ROOM_SERVICE",
          "TELEVISION",
          "WI-FI_IN_ROOM",
          "EXT_ROOM_ENTRY",
          "EMERG_LIGHTING",
          "EXTINGUISHERS",
          "FIRE_SAFETY",
          "SMOKE_DETECTOR",
          "VIDEO_SURVEIL"
        ],
        "media": [
          {
            "uri": "http://pdt.multimediarepository.testing.amadeus.com/cmr/retrieve/hotel/D231E485EDCB4AB1B61F3032404474D1",
            "category": "EXTERIOR"
          }
        ]
      },
      "available": true,
      "offers": [
        {
          "id": "7D158B52F8A4EED40A30AA8D96E957EC26C3AC381099486510BA1E32F468FA35",
          "rateCode": "RAC",
          "rateFamilyEstimated": {
            "code": "BAR",
            "type": "P"
          },
          "room": {
            "type": "A2T",
            "description": {
              "lang": "EN",
              "text": "FLEXIBLE RATE*BEST LEAST RESTRICTIVE RATE\n2 SINGLE BEDS,CONFORT RM,GRABBR,RAMP ACCESS,\nWHEELCHAIR"
            }
          },
          "guests": {
            "adults": 1
          },
          "price": {
            "currency": "EUR",
            "base": "150.00",
            "total": "151.65",
            "variations": {
              "average": {
                "base": "150.00"
              },
              "changes": [
                {
                  "startDate": "2019-01-22",
                  "endDate": "2019-01-23",
                  "base": "150.00"
                }
              ]
            }
          }
        }
      ],
      "self": "https://test.api.amadeus.com/v2/shopping/hotel-offers/by-hotel?hotelId=BWPAR261&adults=1&paymentPolicy=NONE&view=FULL"
    }
  ],
  "meta": {
    "links": {
      "next": "https://test.api.amadeus.com/v2/shopping/hotel-offers?adults=1&bestRateOnly=true&cityCode=PAR&includeClosed=false&paymentPolicy=NONE&radius=5&radiusUnit=KM&sort=PRICE&view=FULL&page[offset]=05G15W3U2NWG_96"
    }
  }
}
    ''';

    return simulateRemoteDataDelay(data);
  }

  // https://developers.amadeus.com/self-service/category/destination-content/api-doc/points-of-interest/api-reference
  @override
  Future<String> getRawPointsOfInterest(_) async {
    final data = '''
    {
  "data": [
    {
      "type": "location",
      "subType": "POINT_OF_INTEREST",
      "id": "9CB40CB5D0",
      "self": {
        "href": "https://test.api.amadeus.com/v1/reference-data/locations/pois/9CB40CB5D0",
        "methods": [
          "GET"
        ]
      },
      "geoCode": {
        "latitude": 41.39165,
        "longitude": 2.164772
      },
      "name": "Casa Batlló",
      "category": "SIGHTS",
      "rank": 5,
      "tags": [
        "sightseeing",
        "sights",
        "museum",
        "landmark",
        "tourguide",
        "restaurant",
        "attraction",
        "activities",
        "commercialplace",
        "shopping",
        "souvenir"
      ]
    },
    {
      "type": "location",
      "subType": "POINT_OF_INTEREST",
      "id": "4690B83DCA",
      "self": {
        "href": "https://test.api.amadeus.com/v1/reference-data/locations/pois/4690B83DCA",
        "methods": [
          "GET"
        ]
      },
      "geoCode": {
        "latitude": 41.397987,
        "longitude": 2.161159
      },
      "name": "La Pepita",
      "category": "RESTAURANT",
      "rank": 30,
      "tags": [
        "restaurant",
        "tapas",
        "pub",
        "bar",
        "sightseeing",
        "commercialplace"
      ]
    },
    {
      "type": "location",
      "subType": "POINT_OF_INTEREST",
      "id": "3EF139D861",
      "self": {
        "href": "https://test.api.amadeus.com/v1/reference-data/locations/pois/3EF139D861",
        "methods": [
          "GET"
        ]
      },
      "geoCode": {
        "latitude": 41.38827,
        "longitude": 2.161604
      },
      "name": "Brunch & Cake",
      "category": "RESTAURANT",
      "rank": 30,
      "tags": [
        "vegetarian",
        "restaurant",
        "breakfast",
        "shopping",
        "bakery",
        "transport",
        "patio",
        "garden"
      ]
    },
    {
      "type": "location",
      "subType": "POINT_OF_INTEREST",
      "id": "AB3F122E3E",
      "self": {
        "href": "https://test.api.amadeus.com/v1/reference-data/locations/pois/AB3F122E3E",
        "methods": [
          "GET"
        ]
      },
      "geoCode": {
        "latitude": 41.392376,
        "longitude": 2.160919
      },
      "name": "Cervecería Catalana",
      "category": "RESTAURANT",
      "rank": 30,
      "tags": [
        "restaurant",
        "tapas",
        "sightseeing",
        "traditionalcuisine",
        "bar",
        "activities",
        "commercialplace"
      ]
    },
    {
      "type": "location",
      "subType": "POINT_OF_INTEREST",
      "id": "752402FCA2",
      "self": {
        "href": "https://test.api.amadeus.com/v1/reference-data/locations/pois/752402FCA2",
        "methods": [
          "GET"
        ]
      },
      "geoCode": {
        "latitude": 41.40043,
        "longitude": 2.15463
      },
      "name": "Botafumeiro",
      "category": "RESTAURANT",
      "rank": 30,
      "tags": [
        "restaurant",
        "seafood",
        "sightseeing",
        "professionalservices",
        "transport",
        "commercialplace"
      ]
    },
    {
      "type": "location",
      "subType": "POINT_OF_INTEREST",
      "id": "5F1CED3994",
      "self": {
        "href": "https://test.api.amadeus.com/v1/reference-data/locations/pois/5F1CED3994",
        "methods": [
          "GET"
        ]
      },
      "geoCode": {
        "latitude": 41.39148,
        "longitude": 2.164981
      },
      "name": "Casa Amatller",
      "category": "SIGHTS",
      "rank": 100,
      "tags": [
        "sightseeing",
        "sights",
        "museum",
        "landmark",
        "restaurant",
        "tourguide",
        "historicplace",
        "historic",
        "attraction",
        "commercialplace",
        "activities",
        "shopping",
        "events"
      ]
    },
    {
      "type": "location",
      "subType": "POINT_OF_INTEREST",
      "id": "30601A1A90",
      "self": {
        "href": "https://test.api.amadeus.com/v1/reference-data/locations/pois/30601A1A90",
        "methods": [
          "GET"
        ]
      },
      "geoCode": {
        "latitude": 41.390785,
        "longitude": 2.167414
      },
      "name": "Tapas 24",
      "category": "RESTAURANT",
      "rank": 100,
      "tags": [
        "restaurant",
        "tapas",
        "traditionalcuisine",
        "sightseeing",
        "commercialplace",
        "transport",
        "patio",
        "garden",
        "activities",
        "bar"
      ]
    },
    {
      "type": "location",
      "subType": "POINT_OF_INTEREST",
      "id": "15C8B8148C",
      "self": {
        "href": "https://test.api.amadeus.com/v1/reference-data/locations/pois/15C8B8148C",
        "methods": [
          "GET"
        ]
      },
      "geoCode": {
        "latitude": 41.392677,
        "longitude": 2.153942
      },
      "name": "Dry Martini",
      "category": "NIGHTLIFE",
      "rank": 100,
      "tags": [
        "bar",
        "restaurant",
        "nightlife",
        "club",
        "sightseeing",
        "attraction",
        "activities"
      ]
    },
    {
      "type": "location",
      "subType": "POINT_OF_INTEREST",
      "id": "BD29CF2CCD",
      "self": {
        "href": "https://test.api.amadeus.com/v1/reference-data/locations/pois/BD29CF2CCD",
        "methods": [
          "GET"
        ]
      },
      "geoCode": {
        "latitude": 41.399193,
        "longitude": 2.159853
      },
      "name": "Con Gracia",
      "category": "RESTAURANT",
      "rank": 100,
      "tags": [
        "restaurant",
        "sightseeing",
        "commercialplace",
        "professionalservices",
        "activities"
      ]
    },
    {
      "type": "location",
      "subType": "POINT_OF_INTEREST",
      "id": "24DE6CE737",
      "self": {
        "href": "https://test.api.amadeus.com/v1/reference-data/locations/pois/24DE6CE737",
        "methods": [
          "GET"
        ]
      },
      "geoCode": {
        "latitude": 41.390198,
        "longitude": 2.156974
      },
      "name": "Osmosis",
      "category": "RESTAURANT",
      "rank": 100,
      "tags": [
        "restaurant",
        "shopping",
        "transport",
        "professionalservices"
      ]
    }
  ],
  "meta": {
    "count": 120,
    "links": {
      "self": "https://test.api.amadeus.com/v1/reference-data/locations/pois?latitude=41.397158&longitude=2.160873",
      "next": "https://test.api.amadeus.com/v1/reference-data/locations/pois?latitude=41.397158&longitude=2.160873&page[offset]=10&page[limit]=10",
      "last": "https://test.api.amadeus.com/v1/reference-data/locations/pois?latitude=41.397158&longitude=2.160873&page[offset]=120&page[limit]=10",
      "first": "https://test.api.amadeus.com/v1/reference-data/locations/pois?latitude=41.397158&longitude=2.160873&page[offset]=0&page[limit]=10",
      "up": "https://test.api.amadeus.com/v1/reference-data/locations/pois?latitude=41.397158&longitude=2.160873"
    }
  }
}
    ''';

    return simulateRemoteDataDelay(data);
  }

  // https://developers.amadeus.com/self-service/category/destination-content/api-doc/safe-place-api/api-reference
  @override
  Future<String> getRawSafePlace(_) async {
    final data = '''
    {
  "meta": {
    "count": 43,
    "links": {
      "self": "https://test.api.amadeus.com/v1/safety/safety-rated-locations?latitude=41.397158&longitude=2.160873&radius=2",
      "next": "https://test.api.amadeus.com/v1/safety/safety-rated-locations?latitude=41.397158&longitude=2.160873&page%5Boffset%5D=1&radius=2",
      "last": "https://test.api.amadeus.com/v1/safety/safety-rated-locations?latitude=41.397158&longitude=2.160873&page%5Boffset%5D=4&radius=2",
      "first": "https://test.api.amadeus.com/v1/safety/safety-rated-locations?latitude=41.397158&longitude=2.160873&page%5Boffset%5D=0&radius=2"
    }
  },
  "data": [
    {
      "type": "safety-rated-location",
      "id": "Q930402719",
      "self": {
        "type": "https://test.api.amadeus.com/v1/safety/safety-rated-locations/Q930402719",
        "methods": [
          "GET"
        ]
      },
      "subType": "CITY",
      "name": "Barcelona",
      "geoCode": {
        "latitude": 41.385064,
        "longitude": 2.173404
      },
      "safetyScores": {
        "lgbtq": 39,
        "medical": 0,
        "overall": 45,
        "physicalHarm": 36,
        "politicalFreedom": 50,
        "theft": 44,
        "women": 34
      }
    },
    {
      "type": "safety-rated-location",
      "id": "Q930402720",
      "self": {
        "type": "https://test.api.amadeus.com/v1/safety/safety-rated-locations/Q930402720",
        "methods": [
          "GET"
        ]
      },
      "subType": "DISTRICT",
      "name": "Antiga Esquerra de l'Eixample (Barcelona)",
      "geoCode": {
        "latitude": 41.3885573,
        "longitude": 2.1573033
      },
      "safetyScores": {
        "lgbtq": 37,
        "medical": 0,
        "overall": 44,
        "physicalHarm": 34,
        "politicalFreedom": 50,
        "theft": 42,
        "women": 33
      }
    },
    {
      "type": "safety-rated-location",
      "id": "Q930402721",
      "self": {
        "type": "https://test.api.amadeus.com/v1/safety/safety-rated-locations/Q930402721",
        "methods": [
          "GET"
        ]
      },
      "subType": "DISTRICT",
      "name": "Baix Guinardó (Barcelona)",
      "geoCode": {
        "latitude": 41.412131,
        "longitude": 2.1683571
      },
      "safetyScores": {
        "lgbtq": 37,
        "medical": 0,
        "overall": 44,
        "physicalHarm": 34,
        "politicalFreedom": 50,
        "theft": 42,
        "women": 33
      }
    },
    {
      "type": "safety-rated-location",
      "id": "Q930402722",
      "self": {
        "type": "https://test.api.amadeus.com/v1/safety/safety-rated-locations/Q930402722",
        "methods": [
          "GET"
        ]
      },
      "subType": "DISTRICT",
      "name": "Barceloneta (Barcelona)",
      "geoCode": {
        "latitude": 41.380894,
        "longitude": 2.189385
      },
      "safetyScores": {
        "lgbtq": 42,
        "medical": 0,
        "overall": 47,
        "physicalHarm": 39,
        "politicalFreedom": 50,
        "theft": 49,
        "women": 34
      }
    },
    {
      "type": "safety-rated-location",
      "id": "Q930402724",
      "self": {
        "type": "https://test.api.amadeus.com/v1/safety/safety-rated-locations/Q930402724",
        "methods": [
          "GET"
        ]
      },
      "subType": "DISTRICT",
      "name": "Can Baró (Barcelona)",
      "geoCode": {
        "latitude": 41.4172284,
        "longitude": 2.163444
      },
      "safetyScores": {
        "lgbtq": 37,
        "medical": 0,
        "overall": 44,
        "physicalHarm": 34,
        "politicalFreedom": 50,
        "theft": 42,
        "women": 33
      }
    },
    {
      "type": "safety-rated-location",
      "id": "Q930402731",
      "self": {
        "type": "https://test.api.amadeus.com/v1/safety/safety-rated-locations/Q930402731",
        "methods": [
          "GET"
        ]
      },
      "subType": "DISTRICT",
      "name": "El Born (Barcelona)",
      "geoCode": {
        "latitude": 41.384728,
        "longitude": 2.18286
      },
      "safetyScores": {
        "lgbtq": 42,
        "medical": 0,
        "overall": 47,
        "physicalHarm": 39,
        "politicalFreedom": 50,
        "theft": 49,
        "women": 34
      }
    },
    {
      "type": "safety-rated-location",
      "id": "Q930402732",
      "self": {
        "type": "https://test.api.amadeus.com/v1/safety/safety-rated-locations/Q930402732",
        "methods": [
          "GET"
        ]
      },
      "subType": "DISTRICT",
      "name": "El Camp de l'Arpa del Clot (Barcelona)",
      "geoCode": {
        "latitude": 41.4118532,
        "longitude": 2.1830997
      },
      "safetyScores": {
        "lgbtq": 37,
        "medical": 0,
        "overall": 45,
        "physicalHarm": 35,
        "politicalFreedom": 50,
        "theft": 43,
        "women": 33
      }
    },
    {
      "type": "safety-rated-location",
      "id": "Q930402733",
      "self": {
        "type": "https://test.api.amadeus.com/v1/safety/safety-rated-locations/Q930402733",
        "methods": [
          "GET"
        ]
      },
      "subType": "DISTRICT",
      "name": "El Camp d'en Grassot i Gràcia Nova (Barcelona)",
      "geoCode": {
        "latitude": 41.4046685,
        "longitude": 2.1659005
      },
      "safetyScores": {
        "lgbtq": 37,
        "medical": 0,
        "overall": 44,
        "physicalHarm": 34,
        "politicalFreedom": 50,
        "theft": 42,
        "women": 33
      }
    },
    {
      "type": "safety-rated-location",
      "id": "Q930402734",
      "self": {
        "type": "https://test.api.amadeus.com/v1/safety/safety-rated-locations/Q930402734",
        "methods": [
          "GET"
        ]
      },
      "subType": "DISTRICT",
      "name": "El Carmel (Barcelona)",
      "geoCode": {
        "latitude": 41.422371,
        "longitude": 2.1560753
      },
      "safetyScores": {
        "lgbtq": 37,
        "medical": 0,
        "overall": 44,
        "physicalHarm": 34,
        "politicalFreedom": 50,
        "theft": 42,
        "women": 33
      }
    },
    {
      "type": "safety-rated-location",
      "id": "Q930402735",
      "self": {
        "type": "https://test.api.amadeus.com/v1/safety/safety-rated-locations/Q930402735",
        "methods": [
          "GET"
        ]
      },
      "subType": "DISTRICT",
      "name": "El Clot (Barcelona)",
      "geoCode": {
        "latitude": 41.4097037,
        "longitude": 2.1892366
      },
      "safetyScores": {
        "lgbtq": 37,
        "medical": 0,
        "overall": 45,
        "physicalHarm": 35,
        "politicalFreedom": 50,
        "theft": 43,
        "women": 33
      }
    }
  ]
}
    ''';

    return simulateRemoteDataDelay(data);
  }

  // https://developers.amadeus.com/self-service/category/air/api-doc/flight-cheapest-date-search/api-reference
  @override
  Future<String> getRawFlightCheapestDateSearch() async {
    final data = '''
    {
  "data": [
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-07-29",
      "returnDate": "2020-07-30",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-07-29&returnDate=2020-07-30&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-07-29",
      "returnDate": "2020-07-31",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-07-29&returnDate=2020-07-31&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-07-29",
      "returnDate": "2020-08-01",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-07-29&returnDate=2020-08-01&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-07-29",
      "returnDate": "2020-08-02",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-07-29&returnDate=2020-08-02&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-07-29",
      "returnDate": "2020-08-03",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-07-29&returnDate=2020-08-03&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-07-29",
      "returnDate": "2020-08-04",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-07-29&returnDate=2020-08-04&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-07-29",
      "returnDate": "2020-08-05",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-07-29&returnDate=2020-08-05&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-07-29",
      "returnDate": "2020-08-06",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-07-29&returnDate=2020-08-06&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-07-29",
      "returnDate": "2020-08-07",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-07-29&returnDate=2020-08-07&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-07-29",
      "returnDate": "2020-08-08",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-07-29&returnDate=2020-08-08&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-07-29",
      "returnDate": "2020-08-09",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-07-29&returnDate=2020-08-09&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-07-29",
      "returnDate": "2020-08-10",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-07-29&returnDate=2020-08-10&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-07-29",
      "returnDate": "2020-08-11",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-07-29&returnDate=2020-08-11&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-07-29",
      "returnDate": "2020-08-12",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-07-29&returnDate=2020-08-12&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-07-29",
      "returnDate": "2020-08-13",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-07-29&returnDate=2020-08-13&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-07-30",
      "returnDate": "2020-07-31",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-07-30&returnDate=2020-07-31&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-07-30",
      "returnDate": "2020-08-01",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-07-30&returnDate=2020-08-01&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-07-30",
      "returnDate": "2020-08-02",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-07-30&returnDate=2020-08-02&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-07-30",
      "returnDate": "2020-08-03",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-07-30&returnDate=2020-08-03&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-07-30",
      "returnDate": "2020-08-04",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-07-30&returnDate=2020-08-04&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-07-30",
      "returnDate": "2020-08-05",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-07-30&returnDate=2020-08-05&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-07-30",
      "returnDate": "2020-08-06",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-07-30&returnDate=2020-08-06&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-07-30",
      "returnDate": "2020-08-07",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-07-30&returnDate=2020-08-07&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-07-30",
      "returnDate": "2020-08-08",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-07-30&returnDate=2020-08-08&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-07-30",
      "returnDate": "2020-08-09",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-07-30&returnDate=2020-08-09&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-07-30",
      "returnDate": "2020-08-10",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-07-30&returnDate=2020-08-10&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-07-30",
      "returnDate": "2020-08-11",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-07-30&returnDate=2020-08-11&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-07-30",
      "returnDate": "2020-08-12",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-07-30&returnDate=2020-08-12&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-07-30",
      "returnDate": "2020-08-13",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-07-30&returnDate=2020-08-13&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-07-30",
      "returnDate": "2020-08-14",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-07-30&returnDate=2020-08-14&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-07-31",
      "returnDate": "2020-08-01",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-07-31&returnDate=2020-08-01&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-07-31",
      "returnDate": "2020-08-02",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-07-31&returnDate=2020-08-02&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-07-31",
      "returnDate": "2020-08-03",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-07-31&returnDate=2020-08-03&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-07-31",
      "returnDate": "2020-08-04",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-07-31&returnDate=2020-08-04&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-07-31",
      "returnDate": "2020-08-05",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-07-31&returnDate=2020-08-05&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-07-31",
      "returnDate": "2020-08-06",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-07-31&returnDate=2020-08-06&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-07-31",
      "returnDate": "2020-08-07",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-07-31&returnDate=2020-08-07&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-07-31",
      "returnDate": "2020-08-08",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-07-31&returnDate=2020-08-08&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-07-31",
      "returnDate": "2020-08-09",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-07-31&returnDate=2020-08-09&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-07-31",
      "returnDate": "2020-08-10",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-07-31&returnDate=2020-08-10&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-07-31",
      "returnDate": "2020-08-11",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-07-31&returnDate=2020-08-11&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-07-31",
      "returnDate": "2020-08-12",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-07-31&returnDate=2020-08-12&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-07-31",
      "returnDate": "2020-08-13",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-07-31&returnDate=2020-08-13&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-07-31",
      "returnDate": "2020-08-14",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-07-31&returnDate=2020-08-14&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-07-31",
      "returnDate": "2020-08-15",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-07-31&returnDate=2020-08-15&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-01",
      "returnDate": "2020-08-02",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-01&returnDate=2020-08-02&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-01",
      "returnDate": "2020-08-03",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-01&returnDate=2020-08-03&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-01",
      "returnDate": "2020-08-04",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-01&returnDate=2020-08-04&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-01",
      "returnDate": "2020-08-05",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-01&returnDate=2020-08-05&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-01",
      "returnDate": "2020-08-06",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-01&returnDate=2020-08-06&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-01",
      "returnDate": "2020-08-07",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-01&returnDate=2020-08-07&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-01",
      "returnDate": "2020-08-08",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-01&returnDate=2020-08-08&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-01",
      "returnDate": "2020-08-09",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-01&returnDate=2020-08-09&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-01",
      "returnDate": "2020-08-10",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-01&returnDate=2020-08-10&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-01",
      "returnDate": "2020-08-11",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-01&returnDate=2020-08-11&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-01",
      "returnDate": "2020-08-12",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-01&returnDate=2020-08-12&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-01",
      "returnDate": "2020-08-13",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-01&returnDate=2020-08-13&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-01",
      "returnDate": "2020-08-14",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-01&returnDate=2020-08-14&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-01",
      "returnDate": "2020-08-15",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-01&returnDate=2020-08-15&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-01",
      "returnDate": "2020-08-16",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-01&returnDate=2020-08-16&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-02",
      "returnDate": "2020-08-03",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-02&returnDate=2020-08-03&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-02",
      "returnDate": "2020-08-04",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-02&returnDate=2020-08-04&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-02",
      "returnDate": "2020-08-05",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-02&returnDate=2020-08-05&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-02",
      "returnDate": "2020-08-06",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-02&returnDate=2020-08-06&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-02",
      "returnDate": "2020-08-07",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-02&returnDate=2020-08-07&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-02",
      "returnDate": "2020-08-08",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-02&returnDate=2020-08-08&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-02",
      "returnDate": "2020-08-09",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-02&returnDate=2020-08-09&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-02",
      "returnDate": "2020-08-10",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-02&returnDate=2020-08-10&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-02",
      "returnDate": "2020-08-11",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-02&returnDate=2020-08-11&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-02",
      "returnDate": "2020-08-12",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-02&returnDate=2020-08-12&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-02",
      "returnDate": "2020-08-13",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-02&returnDate=2020-08-13&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-02",
      "returnDate": "2020-08-14",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-02&returnDate=2020-08-14&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-02",
      "returnDate": "2020-08-15",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-02&returnDate=2020-08-15&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-02",
      "returnDate": "2020-08-16",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-02&returnDate=2020-08-16&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-02",
      "returnDate": "2020-08-17",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-02&returnDate=2020-08-17&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-03",
      "returnDate": "2020-08-04",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-03&returnDate=2020-08-04&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-03",
      "returnDate": "2020-08-05",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-03&returnDate=2020-08-05&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-03",
      "returnDate": "2020-08-06",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-03&returnDate=2020-08-06&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-03",
      "returnDate": "2020-08-07",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-03&returnDate=2020-08-07&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-03",
      "returnDate": "2020-08-08",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-03&returnDate=2020-08-08&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-03",
      "returnDate": "2020-08-09",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-03&returnDate=2020-08-09&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-03",
      "returnDate": "2020-08-10",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-03&returnDate=2020-08-10&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-03",
      "returnDate": "2020-08-11",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-03&returnDate=2020-08-11&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-03",
      "returnDate": "2020-08-12",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-03&returnDate=2020-08-12&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-03",
      "returnDate": "2020-08-13",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-03&returnDate=2020-08-13&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-03",
      "returnDate": "2020-08-14",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-03&returnDate=2020-08-14&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-03",
      "returnDate": "2020-08-15",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-03&returnDate=2020-08-15&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-03",
      "returnDate": "2020-08-16",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-03&returnDate=2020-08-16&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-03",
      "returnDate": "2020-08-17",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-03&returnDate=2020-08-17&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-03",
      "returnDate": "2020-08-18",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-03&returnDate=2020-08-18&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-04",
      "returnDate": "2020-08-05",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-04&returnDate=2020-08-05&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-04",
      "returnDate": "2020-08-06",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-04&returnDate=2020-08-06&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-04",
      "returnDate": "2020-08-07",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-04&returnDate=2020-08-07&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-04",
      "returnDate": "2020-08-08",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-04&returnDate=2020-08-08&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-04",
      "returnDate": "2020-08-09",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-04&returnDate=2020-08-09&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-04",
      "returnDate": "2020-08-10",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-04&returnDate=2020-08-10&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-04",
      "returnDate": "2020-08-11",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-04&returnDate=2020-08-11&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-04",
      "returnDate": "2020-08-12",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-04&returnDate=2020-08-12&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-04",
      "returnDate": "2020-08-13",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-04&returnDate=2020-08-13&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-04",
      "returnDate": "2020-08-14",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-04&returnDate=2020-08-14&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-04",
      "returnDate": "2020-08-15",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-04&returnDate=2020-08-15&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-04",
      "returnDate": "2020-08-16",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-04&returnDate=2020-08-16&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-04",
      "returnDate": "2020-08-17",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-04&returnDate=2020-08-17&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-04",
      "returnDate": "2020-08-18",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-04&returnDate=2020-08-18&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-04",
      "returnDate": "2020-08-19",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-04&returnDate=2020-08-19&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-05",
      "returnDate": "2020-08-06",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-05&returnDate=2020-08-06&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-05",
      "returnDate": "2020-08-07",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-05&returnDate=2020-08-07&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-05",
      "returnDate": "2020-08-08",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-05&returnDate=2020-08-08&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-05",
      "returnDate": "2020-08-09",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-05&returnDate=2020-08-09&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-05",
      "returnDate": "2020-08-10",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-05&returnDate=2020-08-10&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-05",
      "returnDate": "2020-08-11",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-05&returnDate=2020-08-11&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-05",
      "returnDate": "2020-08-12",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-05&returnDate=2020-08-12&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-05",
      "returnDate": "2020-08-13",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-05&returnDate=2020-08-13&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-05",
      "returnDate": "2020-08-14",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-05&returnDate=2020-08-14&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-05",
      "returnDate": "2020-08-15",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-05&returnDate=2020-08-15&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-05",
      "returnDate": "2020-08-16",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-05&returnDate=2020-08-16&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-05",
      "returnDate": "2020-08-17",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-05&returnDate=2020-08-17&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-05",
      "returnDate": "2020-08-18",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-05&returnDate=2020-08-18&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-05",
      "returnDate": "2020-08-19",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-05&returnDate=2020-08-19&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-05",
      "returnDate": "2020-08-20",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-05&returnDate=2020-08-20&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-06",
      "returnDate": "2020-08-07",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-06&returnDate=2020-08-07&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-06",
      "returnDate": "2020-08-08",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-06&returnDate=2020-08-08&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-06",
      "returnDate": "2020-08-09",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-06&returnDate=2020-08-09&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-06",
      "returnDate": "2020-08-10",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-06&returnDate=2020-08-10&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-06",
      "returnDate": "2020-08-11",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-06&returnDate=2020-08-11&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-06",
      "returnDate": "2020-08-12",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-06&returnDate=2020-08-12&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-06",
      "returnDate": "2020-08-13",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-06&returnDate=2020-08-13&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-06",
      "returnDate": "2020-08-14",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-06&returnDate=2020-08-14&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-06",
      "returnDate": "2020-08-15",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-06&returnDate=2020-08-15&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-06",
      "returnDate": "2020-08-16",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-06&returnDate=2020-08-16&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-06",
      "returnDate": "2020-08-17",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-06&returnDate=2020-08-17&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-06",
      "returnDate": "2020-08-18",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-06&returnDate=2020-08-18&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-06",
      "returnDate": "2020-08-19",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-06&returnDate=2020-08-19&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-06",
      "returnDate": "2020-08-20",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-06&returnDate=2020-08-20&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-06",
      "returnDate": "2020-08-21",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-06&returnDate=2020-08-21&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-07",
      "returnDate": "2020-08-08",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-07&returnDate=2020-08-08&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-07",
      "returnDate": "2020-08-09",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-07&returnDate=2020-08-09&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-07",
      "returnDate": "2020-08-10",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-07&returnDate=2020-08-10&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-07",
      "returnDate": "2020-08-11",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-07&returnDate=2020-08-11&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-07",
      "returnDate": "2020-08-12",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-07&returnDate=2020-08-12&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-07",
      "returnDate": "2020-08-13",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-07&returnDate=2020-08-13&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-07",
      "returnDate": "2020-08-14",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-07&returnDate=2020-08-14&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-07",
      "returnDate": "2020-08-15",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-07&returnDate=2020-08-15&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-07",
      "returnDate": "2020-08-16",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-07&returnDate=2020-08-16&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-07",
      "returnDate": "2020-08-17",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-07&returnDate=2020-08-17&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-07",
      "returnDate": "2020-08-18",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-07&returnDate=2020-08-18&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-07",
      "returnDate": "2020-08-19",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-07&returnDate=2020-08-19&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-07",
      "returnDate": "2020-08-20",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-07&returnDate=2020-08-20&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-07",
      "returnDate": "2020-08-21",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-07&returnDate=2020-08-21&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-07",
      "returnDate": "2020-08-22",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-07&returnDate=2020-08-22&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-08",
      "returnDate": "2020-08-09",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-08&returnDate=2020-08-09&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-08",
      "returnDate": "2020-08-10",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-08&returnDate=2020-08-10&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-08",
      "returnDate": "2020-08-11",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-08&returnDate=2020-08-11&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-08",
      "returnDate": "2020-08-12",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-08&returnDate=2020-08-12&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-08",
      "returnDate": "2020-08-13",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-08&returnDate=2020-08-13&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-08",
      "returnDate": "2020-08-14",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-08&returnDate=2020-08-14&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-08",
      "returnDate": "2020-08-15",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-08&returnDate=2020-08-15&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-08",
      "returnDate": "2020-08-16",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-08&returnDate=2020-08-16&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-08",
      "returnDate": "2020-08-17",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-08&returnDate=2020-08-17&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-08",
      "returnDate": "2020-08-18",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-08&returnDate=2020-08-18&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-08",
      "returnDate": "2020-08-19",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-08&returnDate=2020-08-19&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-08",
      "returnDate": "2020-08-20",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-08&returnDate=2020-08-20&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-08",
      "returnDate": "2020-08-21",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-08&returnDate=2020-08-21&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-08",
      "returnDate": "2020-08-22",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-08&returnDate=2020-08-22&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-08",
      "returnDate": "2020-08-23",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-08&returnDate=2020-08-23&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-09",
      "returnDate": "2020-08-10",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-09&returnDate=2020-08-10&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-09",
      "returnDate": "2020-08-11",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-09&returnDate=2020-08-11&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-09",
      "returnDate": "2020-08-12",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-09&returnDate=2020-08-12&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-09",
      "returnDate": "2020-08-13",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-09&returnDate=2020-08-13&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-09",
      "returnDate": "2020-08-14",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-09&returnDate=2020-08-14&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-09",
      "returnDate": "2020-08-15",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-09&returnDate=2020-08-15&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-09",
      "returnDate": "2020-08-16",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-09&returnDate=2020-08-16&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-09",
      "returnDate": "2020-08-17",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-09&returnDate=2020-08-17&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-09",
      "returnDate": "2020-08-18",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-09&returnDate=2020-08-18&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-09",
      "returnDate": "2020-08-19",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-09&returnDate=2020-08-19&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-09",
      "returnDate": "2020-08-20",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-09&returnDate=2020-08-20&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-09",
      "returnDate": "2020-08-21",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-09&returnDate=2020-08-21&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-09",
      "returnDate": "2020-08-22",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-09&returnDate=2020-08-22&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-09",
      "returnDate": "2020-08-23",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-09&returnDate=2020-08-23&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-09",
      "returnDate": "2020-08-24",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-09&returnDate=2020-08-24&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-10",
      "returnDate": "2020-08-11",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-10&returnDate=2020-08-11&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-10",
      "returnDate": "2020-08-12",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-10&returnDate=2020-08-12&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-10",
      "returnDate": "2020-08-13",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-10&returnDate=2020-08-13&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-10",
      "returnDate": "2020-08-14",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-10&returnDate=2020-08-14&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-10",
      "returnDate": "2020-08-15",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-10&returnDate=2020-08-15&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-10",
      "returnDate": "2020-08-16",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-10&returnDate=2020-08-16&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-10",
      "returnDate": "2020-08-17",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-10&returnDate=2020-08-17&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-10",
      "returnDate": "2020-08-18",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-10&returnDate=2020-08-18&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-10",
      "returnDate": "2020-08-19",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-10&returnDate=2020-08-19&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-10",
      "returnDate": "2020-08-20",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-10&returnDate=2020-08-20&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-10",
      "returnDate": "2020-08-21",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-10&returnDate=2020-08-21&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-10",
      "returnDate": "2020-08-22",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-10&returnDate=2020-08-22&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-10",
      "returnDate": "2020-08-23",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-10&returnDate=2020-08-23&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-10",
      "returnDate": "2020-08-24",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-10&returnDate=2020-08-24&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-10",
      "returnDate": "2020-08-25",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-10&returnDate=2020-08-25&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-11",
      "returnDate": "2020-08-12",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-11&returnDate=2020-08-12&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-11",
      "returnDate": "2020-08-13",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-11&returnDate=2020-08-13&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-11",
      "returnDate": "2020-08-14",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-11&returnDate=2020-08-14&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-11",
      "returnDate": "2020-08-15",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-11&returnDate=2020-08-15&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-11",
      "returnDate": "2020-08-16",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-11&returnDate=2020-08-16&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-11",
      "returnDate": "2020-08-17",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-11&returnDate=2020-08-17&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-11",
      "returnDate": "2020-08-18",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-11&returnDate=2020-08-18&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-11",
      "returnDate": "2020-08-19",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-11&returnDate=2020-08-19&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-11",
      "returnDate": "2020-08-20",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-11&returnDate=2020-08-20&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-11",
      "returnDate": "2020-08-21",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-11&returnDate=2020-08-21&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-11",
      "returnDate": "2020-08-22",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-11&returnDate=2020-08-22&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-11",
      "returnDate": "2020-08-23",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-11&returnDate=2020-08-23&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-11",
      "returnDate": "2020-08-24",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-11&returnDate=2020-08-24&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-11",
      "returnDate": "2020-08-25",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-11&returnDate=2020-08-25&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-11",
      "returnDate": "2020-08-26",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-11&returnDate=2020-08-26&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-12",
      "returnDate": "2020-08-13",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-12&returnDate=2020-08-13&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-12",
      "returnDate": "2020-08-14",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-12&returnDate=2020-08-14&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-12",
      "returnDate": "2020-08-15",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-12&returnDate=2020-08-15&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-12",
      "returnDate": "2020-08-16",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-12&returnDate=2020-08-16&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-12",
      "returnDate": "2020-08-17",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-12&returnDate=2020-08-17&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-12",
      "returnDate": "2020-08-18",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-12&returnDate=2020-08-18&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-12",
      "returnDate": "2020-08-19",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-12&returnDate=2020-08-19&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-12",
      "returnDate": "2020-08-20",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-12&returnDate=2020-08-20&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-12",
      "returnDate": "2020-08-21",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-12&returnDate=2020-08-21&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-12",
      "returnDate": "2020-08-22",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-12&returnDate=2020-08-22&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-12",
      "returnDate": "2020-08-23",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-12&returnDate=2020-08-23&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-12",
      "returnDate": "2020-08-24",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-12&returnDate=2020-08-24&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-12",
      "returnDate": "2020-08-25",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-12&returnDate=2020-08-25&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-12",
      "returnDate": "2020-08-26",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-12&returnDate=2020-08-26&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-12",
      "returnDate": "2020-08-27",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-12&returnDate=2020-08-27&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-13",
      "returnDate": "2020-08-14",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-13&returnDate=2020-08-14&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-13",
      "returnDate": "2020-08-15",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-13&returnDate=2020-08-15&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-13",
      "returnDate": "2020-08-16",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-13&returnDate=2020-08-16&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-13",
      "returnDate": "2020-08-17",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-13&returnDate=2020-08-17&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-13",
      "returnDate": "2020-08-18",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-13&returnDate=2020-08-18&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-13",
      "returnDate": "2020-08-19",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-13&returnDate=2020-08-19&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-13",
      "returnDate": "2020-08-20",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-13&returnDate=2020-08-20&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-13",
      "returnDate": "2020-08-21",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-13&returnDate=2020-08-21&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-13",
      "returnDate": "2020-08-22",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-13&returnDate=2020-08-22&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-13",
      "returnDate": "2020-08-23",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-13&returnDate=2020-08-23&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-13",
      "returnDate": "2020-08-24",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-13&returnDate=2020-08-24&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-13",
      "returnDate": "2020-08-25",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-13&returnDate=2020-08-25&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-13",
      "returnDate": "2020-08-26",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-13&returnDate=2020-08-26&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-13",
      "returnDate": "2020-08-27",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-13&returnDate=2020-08-27&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-13",
      "returnDate": "2020-08-28",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-13&returnDate=2020-08-28&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-14",
      "returnDate": "2020-08-15",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-14&returnDate=2020-08-15&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-14",
      "returnDate": "2020-08-16",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-14&returnDate=2020-08-16&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-14",
      "returnDate": "2020-08-17",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-14&returnDate=2020-08-17&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-14",
      "returnDate": "2020-08-18",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-14&returnDate=2020-08-18&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-14",
      "returnDate": "2020-08-19",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-14&returnDate=2020-08-19&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-14",
      "returnDate": "2020-08-20",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-14&returnDate=2020-08-20&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-14",
      "returnDate": "2020-08-21",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-14&returnDate=2020-08-21&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-14",
      "returnDate": "2020-08-22",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-14&returnDate=2020-08-22&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-14",
      "returnDate": "2020-08-23",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-14&returnDate=2020-08-23&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-14",
      "returnDate": "2020-08-24",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-14&returnDate=2020-08-24&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-14",
      "returnDate": "2020-08-25",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-14&returnDate=2020-08-25&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-14",
      "returnDate": "2020-08-26",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-14&returnDate=2020-08-26&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-14",
      "returnDate": "2020-08-27",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-14&returnDate=2020-08-27&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-14",
      "returnDate": "2020-08-28",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-14&returnDate=2020-08-28&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-14",
      "returnDate": "2020-08-29",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-14&returnDate=2020-08-29&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-15",
      "returnDate": "2020-08-16",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-15&returnDate=2020-08-16&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-15",
      "returnDate": "2020-08-17",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-15&returnDate=2020-08-17&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-15",
      "returnDate": "2020-08-18",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-15&returnDate=2020-08-18&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-15",
      "returnDate": "2020-08-19",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-15&returnDate=2020-08-19&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-15",
      "returnDate": "2020-08-20",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-15&returnDate=2020-08-20&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-15",
      "returnDate": "2020-08-21",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-15&returnDate=2020-08-21&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-15",
      "returnDate": "2020-08-22",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-15&returnDate=2020-08-22&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-15",
      "returnDate": "2020-08-23",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-15&returnDate=2020-08-23&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-15",
      "returnDate": "2020-08-24",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-15&returnDate=2020-08-24&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-15",
      "returnDate": "2020-08-25",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-15&returnDate=2020-08-25&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-15",
      "returnDate": "2020-08-26",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-15&returnDate=2020-08-26&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-15",
      "returnDate": "2020-08-27",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-15&returnDate=2020-08-27&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-15",
      "returnDate": "2020-08-28",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-15&returnDate=2020-08-28&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-15",
      "returnDate": "2020-08-29",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-15&returnDate=2020-08-29&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-15",
      "returnDate": "2020-08-30",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-15&returnDate=2020-08-30&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-16",
      "returnDate": "2020-08-17",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-16&returnDate=2020-08-17&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-16",
      "returnDate": "2020-08-18",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-16&returnDate=2020-08-18&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-16",
      "returnDate": "2020-08-19",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-16&returnDate=2020-08-19&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-16",
      "returnDate": "2020-08-20",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-16&returnDate=2020-08-20&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-16",
      "returnDate": "2020-08-21",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-16&returnDate=2020-08-21&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-16",
      "returnDate": "2020-08-22",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-16&returnDate=2020-08-22&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-16",
      "returnDate": "2020-08-23",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-16&returnDate=2020-08-23&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-16",
      "returnDate": "2020-08-24",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-16&returnDate=2020-08-24&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-16",
      "returnDate": "2020-08-25",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-16&returnDate=2020-08-25&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-16",
      "returnDate": "2020-08-26",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-16&returnDate=2020-08-26&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-16",
      "returnDate": "2020-08-27",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-16&returnDate=2020-08-27&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-16",
      "returnDate": "2020-08-28",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-16&returnDate=2020-08-28&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-16",
      "returnDate": "2020-08-29",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-16&returnDate=2020-08-29&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-16",
      "returnDate": "2020-08-30",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-16&returnDate=2020-08-30&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-16",
      "returnDate": "2020-08-31",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-16&returnDate=2020-08-31&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-17",
      "returnDate": "2020-08-18",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-17&returnDate=2020-08-18&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-17",
      "returnDate": "2020-08-19",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-17&returnDate=2020-08-19&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-17",
      "returnDate": "2020-08-20",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-17&returnDate=2020-08-20&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-17",
      "returnDate": "2020-08-21",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-17&returnDate=2020-08-21&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-17",
      "returnDate": "2020-08-22",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-17&returnDate=2020-08-22&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-17",
      "returnDate": "2020-08-23",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-17&returnDate=2020-08-23&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-17",
      "returnDate": "2020-08-24",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-17&returnDate=2020-08-24&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-17",
      "returnDate": "2020-08-25",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-17&returnDate=2020-08-25&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-17",
      "returnDate": "2020-08-26",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-17&returnDate=2020-08-26&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-17",
      "returnDate": "2020-08-27",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-17&returnDate=2020-08-27&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-17",
      "returnDate": "2020-08-28",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-17&returnDate=2020-08-28&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-17",
      "returnDate": "2020-08-29",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-17&returnDate=2020-08-29&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-17",
      "returnDate": "2020-08-30",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-17&returnDate=2020-08-30&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-17",
      "returnDate": "2020-08-31",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-17&returnDate=2020-08-31&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-17",
      "returnDate": "2020-09-01",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-17&returnDate=2020-09-01&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-18",
      "returnDate": "2020-08-19",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-18&returnDate=2020-08-19&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-18",
      "returnDate": "2020-08-20",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-18&returnDate=2020-08-20&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-18",
      "returnDate": "2020-08-21",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-18&returnDate=2020-08-21&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-18",
      "returnDate": "2020-08-22",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-18&returnDate=2020-08-22&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-18",
      "returnDate": "2020-08-23",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-18&returnDate=2020-08-23&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-18",
      "returnDate": "2020-08-24",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-18&returnDate=2020-08-24&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-18",
      "returnDate": "2020-08-25",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-18&returnDate=2020-08-25&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-18",
      "returnDate": "2020-08-26",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-18&returnDate=2020-08-26&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-18",
      "returnDate": "2020-08-27",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-18&returnDate=2020-08-27&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-18",
      "returnDate": "2020-08-28",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-18&returnDate=2020-08-28&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-18",
      "returnDate": "2020-08-29",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-18&returnDate=2020-08-29&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-18",
      "returnDate": "2020-08-30",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-18&returnDate=2020-08-30&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-18",
      "returnDate": "2020-08-31",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-18&returnDate=2020-08-31&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-18",
      "returnDate": "2020-09-01",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-18&returnDate=2020-09-01&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-18",
      "returnDate": "2020-09-02",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-18&returnDate=2020-09-02&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-19",
      "returnDate": "2020-08-20",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-19&returnDate=2020-08-20&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-19",
      "returnDate": "2020-08-21",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-19&returnDate=2020-08-21&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-19",
      "returnDate": "2020-08-22",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-19&returnDate=2020-08-22&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-19",
      "returnDate": "2020-08-23",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-19&returnDate=2020-08-23&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-19",
      "returnDate": "2020-08-24",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-19&returnDate=2020-08-24&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-19",
      "returnDate": "2020-08-25",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-19&returnDate=2020-08-25&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-19",
      "returnDate": "2020-08-26",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-19&returnDate=2020-08-26&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-19",
      "returnDate": "2020-08-27",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-19&returnDate=2020-08-27&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-19",
      "returnDate": "2020-08-28",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-19&returnDate=2020-08-28&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-19",
      "returnDate": "2020-08-29",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-19&returnDate=2020-08-29&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-19",
      "returnDate": "2020-08-30",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-19&returnDate=2020-08-30&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-19",
      "returnDate": "2020-08-31",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-19&returnDate=2020-08-31&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-19",
      "returnDate": "2020-09-01",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-19&returnDate=2020-09-01&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-19",
      "returnDate": "2020-09-02",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-19&returnDate=2020-09-02&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-19",
      "returnDate": "2020-09-03",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-19&returnDate=2020-09-03&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-20",
      "returnDate": "2020-08-21",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-20&returnDate=2020-08-21&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-20",
      "returnDate": "2020-08-22",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-20&returnDate=2020-08-22&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-20",
      "returnDate": "2020-08-23",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-20&returnDate=2020-08-23&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-20",
      "returnDate": "2020-08-24",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-20&returnDate=2020-08-24&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-20",
      "returnDate": "2020-08-25",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-20&returnDate=2020-08-25&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-20",
      "returnDate": "2020-08-26",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-20&returnDate=2020-08-26&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-20",
      "returnDate": "2020-08-27",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-20&returnDate=2020-08-27&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-20",
      "returnDate": "2020-08-28",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-20&returnDate=2020-08-28&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-20",
      "returnDate": "2020-08-29",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-20&returnDate=2020-08-29&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-20",
      "returnDate": "2020-08-30",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-20&returnDate=2020-08-30&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-20",
      "returnDate": "2020-08-31",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-20&returnDate=2020-08-31&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-20",
      "returnDate": "2020-09-01",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-20&returnDate=2020-09-01&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-20",
      "returnDate": "2020-09-02",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-20&returnDate=2020-09-02&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-20",
      "returnDate": "2020-09-03",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-20&returnDate=2020-09-03&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-21",
      "returnDate": "2020-08-22",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-21&returnDate=2020-08-22&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-21",
      "returnDate": "2020-08-23",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-21&returnDate=2020-08-23&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-21",
      "returnDate": "2020-08-24",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-21&returnDate=2020-08-24&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-21",
      "returnDate": "2020-08-25",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-21&returnDate=2020-08-25&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-21",
      "returnDate": "2020-08-26",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-21&returnDate=2020-08-26&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-21",
      "returnDate": "2020-08-27",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-21&returnDate=2020-08-27&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-21",
      "returnDate": "2020-08-28",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-21&returnDate=2020-08-28&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-21",
      "returnDate": "2020-08-29",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-21&returnDate=2020-08-29&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-21",
      "returnDate": "2020-08-30",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-21&returnDate=2020-08-30&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-21",
      "returnDate": "2020-08-31",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-21&returnDate=2020-08-31&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-21",
      "returnDate": "2020-09-01",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-21&returnDate=2020-09-01&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-21",
      "returnDate": "2020-09-02",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-21&returnDate=2020-09-02&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-21",
      "returnDate": "2020-09-03",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-21&returnDate=2020-09-03&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-21",
      "returnDate": "2020-09-05",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-21&returnDate=2020-09-05&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-22",
      "returnDate": "2020-08-23",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-22&returnDate=2020-08-23&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-22",
      "returnDate": "2020-08-24",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-22&returnDate=2020-08-24&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-22",
      "returnDate": "2020-08-25",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-22&returnDate=2020-08-25&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-22",
      "returnDate": "2020-08-26",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-22&returnDate=2020-08-26&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-22",
      "returnDate": "2020-08-27",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-22&returnDate=2020-08-27&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-22",
      "returnDate": "2020-08-28",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-22&returnDate=2020-08-28&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-22",
      "returnDate": "2020-08-29",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-22&returnDate=2020-08-29&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-22",
      "returnDate": "2020-08-30",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-22&returnDate=2020-08-30&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-22",
      "returnDate": "2020-08-31",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-22&returnDate=2020-08-31&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-22",
      "returnDate": "2020-09-01",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-22&returnDate=2020-09-01&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-22",
      "returnDate": "2020-09-02",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-22&returnDate=2020-09-02&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-22",
      "returnDate": "2020-09-03",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-22&returnDate=2020-09-03&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-22",
      "returnDate": "2020-09-05",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-22&returnDate=2020-09-05&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-22",
      "returnDate": "2020-09-06",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-22&returnDate=2020-09-06&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-23",
      "returnDate": "2020-08-24",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-23&returnDate=2020-08-24&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-23",
      "returnDate": "2020-08-25",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-23&returnDate=2020-08-25&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-23",
      "returnDate": "2020-08-26",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-23&returnDate=2020-08-26&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-23",
      "returnDate": "2020-08-27",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-23&returnDate=2020-08-27&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-23",
      "returnDate": "2020-08-28",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-23&returnDate=2020-08-28&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-23",
      "returnDate": "2020-08-29",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-23&returnDate=2020-08-29&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-23",
      "returnDate": "2020-08-30",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-23&returnDate=2020-08-30&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-23",
      "returnDate": "2020-08-31",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-23&returnDate=2020-08-31&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-23",
      "returnDate": "2020-09-01",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-23&returnDate=2020-09-01&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-23",
      "returnDate": "2020-09-02",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-23&returnDate=2020-09-02&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-23",
      "returnDate": "2020-09-03",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-23&returnDate=2020-09-03&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-23",
      "returnDate": "2020-09-05",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-23&returnDate=2020-09-05&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-23",
      "returnDate": "2020-09-06",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-23&returnDate=2020-09-06&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-23",
      "returnDate": "2020-09-07",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-23&returnDate=2020-09-07&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-24",
      "returnDate": "2020-08-25",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-24&returnDate=2020-08-25&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-24",
      "returnDate": "2020-08-26",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-24&returnDate=2020-08-26&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-24",
      "returnDate": "2020-08-27",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-24&returnDate=2020-08-27&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-24",
      "returnDate": "2020-08-28",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-24&returnDate=2020-08-28&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-24",
      "returnDate": "2020-08-29",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-24&returnDate=2020-08-29&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-24",
      "returnDate": "2020-08-30",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-24&returnDate=2020-08-30&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-24",
      "returnDate": "2020-08-31",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-24&returnDate=2020-08-31&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-24",
      "returnDate": "2020-09-01",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-24&returnDate=2020-09-01&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-24",
      "returnDate": "2020-09-02",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-24&returnDate=2020-09-02&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-24",
      "returnDate": "2020-09-03",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-24&returnDate=2020-09-03&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-24",
      "returnDate": "2020-09-05",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-24&returnDate=2020-09-05&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-24",
      "returnDate": "2020-09-06",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-24&returnDate=2020-09-06&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-24",
      "returnDate": "2020-09-07",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-24&returnDate=2020-09-07&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-24",
      "returnDate": "2020-09-08",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-24&returnDate=2020-09-08&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-25",
      "returnDate": "2020-08-26",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-25&returnDate=2020-08-26&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-25",
      "returnDate": "2020-08-27",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-25&returnDate=2020-08-27&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-25",
      "returnDate": "2020-08-28",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-25&returnDate=2020-08-28&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-25",
      "returnDate": "2020-08-29",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-25&returnDate=2020-08-29&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-25",
      "returnDate": "2020-08-30",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-25&returnDate=2020-08-30&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-25",
      "returnDate": "2020-08-31",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-25&returnDate=2020-08-31&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-25",
      "returnDate": "2020-09-01",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-25&returnDate=2020-09-01&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-25",
      "returnDate": "2020-09-02",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-25&returnDate=2020-09-02&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-25",
      "returnDate": "2020-09-03",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-25&returnDate=2020-09-03&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-25",
      "returnDate": "2020-09-05",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-25&returnDate=2020-09-05&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-25",
      "returnDate": "2020-09-06",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-25&returnDate=2020-09-06&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-25",
      "returnDate": "2020-09-07",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-25&returnDate=2020-09-07&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-25",
      "returnDate": "2020-09-08",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-25&returnDate=2020-09-08&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-25",
      "returnDate": "2020-09-09",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-25&returnDate=2020-09-09&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-26",
      "returnDate": "2020-08-27",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-26&returnDate=2020-08-27&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-26",
      "returnDate": "2020-08-28",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-26&returnDate=2020-08-28&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-26",
      "returnDate": "2020-08-29",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-26&returnDate=2020-08-29&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-26",
      "returnDate": "2020-08-30",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-26&returnDate=2020-08-30&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-26",
      "returnDate": "2020-08-31",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-26&returnDate=2020-08-31&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-26",
      "returnDate": "2020-09-01",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-26&returnDate=2020-09-01&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-26",
      "returnDate": "2020-09-02",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-26&returnDate=2020-09-02&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-26",
      "returnDate": "2020-09-03",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-26&returnDate=2020-09-03&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-26",
      "returnDate": "2020-09-05",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-26&returnDate=2020-09-05&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-26",
      "returnDate": "2020-09-06",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-26&returnDate=2020-09-06&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-26",
      "returnDate": "2020-09-07",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-26&returnDate=2020-09-07&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-26",
      "returnDate": "2020-09-08",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-26&returnDate=2020-09-08&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-26",
      "returnDate": "2020-09-09",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-26&returnDate=2020-09-09&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-26",
      "returnDate": "2020-09-10",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-26&returnDate=2020-09-10&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-27",
      "returnDate": "2020-08-28",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-27&returnDate=2020-08-28&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-27",
      "returnDate": "2020-08-29",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-27&returnDate=2020-08-29&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-27",
      "returnDate": "2020-08-30",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-27&returnDate=2020-08-30&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-27",
      "returnDate": "2020-08-31",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-27&returnDate=2020-08-31&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-27",
      "returnDate": "2020-09-01",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-27&returnDate=2020-09-01&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-27",
      "returnDate": "2020-09-02",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-27&returnDate=2020-09-02&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-27",
      "returnDate": "2020-09-03",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-27&returnDate=2020-09-03&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-27",
      "returnDate": "2020-09-05",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-27&returnDate=2020-09-05&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-27",
      "returnDate": "2020-09-06",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-27&returnDate=2020-09-06&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-27",
      "returnDate": "2020-09-07",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-27&returnDate=2020-09-07&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-27",
      "returnDate": "2020-09-08",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-27&returnDate=2020-09-08&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-27",
      "returnDate": "2020-09-09",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-27&returnDate=2020-09-09&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-27",
      "returnDate": "2020-09-10",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-27&returnDate=2020-09-10&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-27",
      "returnDate": "2020-09-11",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-27&returnDate=2020-09-11&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-28",
      "returnDate": "2020-08-29",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-28&returnDate=2020-08-29&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-28",
      "returnDate": "2020-08-30",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-28&returnDate=2020-08-30&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-28",
      "returnDate": "2020-08-31",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-28&returnDate=2020-08-31&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-28",
      "returnDate": "2020-09-01",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-28&returnDate=2020-09-01&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-28",
      "returnDate": "2020-09-02",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-28&returnDate=2020-09-02&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-28",
      "returnDate": "2020-09-03",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-28&returnDate=2020-09-03&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-28",
      "returnDate": "2020-09-05",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-28&returnDate=2020-09-05&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-28",
      "returnDate": "2020-09-06",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-28&returnDate=2020-09-06&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-28",
      "returnDate": "2020-09-07",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-28&returnDate=2020-09-07&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-28",
      "returnDate": "2020-09-08",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-28&returnDate=2020-09-08&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-28",
      "returnDate": "2020-09-09",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-28&returnDate=2020-09-09&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-28",
      "returnDate": "2020-09-10",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-28&returnDate=2020-09-10&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-28",
      "returnDate": "2020-09-11",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-28&returnDate=2020-09-11&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-28",
      "returnDate": "2020-09-12",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-28&returnDate=2020-09-12&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-29",
      "returnDate": "2020-08-30",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-29&returnDate=2020-08-30&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-29",
      "returnDate": "2020-08-31",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-29&returnDate=2020-08-31&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-29",
      "returnDate": "2020-09-01",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-29&returnDate=2020-09-01&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-29",
      "returnDate": "2020-09-02",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-29&returnDate=2020-09-02&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-29",
      "returnDate": "2020-09-03",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-29&returnDate=2020-09-03&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-29",
      "returnDate": "2020-09-05",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-29&returnDate=2020-09-05&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-29",
      "returnDate": "2020-09-06",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-29&returnDate=2020-09-06&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-29",
      "returnDate": "2020-09-07",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-29&returnDate=2020-09-07&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-29",
      "returnDate": "2020-09-08",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-29&returnDate=2020-09-08&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-29",
      "returnDate": "2020-09-09",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-29&returnDate=2020-09-09&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-29",
      "returnDate": "2020-09-10",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-29&returnDate=2020-09-10&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-29",
      "returnDate": "2020-09-11",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-29&returnDate=2020-09-11&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-29",
      "returnDate": "2020-09-12",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-29&returnDate=2020-09-12&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-29",
      "returnDate": "2020-09-13",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-29&returnDate=2020-09-13&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-30",
      "returnDate": "2020-08-31",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-30&returnDate=2020-08-31&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-30",
      "returnDate": "2020-09-01",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-30&returnDate=2020-09-01&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-30",
      "returnDate": "2020-09-02",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-30&returnDate=2020-09-02&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-30",
      "returnDate": "2020-09-03",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-30&returnDate=2020-09-03&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-30",
      "returnDate": "2020-09-05",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-30&returnDate=2020-09-05&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-30",
      "returnDate": "2020-09-06",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-30&returnDate=2020-09-06&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-30",
      "returnDate": "2020-09-07",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-30&returnDate=2020-09-07&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-30",
      "returnDate": "2020-09-08",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-30&returnDate=2020-09-08&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-30",
      "returnDate": "2020-09-09",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-30&returnDate=2020-09-09&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-30",
      "returnDate": "2020-09-10",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-30&returnDate=2020-09-10&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-30",
      "returnDate": "2020-09-11",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-30&returnDate=2020-09-11&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-30",
      "returnDate": "2020-09-12",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-30&returnDate=2020-09-12&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-30",
      "returnDate": "2020-09-13",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-30&returnDate=2020-09-13&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-30",
      "returnDate": "2020-09-14",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-30&returnDate=2020-09-14&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-31",
      "returnDate": "2020-09-01",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-31&returnDate=2020-09-01&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-31",
      "returnDate": "2020-09-02",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-31&returnDate=2020-09-02&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-31",
      "returnDate": "2020-09-03",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-31&returnDate=2020-09-03&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-31",
      "returnDate": "2020-09-05",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-31&returnDate=2020-09-05&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-31",
      "returnDate": "2020-09-06",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-31&returnDate=2020-09-06&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-31",
      "returnDate": "2020-09-07",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-31&returnDate=2020-09-07&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-31",
      "returnDate": "2020-09-08",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-31&returnDate=2020-09-08&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-31",
      "returnDate": "2020-09-09",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-31&returnDate=2020-09-09&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-31",
      "returnDate": "2020-09-10",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-31&returnDate=2020-09-10&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-31",
      "returnDate": "2020-09-11",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-31&returnDate=2020-09-11&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-31",
      "returnDate": "2020-09-12",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-31&returnDate=2020-09-12&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-31",
      "returnDate": "2020-09-13",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-31&returnDate=2020-09-13&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-31",
      "returnDate": "2020-09-14",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-31&returnDate=2020-09-14&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-08-31",
      "returnDate": "2020-09-15",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-08-31&returnDate=2020-09-15&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-01",
      "returnDate": "2020-09-02",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-01&returnDate=2020-09-02&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-01",
      "returnDate": "2020-09-03",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-01&returnDate=2020-09-03&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-01",
      "returnDate": "2020-09-05",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-01&returnDate=2020-09-05&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-01",
      "returnDate": "2020-09-06",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-01&returnDate=2020-09-06&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-01",
      "returnDate": "2020-09-07",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-01&returnDate=2020-09-07&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-01",
      "returnDate": "2020-09-08",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-01&returnDate=2020-09-08&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-01",
      "returnDate": "2020-09-09",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-01&returnDate=2020-09-09&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-01",
      "returnDate": "2020-09-10",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-01&returnDate=2020-09-10&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-01",
      "returnDate": "2020-09-11",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-01&returnDate=2020-09-11&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-01",
      "returnDate": "2020-09-12",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-01&returnDate=2020-09-12&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-01",
      "returnDate": "2020-09-13",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-01&returnDate=2020-09-13&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-01",
      "returnDate": "2020-09-14",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-01&returnDate=2020-09-14&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-01",
      "returnDate": "2020-09-15",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-01&returnDate=2020-09-15&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-01",
      "returnDate": "2020-09-16",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-01&returnDate=2020-09-16&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-02",
      "returnDate": "2020-09-03",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-02&returnDate=2020-09-03&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-02",
      "returnDate": "2020-09-05",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-02&returnDate=2020-09-05&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-02",
      "returnDate": "2020-09-06",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-02&returnDate=2020-09-06&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-02",
      "returnDate": "2020-09-07",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-02&returnDate=2020-09-07&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-02",
      "returnDate": "2020-09-08",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-02&returnDate=2020-09-08&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-02",
      "returnDate": "2020-09-09",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-02&returnDate=2020-09-09&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-02",
      "returnDate": "2020-09-10",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-02&returnDate=2020-09-10&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-02",
      "returnDate": "2020-09-11",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-02&returnDate=2020-09-11&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-02",
      "returnDate": "2020-09-12",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-02&returnDate=2020-09-12&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-02",
      "returnDate": "2020-09-13",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-02&returnDate=2020-09-13&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-02",
      "returnDate": "2020-09-14",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-02&returnDate=2020-09-14&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-02",
      "returnDate": "2020-09-15",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-02&returnDate=2020-09-15&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-02",
      "returnDate": "2020-09-16",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-02&returnDate=2020-09-16&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-02",
      "returnDate": "2020-09-17",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-02&returnDate=2020-09-17&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-03",
      "returnDate": "2020-09-05",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-03&returnDate=2020-09-05&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-03",
      "returnDate": "2020-09-06",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-03&returnDate=2020-09-06&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-03",
      "returnDate": "2020-09-07",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-03&returnDate=2020-09-07&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-03",
      "returnDate": "2020-09-08",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-03&returnDate=2020-09-08&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-03",
      "returnDate": "2020-09-09",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-03&returnDate=2020-09-09&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-03",
      "returnDate": "2020-09-10",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-03&returnDate=2020-09-10&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-03",
      "returnDate": "2020-09-11",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-03&returnDate=2020-09-11&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-03",
      "returnDate": "2020-09-12",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-03&returnDate=2020-09-12&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-03",
      "returnDate": "2020-09-13",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-03&returnDate=2020-09-13&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-03",
      "returnDate": "2020-09-14",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-03&returnDate=2020-09-14&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-03",
      "returnDate": "2020-09-15",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-03&returnDate=2020-09-15&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-03",
      "returnDate": "2020-09-16",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-03&returnDate=2020-09-16&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-03",
      "returnDate": "2020-09-17",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-03&returnDate=2020-09-17&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-06",
      "returnDate": "2020-09-07",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-06&returnDate=2020-09-07&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-06",
      "returnDate": "2020-09-08",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-06&returnDate=2020-09-08&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-06",
      "returnDate": "2020-09-09",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-06&returnDate=2020-09-09&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-06",
      "returnDate": "2020-09-10",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-06&returnDate=2020-09-10&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-06",
      "returnDate": "2020-09-11",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-06&returnDate=2020-09-11&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-06",
      "returnDate": "2020-09-12",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-06&returnDate=2020-09-12&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-06",
      "returnDate": "2020-09-13",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-06&returnDate=2020-09-13&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-06",
      "returnDate": "2020-09-14",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-06&returnDate=2020-09-14&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-06",
      "returnDate": "2020-09-15",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-06&returnDate=2020-09-15&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-06",
      "returnDate": "2020-09-16",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-06&returnDate=2020-09-16&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-06",
      "returnDate": "2020-09-17",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-06&returnDate=2020-09-17&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-06",
      "returnDate": "2020-09-19",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-06&returnDate=2020-09-19&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-06",
      "returnDate": "2020-09-20",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-06&returnDate=2020-09-20&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-06",
      "returnDate": "2020-09-21",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-06&returnDate=2020-09-21&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-08",
      "returnDate": "2020-09-09",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-08&returnDate=2020-09-09&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-08",
      "returnDate": "2020-09-10",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-08&returnDate=2020-09-10&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-08",
      "returnDate": "2020-09-11",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-08&returnDate=2020-09-11&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-08",
      "returnDate": "2020-09-12",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-08&returnDate=2020-09-12&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-08",
      "returnDate": "2020-09-13",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-08&returnDate=2020-09-13&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-08",
      "returnDate": "2020-09-14",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-08&returnDate=2020-09-14&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-08",
      "returnDate": "2020-09-15",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-08&returnDate=2020-09-15&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-08",
      "returnDate": "2020-09-16",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-08&returnDate=2020-09-16&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-08",
      "returnDate": "2020-09-17",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-08&returnDate=2020-09-17&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-08",
      "returnDate": "2020-09-19",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-08&returnDate=2020-09-19&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-08",
      "returnDate": "2020-09-20",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-08&returnDate=2020-09-20&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-08",
      "returnDate": "2020-09-21",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-08&returnDate=2020-09-21&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-08",
      "returnDate": "2020-09-22",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-08&returnDate=2020-09-22&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-08",
      "returnDate": "2020-09-23",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-08&returnDate=2020-09-23&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-09",
      "returnDate": "2020-09-10",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-09&returnDate=2020-09-10&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-09",
      "returnDate": "2020-09-11",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-09&returnDate=2020-09-11&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-09",
      "returnDate": "2020-09-12",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-09&returnDate=2020-09-12&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-09",
      "returnDate": "2020-09-13",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-09&returnDate=2020-09-13&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-09",
      "returnDate": "2020-09-14",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-09&returnDate=2020-09-14&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-09",
      "returnDate": "2020-09-15",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-09&returnDate=2020-09-15&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-09",
      "returnDate": "2020-09-16",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-09&returnDate=2020-09-16&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-09",
      "returnDate": "2020-09-17",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-09&returnDate=2020-09-17&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-09",
      "returnDate": "2020-09-19",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-09&returnDate=2020-09-19&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-09",
      "returnDate": "2020-09-20",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-09&returnDate=2020-09-20&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-09",
      "returnDate": "2020-09-21",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-09&returnDate=2020-09-21&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-09",
      "returnDate": "2020-09-22",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-09&returnDate=2020-09-22&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-09",
      "returnDate": "2020-09-23",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-09&returnDate=2020-09-23&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-09",
      "returnDate": "2020-09-24",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-09&returnDate=2020-09-24&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-10",
      "returnDate": "2020-09-11",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-10&returnDate=2020-09-11&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-10",
      "returnDate": "2020-09-12",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-10&returnDate=2020-09-12&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-10",
      "returnDate": "2020-09-13",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-10&returnDate=2020-09-13&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-10",
      "returnDate": "2020-09-14",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-10&returnDate=2020-09-14&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-10",
      "returnDate": "2020-09-15",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-10&returnDate=2020-09-15&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-10",
      "returnDate": "2020-09-16",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-10&returnDate=2020-09-16&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-10",
      "returnDate": "2020-09-17",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-10&returnDate=2020-09-17&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-10",
      "returnDate": "2020-09-19",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-10&returnDate=2020-09-19&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-10",
      "returnDate": "2020-09-20",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-10&returnDate=2020-09-20&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-10",
      "returnDate": "2020-09-21",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-10&returnDate=2020-09-21&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-10",
      "returnDate": "2020-09-22",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-10&returnDate=2020-09-22&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-10",
      "returnDate": "2020-09-23",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-10&returnDate=2020-09-23&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-10",
      "returnDate": "2020-09-24",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-10&returnDate=2020-09-24&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-11",
      "returnDate": "2020-09-12",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-11&returnDate=2020-09-12&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-11",
      "returnDate": "2020-09-13",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-11&returnDate=2020-09-13&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-11",
      "returnDate": "2020-09-14",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-11&returnDate=2020-09-14&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-11",
      "returnDate": "2020-09-15",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-11&returnDate=2020-09-15&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-11",
      "returnDate": "2020-09-16",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-11&returnDate=2020-09-16&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-11",
      "returnDate": "2020-09-17",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-11&returnDate=2020-09-17&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-11",
      "returnDate": "2020-09-19",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-11&returnDate=2020-09-19&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-11",
      "returnDate": "2020-09-20",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-11&returnDate=2020-09-20&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-11",
      "returnDate": "2020-09-21",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-11&returnDate=2020-09-21&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-11",
      "returnDate": "2020-09-22",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-11&returnDate=2020-09-22&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-11",
      "returnDate": "2020-09-23",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-11&returnDate=2020-09-23&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-11",
      "returnDate": "2020-09-24",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-11&returnDate=2020-09-24&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-11",
      "returnDate": "2020-09-26",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-11&returnDate=2020-09-26&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-12",
      "returnDate": "2020-09-13",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-12&returnDate=2020-09-13&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-12",
      "returnDate": "2020-09-14",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-12&returnDate=2020-09-14&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-12",
      "returnDate": "2020-09-15",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-12&returnDate=2020-09-15&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-12",
      "returnDate": "2020-09-16",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-12&returnDate=2020-09-16&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-12",
      "returnDate": "2020-09-17",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-12&returnDate=2020-09-17&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-12",
      "returnDate": "2020-09-19",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-12&returnDate=2020-09-19&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-12",
      "returnDate": "2020-09-20",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-12&returnDate=2020-09-20&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-12",
      "returnDate": "2020-09-21",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-12&returnDate=2020-09-21&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-12",
      "returnDate": "2020-09-22",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-12&returnDate=2020-09-22&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-12",
      "returnDate": "2020-09-23",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-12&returnDate=2020-09-23&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-12",
      "returnDate": "2020-09-24",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-12&returnDate=2020-09-24&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-12",
      "returnDate": "2020-09-26",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-12&returnDate=2020-09-26&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-12",
      "returnDate": "2020-09-27",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-12&returnDate=2020-09-27&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-13",
      "returnDate": "2020-09-14",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-13&returnDate=2020-09-14&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-13",
      "returnDate": "2020-09-15",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-13&returnDate=2020-09-15&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-13",
      "returnDate": "2020-09-16",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-13&returnDate=2020-09-16&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-13",
      "returnDate": "2020-09-17",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-13&returnDate=2020-09-17&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-13",
      "returnDate": "2020-09-19",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-13&returnDate=2020-09-19&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-13",
      "returnDate": "2020-09-20",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-13&returnDate=2020-09-20&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-13",
      "returnDate": "2020-09-21",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-13&returnDate=2020-09-21&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-13",
      "returnDate": "2020-09-22",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-13&returnDate=2020-09-22&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-13",
      "returnDate": "2020-09-23",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-13&returnDate=2020-09-23&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-13",
      "returnDate": "2020-09-24",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-13&returnDate=2020-09-24&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-13",
      "returnDate": "2020-09-26",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-13&returnDate=2020-09-26&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-13",
      "returnDate": "2020-09-27",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-13&returnDate=2020-09-27&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-13",
      "returnDate": "2020-09-28",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-13&returnDate=2020-09-28&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-14",
      "returnDate": "2020-09-15",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-14&returnDate=2020-09-15&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-14",
      "returnDate": "2020-09-16",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-14&returnDate=2020-09-16&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-14",
      "returnDate": "2020-09-17",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-14&returnDate=2020-09-17&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-14",
      "returnDate": "2020-09-19",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-14&returnDate=2020-09-19&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-14",
      "returnDate": "2020-09-20",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-14&returnDate=2020-09-20&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-14",
      "returnDate": "2020-09-21",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-14&returnDate=2020-09-21&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-14",
      "returnDate": "2020-09-22",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-14&returnDate=2020-09-22&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-14",
      "returnDate": "2020-09-23",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-14&returnDate=2020-09-23&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-14",
      "returnDate": "2020-09-24",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-14&returnDate=2020-09-24&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-14",
      "returnDate": "2020-09-26",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-14&returnDate=2020-09-26&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-14",
      "returnDate": "2020-09-27",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-14&returnDate=2020-09-27&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-14",
      "returnDate": "2020-09-28",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-14&returnDate=2020-09-28&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-14",
      "returnDate": "2020-09-29",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-14&returnDate=2020-09-29&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-15",
      "returnDate": "2020-09-16",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-15&returnDate=2020-09-16&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-15",
      "returnDate": "2020-09-17",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-15&returnDate=2020-09-17&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-15",
      "returnDate": "2020-09-19",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-15&returnDate=2020-09-19&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-15",
      "returnDate": "2020-09-20",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-15&returnDate=2020-09-20&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-15",
      "returnDate": "2020-09-21",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-15&returnDate=2020-09-21&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-15",
      "returnDate": "2020-09-22",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-15&returnDate=2020-09-22&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-15",
      "returnDate": "2020-09-23",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-15&returnDate=2020-09-23&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-15",
      "returnDate": "2020-09-24",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-15&returnDate=2020-09-24&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-15",
      "returnDate": "2020-09-26",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-15&returnDate=2020-09-26&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-15",
      "returnDate": "2020-09-27",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-15&returnDate=2020-09-27&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-15",
      "returnDate": "2020-09-28",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-15&returnDate=2020-09-28&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-15",
      "returnDate": "2020-09-29",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-15&returnDate=2020-09-29&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-15",
      "returnDate": "2020-09-30",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-15&returnDate=2020-09-30&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-16",
      "returnDate": "2020-09-17",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-16&returnDate=2020-09-17&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-16",
      "returnDate": "2020-09-19",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-16&returnDate=2020-09-19&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-16",
      "returnDate": "2020-09-20",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-16&returnDate=2020-09-20&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-16",
      "returnDate": "2020-09-21",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-16&returnDate=2020-09-21&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-16",
      "returnDate": "2020-09-22",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-16&returnDate=2020-09-22&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-16",
      "returnDate": "2020-09-23",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-16&returnDate=2020-09-23&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-16",
      "returnDate": "2020-09-24",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-16&returnDate=2020-09-24&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-16",
      "returnDate": "2020-09-26",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-16&returnDate=2020-09-26&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-16",
      "returnDate": "2020-09-27",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-16&returnDate=2020-09-27&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-16",
      "returnDate": "2020-09-28",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-16&returnDate=2020-09-28&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-16",
      "returnDate": "2020-09-29",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-16&returnDate=2020-09-29&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-16",
      "returnDate": "2020-09-30",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-16&returnDate=2020-09-30&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-17",
      "returnDate": "2020-09-19",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-17&returnDate=2020-09-19&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-17",
      "returnDate": "2020-09-20",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-17&returnDate=2020-09-20&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-17",
      "returnDate": "2020-09-21",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-17&returnDate=2020-09-21&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-17",
      "returnDate": "2020-09-22",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-17&returnDate=2020-09-22&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-17",
      "returnDate": "2020-09-23",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-17&returnDate=2020-09-23&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-17",
      "returnDate": "2020-09-24",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-17&returnDate=2020-09-24&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-17",
      "returnDate": "2020-09-26",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-17&returnDate=2020-09-26&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-17",
      "returnDate": "2020-09-27",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-17&returnDate=2020-09-27&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-17",
      "returnDate": "2020-09-28",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-17&returnDate=2020-09-28&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-17",
      "returnDate": "2020-09-29",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-17&returnDate=2020-09-29&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-17",
      "returnDate": "2020-09-30",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-17&returnDate=2020-09-30&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-18",
      "returnDate": "2020-09-19",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-18&returnDate=2020-09-19&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-18",
      "returnDate": "2020-09-20",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-18&returnDate=2020-09-20&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-18",
      "returnDate": "2020-09-21",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-18&returnDate=2020-09-21&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-18",
      "returnDate": "2020-09-22",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-18&returnDate=2020-09-22&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-18",
      "returnDate": "2020-09-23",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-18&returnDate=2020-09-23&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-18",
      "returnDate": "2020-09-24",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-18&returnDate=2020-09-24&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-18",
      "returnDate": "2020-09-26",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-18&returnDate=2020-09-26&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-18",
      "returnDate": "2020-09-27",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-18&returnDate=2020-09-27&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-18",
      "returnDate": "2020-09-28",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-18&returnDate=2020-09-28&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-18",
      "returnDate": "2020-09-29",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-18&returnDate=2020-09-29&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-18",
      "returnDate": "2020-09-30",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-18&returnDate=2020-09-30&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-19",
      "returnDate": "2020-09-20",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-19&returnDate=2020-09-20&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-19",
      "returnDate": "2020-09-21",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-19&returnDate=2020-09-21&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-19",
      "returnDate": "2020-09-22",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-19&returnDate=2020-09-22&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-19",
      "returnDate": "2020-09-23",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-19&returnDate=2020-09-23&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-19",
      "returnDate": "2020-09-24",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-19&returnDate=2020-09-24&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-19",
      "returnDate": "2020-09-26",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-19&returnDate=2020-09-26&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-19",
      "returnDate": "2020-09-27",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-19&returnDate=2020-09-27&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-19",
      "returnDate": "2020-09-28",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-19&returnDate=2020-09-28&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-19",
      "returnDate": "2020-09-29",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-19&returnDate=2020-09-29&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-19",
      "returnDate": "2020-09-30",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-19&returnDate=2020-09-30&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-20",
      "returnDate": "2020-09-21",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-20&returnDate=2020-09-21&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-20",
      "returnDate": "2020-09-22",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-20&returnDate=2020-09-22&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-20",
      "returnDate": "2020-09-23",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-20&returnDate=2020-09-23&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-20",
      "returnDate": "2020-09-24",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-20&returnDate=2020-09-24&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-20",
      "returnDate": "2020-09-26",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-20&returnDate=2020-09-26&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-20",
      "returnDate": "2020-09-27",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-20&returnDate=2020-09-27&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-20",
      "returnDate": "2020-09-28",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-20&returnDate=2020-09-28&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-20",
      "returnDate": "2020-09-29",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-20&returnDate=2020-09-29&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-20",
      "returnDate": "2020-09-30",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-20&returnDate=2020-09-30&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-21",
      "returnDate": "2020-09-22",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-21&returnDate=2020-09-22&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-21",
      "returnDate": "2020-09-23",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-21&returnDate=2020-09-23&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-21",
      "returnDate": "2020-09-24",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-21&returnDate=2020-09-24&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-21",
      "returnDate": "2020-09-26",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-21&returnDate=2020-09-26&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-21",
      "returnDate": "2020-09-27",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-21&returnDate=2020-09-27&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-21",
      "returnDate": "2020-09-28",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-21&returnDate=2020-09-28&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-21",
      "returnDate": "2020-09-29",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-21&returnDate=2020-09-29&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-21",
      "returnDate": "2020-09-30",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-21&returnDate=2020-09-30&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-22",
      "returnDate": "2020-09-23",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-22&returnDate=2020-09-23&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-22",
      "returnDate": "2020-09-24",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-22&returnDate=2020-09-24&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-22",
      "returnDate": "2020-09-26",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-22&returnDate=2020-09-26&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-22",
      "returnDate": "2020-09-27",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-22&returnDate=2020-09-27&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-22",
      "returnDate": "2020-09-28",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-22&returnDate=2020-09-28&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-22",
      "returnDate": "2020-09-29",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-22&returnDate=2020-09-29&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-22",
      "returnDate": "2020-09-30",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-22&returnDate=2020-09-30&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-23",
      "returnDate": "2020-09-24",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-23&returnDate=2020-09-24&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-23",
      "returnDate": "2020-09-26",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-23&returnDate=2020-09-26&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-23",
      "returnDate": "2020-09-27",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-23&returnDate=2020-09-27&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-23",
      "returnDate": "2020-09-28",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-23&returnDate=2020-09-28&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-23",
      "returnDate": "2020-09-29",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-23&returnDate=2020-09-29&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-23",
      "returnDate": "2020-09-30",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-23&returnDate=2020-09-30&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-24",
      "returnDate": "2020-09-26",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-24&returnDate=2020-09-26&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-24",
      "returnDate": "2020-09-27",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-24&returnDate=2020-09-27&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-24",
      "returnDate": "2020-09-28",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-24&returnDate=2020-09-28&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-24",
      "returnDate": "2020-09-29",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-24&returnDate=2020-09-29&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-24",
      "returnDate": "2020-09-30",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-24&returnDate=2020-09-30&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-25",
      "returnDate": "2020-09-26",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-25&returnDate=2020-09-26&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-25",
      "returnDate": "2020-09-27",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-25&returnDate=2020-09-27&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-25",
      "returnDate": "2020-09-28",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-25&returnDate=2020-09-28&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-25",
      "returnDate": "2020-09-29",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-25&returnDate=2020-09-29&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-25",
      "returnDate": "2020-09-30",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-25&returnDate=2020-09-30&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-26",
      "returnDate": "2020-09-27",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-26&returnDate=2020-09-27&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-26",
      "returnDate": "2020-09-28",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-26&returnDate=2020-09-28&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-26",
      "returnDate": "2020-09-29",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-26&returnDate=2020-09-29&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-26",
      "returnDate": "2020-09-30",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-26&returnDate=2020-09-30&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-27",
      "returnDate": "2020-09-28",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-27&returnDate=2020-09-28&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-27",
      "returnDate": "2020-09-29",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-27&returnDate=2020-09-29&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-27",
      "returnDate": "2020-09-30",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-27&returnDate=2020-09-30&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-28",
      "returnDate": "2020-09-29",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-28&returnDate=2020-09-29&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-28",
      "returnDate": "2020-09-30",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-28&returnDate=2020-09-30&adults=1&nonStop=false"
      }
    },
    {
      "type": "flight-date",
      "origin": "MAD",
      "destination": "MUC",
      "departureDate": "2020-09-29",
      "returnDate": "2020-09-30",
      "price": {
        "total": "98.53"
      },
      "links": {
        "flightDestinations": "https://test.api.amadeus.com/v1/shopping/flight-destinations?origin=MAD&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION",
        "flightOffers": "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=MAD&destinationLocationCode=MUC&departureDate=2020-09-29&returnDate=2020-09-30&adults=1&nonStop=false"
      }
    }
  ],
  "dictionaries": {
    "currencies": {
      "EUR": "EURO"
    },
    "locations": {
      "MAD": {
        "subType": "AIRPORT",
        "detailedName": "ADOLFO SUAREZ BARAJAS"
      },
      "MUC": {
        "subType": "AIRPORT",
        "detailedName": "MUNICH INTERNATIONAL"
      }
    }
  },
  "meta": {
    "currency": "EUR",
    "links": {
      "self": "https://test.api.amadeus.com/v1/shopping/flight-dates?origin=MAD&destination=MUC&departureDate=2020-07-24,2021-01-19&oneWay=false&duration=1,15&nonStop=false&viewBy=DURATION"
    },
    "defaults": {
      "departureDate": "2020-07-24,2021-01-19",
      "oneWay": false,
      "duration": "1,15",
      "nonStop": false,
      "viewBy": "DURATION"
    }
  },
  "warnings": [
    {
      "title": "Maximum response size reached"
    }
  ]
}
    ''';

    return simulateRemoteDataDelay(data);
  }
}
