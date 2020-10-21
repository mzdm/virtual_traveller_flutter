import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_event.freezed.dart';

/// Usage in SettingsBloc as pattern matching with destructing.
@freezed
abstract class SettingsChanged with _$SettingsChanged {
  const factory SettingsChanged.departure() = _Departure;

  const factory SettingsChanged.lang() = _Lang;

  const factory SettingsChanged.curr() = _Curr;

  const factory SettingsChanged.temp() = _Temp;

  const factory SettingsChanged.lengthUnit() = _LengthUnit;

  const factory SettingsChanged.theme() = _Theme;
}
