import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import 'package:virtual_traveller_flutter/data/data_providers/remote/amadeus_api/mocked_data.dart';
import 'package:virtual_traveller_flutter/data/models/destination.dart';
import 'package:virtual_traveller_flutter/data/repositories/amadeus_repository.dart';

part 'most_popular_destinations_state.dart';

class MostPopularDestinationsCubit extends Cubit<MostPopularDestinationsState> {
  MostPopularDestinationsCubit(
    this.amadeusRepository,
  ) : super(MostPopularDestinationsInitial());

  final AmadeusRepository amadeusRepository;

  void fetchMostPopularDestinations(String originCityCode) async {
    emit(MostPopularDestinationsInitial());
    try {
      final data = await amadeusRepository.getFlightMostTravelled(originCityCode);

      if (data.isNotEmpty) {
        emit(MostPopularDestinationsSuccess(data));
      } else {
        emitMockedDataOnEmpty();
      }
    } catch (e) {
      print(e);
      emit(MostPopularDestinationsFailure(
        (e is Response) ? e.reasonPhrase : 'An error has occurred while fetching the data.',
      ));
    }
  }

  void emitMockedDataOnEmpty() async {
    final mockedData = await AmadeusRepository(amadeusBaseDataProvider: AmadeusMockedDataProvider())
        .getFlightMostTravelled('');
    emit(MostPopularDestinationsSuccess(mockedData));
  }
}
