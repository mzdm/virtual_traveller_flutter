import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:virtual_traveller_flutter/blocs/settings/settings_event.dart';

part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsChanged, SettingsState> {
  // TODO: Add initial settings (happens on app startup)
  SettingsBloc() : super(SettingsInitial());

  @override
  Stream<SettingsState> mapEventToState(
      SettingsChanged event,
  ) async* {
    if (event is SettingsChanged) {
      print(
        'SETTINGS ELEMENT CLICKED: ' +
        event.when(
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
