import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:virtual_traveller_flutter/blocs/settings/settings_event.dart';

part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  // TODO: Add initial settings (happens on app startup)
  SettingsBloc() : super(SettingsInitial());

  @override
  Stream<SettingsState> mapEventToState(
      SettingsEvent event,
  ) async* {
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
