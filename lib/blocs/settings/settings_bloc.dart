import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:virtual_traveller_flutter/blocs/settings/settings_event.dart';

part 'settings_state.dart';

// TODO: Convert to Hydrated Bloc eventually
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  // TODO: Add initial settings (happens on app startup)
  SettingsBloc() : super(SettingsInitial());

  @override
  Stream<SettingsState> mapEventToState(
    SettingsEvent event,
  ) async* {
    // TODO: Handle SettingsChanged event (SettingsPrefs)
    if (event is SettingsEvent) {
      print(
        'SETTINGS ELEMENT CLICKED: ' +
            event.when(
              changedDeparture: () => 'departure',
              changedLang: () => 'lang',
              changedCurr: () => 'curr',
              changedTemp: () => 'temp',
              changedLengthUnit: () => 'lengthUnit',
              changedTheme: () => 'theme',
            ),
      );
    } else {
      print(event.toString());
    }
  }
}
