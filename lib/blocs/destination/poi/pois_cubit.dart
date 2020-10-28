import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:virtual_traveller_flutter/data/models/location.dart';
import 'package:virtual_traveller_flutter/data/models/poi.dart';
import 'package:virtual_traveller_flutter/data/repositories/amadeus_repository.dart';

part 'pois_state.dart';

class PoisCubit extends Cubit<PoisState> {
  PoisCubit({
    @required this.amadeusRepository,
  }) : super(PoisInitial());

  final AmadeusRepository amadeusRepository;

  void fetchPois({
    @required Location location,
    List<CategoryPOI> categories,
  }) async {
    emit(PoisLoading());
    try {
      await amadeusRepository
          .getPointsOfInterest(
        location: location,
        categoriesList: categories,
      )
          .then((pois) {
        if (pois.isNotEmpty) {
          return emit(PoisSuccess(pois));
        } else {
          return emit(PoisEmpty());
        }
      });
    } catch (e) {
      print(e);
      emit(
        PoisFailure(
          e is Response
              ? e.reasonPhrase
              : e is SocketException
                  ? e.toString()
                  : e.toString(),
        ),
      );
    }
  }
}
