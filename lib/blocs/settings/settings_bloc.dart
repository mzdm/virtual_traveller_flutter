import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:virtual_traveller_flutter/data/models/settings.dart';

part 'settings_event.dart';

part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  // TODO: Add initial settings (happens on app startup)
  SettingsBloc() : super(SettingsInitial());

  @override
  Stream<SettingsState> mapEventToState(
    SettingsEvent event,
  ) async* {
    if (event is SettingsChanged) {
      print(
        'SETTINGS ELEMENT CLICKED: ' +
        event.settings.when(
          departure: () => 'departure',
          lang: () => 'lang',
          curr: () => 'curr',
          temp: () => 'temp',
          lengthUnit: () => 'lengthUnit',
          theme: () => 'theme',
        ),
      );
    } else {
      print(event.toString());
    }
  }
}
