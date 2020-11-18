import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:virtual_traveller_flutter/data/models/location.dart';
import 'package:virtual_traveller_flutter/data/models/safety_rate.dart';
import 'package:virtual_traveller_flutter/data/repositories/amadeus_repository.dart';

part 'safety_rate_state.dart';

class SafetyRateCubit extends Cubit<SafetyRateState> {
  SafetyRateCubit({
    @required this.amadeusRepository,
  }) : super(SafetyRateInitial());

  final AmadeusRepository amadeusRepository;

  void fetchSafetyRating({
    @required Location location,
  }) async {
    emit(SafetyRateLoading());
    try {
      await amadeusRepository.getSafePlace(location).then((safetyRate) {
        if (safetyRate != null) {
          final score = safetyRate.safetyScores?.overall;
          if (score != null) {
            final safetyTextResult = _getSafetyResult(score);
            return emit(SafetyRateSuccess(safetyTextResult));
          }
        }
        return emit(SafetyRateFailure('Could not fetch safety data'));
      });
    } catch (e) {
      print(e);
      emit(SafetyRateFailure(e is Response
          ? e.reasonPhrase
          : e is SocketException
              ? e.toString()
              : e.toString()));
    }
  }

  /// See [SafetyRate] on how it is calculated.
  _SafetyResult _getSafetyResult(int score) {
    if (score <= 12) {
      return _SafetyResult('very safe', Colors.green);
    }

    if (score <= 28) {
      return _SafetyResult('safe', Colors.teal[300]);
    }

    if (score <= 43) {
      return _SafetyResult('quite safe', Colors.orangeAccent);
    }

    if (score <= 58) {
      return _SafetyResult('neutral', Colors.grey);
    }

    if (score <= 73) {
      return _SafetyResult('quite dangerous', Colors.red[200]);
    }

    if (score <= 88) {
      return _SafetyResult('dangerous', Colors.redAccent[100]);
    }

    return _SafetyResult('very dangerous', Colors.red);
  }
}

class _SafetyResult extends Equatable {
  const _SafetyResult(this.text, this.color);

  final String text;
  final Color color;

  @override
  List<Object> get props => [text, color];
}
