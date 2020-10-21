import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_event.freezed.dart';

/// Usage in SettingsBloc as pattern matching with destructing.
@freezed
abstract class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.changedDeparture() = _Departure;

  const factory SettingsEvent.changedLang() = _Lang;

  const factory SettingsEvent.changedCurr() = _Curr;

  const factory SettingsEvent.changedTemp() = _Temp;

  const factory SettingsEvent.changedLengthUnit() = _LengthUnit;

  const factory SettingsEvent.changedTheme() = _Theme;
}
