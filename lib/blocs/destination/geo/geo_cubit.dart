import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:virtual_traveller_flutter/data/models/airport.dart';
import 'package:virtual_traveller_flutter/data/repositories/amadeus_repository.dart';

part 'geo_state.dart';

class GeoCubit extends Cubit<GeoState> {
  GeoCubit({
    @required this.amadeusRepository,
  }) : super(GeoInitial());

  final AmadeusRepository amadeusRepository;

  void fetchCityGeoData({
    @required String cityCode,
  }) async {
    emit(GeoLoading());
    try {
      await amadeusRepository.getAirportCitySearch(cityCode).then((airportList) {
        if (airportList.isNotEmpty) {
          for (final airport in airportList) {
            if (airport.airportCode == cityCode) {
              return emit(GeoSuccess(airport));
            }
          }
        }
        return emit(GeoFailure('Could not fetch geo data'));
      });
    } catch (e) {
      print(e);
      emit(GeoFailure(e is Response
          ? e.reasonPhrase
          : e is SocketException
              ? e.toString()
              : e.toString()));
    }
  }
}
