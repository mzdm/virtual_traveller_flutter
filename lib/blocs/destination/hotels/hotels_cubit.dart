import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:virtual_traveller_flutter/data/models/hotel.dart';
import 'package:virtual_traveller_flutter/data/repositories/amadeus_repository.dart';

part 'hotels_state.dart';

class HotelsCubit extends Cubit<HotelsState> {
  HotelsCubit({
    @required this.amadeusRepository,
  }) : super(HotelsInitial());

  final AmadeusRepository amadeusRepository;

  // TODO: Improve error message
  void fetchHotels({
    @required String cityCode,
    String language,
  }) async {
    emit(HotelsLoading());
    try {
      await amadeusRepository
          .getHotelSearch(
        cityCode: cityCode,
        language: language,
      )
          .then((hotels) {
        if (hotels.isNotEmpty) {
          return emit(HotelsSuccess(hotels));
        } else {
          return emit(HotelsEmpty());
        }
      });
    } catch (e) {
      print(e);
      emit(HotelsFailure(e is Response
          ? e.reasonPhrase
          : e is SocketException
              ? e.toString()
              : e.toString()));
    }
  }

  void resetState() => emit(HotelsInitial());
}
