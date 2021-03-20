import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:virtual_traveller_flutter/blocs/destination/geo/geo_cubit.dart';
import 'package:virtual_traveller_flutter/data/models/location.dart';
import 'package:virtual_traveller_flutter/data/models/safety_rate.dart';
import 'package:virtual_traveller_flutter/data/repositories/amadeus_repository.dart';

part 'safety_rate_state.dart';

class SafetyRateCubit extends Cubit<SafetyRateState> {
  // StreamSubscription _geoSubscription;

  SafetyRateCubit({
    required this.geoCubit,
    required this.amadeusRepository,
  }) : super(SafetyRateInitial()) {
    // _geoSubscription = geoCubit.listen((geoState) {
    //   if (geoState is GeoSuccess) {
    //     final geoCodes = geoState.geoData?.geoCode;
    //     fetchSafetyRating(
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

  void fetchSafetyRating({required Location location}) async {
    try {
      final safetyRatesList = await amadeusRepository.getSafePlace(location);
      final score = safetyRatesList.safetyScores.overall;
      final safetyTextResult = _getSafetyResult(score);

      return emit(SafetyRateSuccess(safetyTextResult));
    } catch (e) {
      print(e);

      final errorMsg = e is Response ? e.reasonPhrase ?? '' : e.toString();
      emit(SafetyRateFailure('Could not fetch safety data:\n$errorMsg'));
    }
  }

  /// See [SafetyRate] on how it is calculated.
  _SafetyResult _getSafetyResult(int score) {
    if (score == -1) {
      return _SafetyResult('unknown', Colors.grey);
    }

    if (score <= 12) {
      return _SafetyResult('very safe', Colors.green);
    }

    if (score <= 28) {
      return _SafetyResult('safe', Colors.teal[300]!);
    }

    if (score <= 43) {
      return _SafetyResult('quite safe', Colors.orangeAccent);
    }

    if (score <= 58) {
      return _SafetyResult('neutral', Colors.grey);
    }

    if (score <= 73) {
      return _SafetyResult('quite dangerous', Colors.red[200]!);
    }

    if (score <= 88) {
      return _SafetyResult('dangerous', Colors.redAccent[100]!);
    }

    return _SafetyResult('very dangerous', Colors.red);
  }

// @override
// Future<void> close() {
//   _geoSubscription?.cancel();
//   return super.close();
// }
}

class _SafetyResult extends Equatable {
  const _SafetyResult(this.text, this.color);

  final String text;
  final Color color;

  @override
  List<Object?> get props => [text, color];
}
