import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:virtual_traveller_flutter/config/app/debug_config.dart';
import 'package:virtual_traveller_flutter/data/models/airport.dart';
import 'package:virtual_traveller_flutter/data/repositories/amadeus_repository.dart';

part 'geo_state.dart';

class GeoCubit extends Cubit<GeoState> {
  GeoCubit({
    @required this.amadeusRepository,
  }) : super(GeoInitial());

  final AmadeusRepository amadeusRepository;

  void fetchCityGeoData({@required String inputCityCode}) async {
    try {
      final airportList =
          await amadeusRepository.getAirportCitySearch(inputCityCode);

      if (airportList.isNotEmpty) {
        // load fake response data if it is quotaSaveMode
        if (DebugConfig.quotaSaveMode) {
          return emit(GeoSuccess(airportList[0]));
        }

        // find airport in API response from user input
        for (final airport in airportList) {
          if (inputCityCode == airport.airportCode) {
            return emit(GeoSuccess(airport));
          }
        }
      }
      return emit(GeoFailure('Could not fetch geo data'));
    } catch (e) {
      print(e);

      final errorMsg = e is Response
          ? e.reasonPhrase
          : e is SocketException
              ? e.toString()
              : e.toString();
      emit(GeoFailure(errorMsg));
    }
  }
}
