import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings.freezed.dart';

/// Usage in SettingsBloc as pattern matching with destructing.
@freezed
abstract class Settings with _$Settings {
  const factory Settings.departure() = _Departure;

  const factory Settings.lang() = _Lang;

  const factory Settings.curr() = _Curr;

  const factory Settings.temp() = _Temp;

  const factory Settings.lengthUnit() = _LengthUnit;

  const factory Settings.theme() = _Theme;
}
