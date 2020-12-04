import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import 'package:virtual_traveller_flutter/data/data_providers/remote/amadeus_api/fake_data.dart';
import 'package:virtual_traveller_flutter/data/models/destination.dart';
import 'package:virtual_traveller_flutter/data/repositories/amadeus_repository.dart';

part 'most_popular_destinations_state.dart';

class MostPopularDestinationsCubit extends Cubit<MostPopularDestinationsState> {
  MostPopularDestinationsCubit(
    this.amadeusRepository,
  ) : super(MostPopularDestinationsInitial());

  final AmadeusRepository amadeusRepository;

  // TODO: Cache result to save API quota
  void fetchMostPopularDestinations(String originCityCode) async {
    emit(MostPopularDestinationsLoading());
    try {
      final popularDestinationsList =
          await amadeusRepository.getFlightMostTravelled(originCityCode);
      if (popularDestinationsList.isNotEmpty) {
        emit(MostPopularDestinationsSuccess(popularDestinationsList));
      } else {
        emitFakeDataOnEmpty();
      }
    } catch (e) {
      final errorMsg = e is Response
          ? e.reasonPhrase
          : 'An error has occurred while fetching the data.';
      emit(MostPopularDestinationsFailure(errorMsg));
    }
  }

  void emitFakeDataOnEmpty() async {
    final fakeData = await AmadeusRepository(
      amadeusBaseDataProvider: AmadeusFakeDataProvider(),
    ).getFlightMostTravelled('');
    emit(MostPopularDestinationsSuccess(fakeData));
  }
}
