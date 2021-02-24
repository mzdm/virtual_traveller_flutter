import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import 'package:virtual_traveller_flutter/data/models/hotel.dart';
import 'package:virtual_traveller_flutter/data/repositories/amadeus_repository.dart';

part 'hotels_state.dart';

class HotelsCubit extends Cubit<HotelsState> {
  HotelsCubit({
    required this.amadeusRepository,
  }) : super(HotelsInitial());

  final AmadeusRepository amadeusRepository;

  void fetchHotels({
    required String cityCode,
    String? language,
  }) async {
    emit(HotelsLoading());
    try {
      final hotelsList = await amadeusRepository.getHotelSearch(
        cityCode: cityCode,
        language: language,
      );

      if (hotelsList.isNotEmpty) {
        return emit(HotelsSuccess(hotelsList));
      } else {
        return emit(HotelsEmpty());
      }
    } catch (e) {
      print(e);

      final errorMsg = e is Response ? e.reasonPhrase ?? '' : e.toString();
      emit(HotelsFailure(errorMsg));
    }
  }
}
