import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:virtual_traveller_flutter/blocs/destination/geo/geo_cubit.dart';
import 'package:virtual_traveller_flutter/data/data_providers/remote/amadeus_api/fake_data.dart';
import 'package:virtual_traveller_flutter/data/models/location.dart';
import 'package:virtual_traveller_flutter/data/models/poi.dart';
import 'package:virtual_traveller_flutter/data/repositories/amadeus_repository.dart';

part 'pois_state.dart';

class PoisCubit extends Cubit<PoisState> {
  // StreamSubscription _geoSubscription;

  PoisCubit({
    @required this.geoCubit,
    @required this.amadeusRepository,
  }) : super(PoisInitial()) {
    // _geoSubscription = geoCubit.listen((geoState) {
    //   if (geoState is GeoSuccess) {
    //     final geoCodes = geoState.geoData?.geoCode;
    //     fetchPois(
    //       location: Location(
    //         latitude: geoCodes?.latitude,
    //         longitude: geoCodes?.longitude,
    //       ),
    //     );
    //   }
    // });
  }

  final GeoCubit geoCubit;
  final AmadeusRepository amadeusRepository;

  void fetchPois({
    @required Location location,
    List<CategoryPOI> categories,
  }) async {
    emit(PoisLoading());
    try {
      final poisList = await amadeusRepository.getPointsOfInterest(
        location: location,
        categoriesList: categories,
      );

      if (poisList.isNotEmpty) {
        return emit(PoisSuccess(poisList));
      } else {
        return emitFakeDataOnEmpty();
        // return emit(PoisEmpty());
      }
    } catch (e) {
      print(e);
      emitFakeDataOnEmpty();

      // emit(
      //   PoisFailure(
      //     e is Response
      //         ? e.reasonPhrase
      //         : e is SocketException
      //             ? e.toString()
      //             : e.toString(),
      //   ),
      // );
    }
  }

  void emitFakeDataOnEmpty() async {
    final fakeData = await AmadeusRepository(
      amadeusBaseDataProvider: AmadeusFakeDataProvider(),
    ).getPointsOfInterest(location: null);
    emit(PoisSuccess(fakeData));
  }

// @override
// Future<void> close() {
//   _geoSubscription?.cancel();
//   return super.close();
// }
}
