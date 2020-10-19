import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtual_traveller_flutter/consts/shared_prefs_keys.dart';

class SettingsPrefs {
  SettingsPrefs(this._sharedPrefs);

  final SharedPreferences _sharedPrefs;

  void setDeparture(String value) {
    _sharedPrefs.setString(SettingsKeys.departure, value);
  }

  Future<String> get departure async {
    return await _sharedPrefs.getString(SettingsKeys.departure) ?? 'Boston,BOS';
  }

  void setLanguage(String value) {
    _sharedPrefs.setString(SettingsKeys.lang, value);
  }

  Future<String> get language async {
    return await _sharedPrefs.getString(SettingsKeys.lang) ?? 'en-US';
  }

  void setCurrency(String value) {
    _sharedPrefs.setString(SettingsKeys.curr, value);
  }

  Future<String> get currency async {
    return await _sharedPrefs.getString(SettingsKeys.curr) ?? 'EUR';
  }

  void setTemperature(String value) {
    _sharedPrefs.setString(SettingsKeys.temp, value);
  }

  Future<String> get temperature async {
    return await _sharedPrefs.getString(SettingsKeys.temp) ?? 'Celsius';
  }

  void setLengthUnit(String value) {
    _sharedPrefs.setString(SettingsKeys.lengthUnit, value);
  }

  Future<String> get lengthUnit async {
    return await _sharedPrefs.getString(SettingsKeys.lengthUnit) ?? 'km';
  }

  void setTheme(String value) {
    _sharedPrefs.setString(SettingsKeys.theme, value);
  }

  Future<String> get theme async {
    return await _sharedPrefs.getString(SettingsKeys.theme) ?? 'darkBlue';
  }

  void removeValue(String key) {
    _sharedPrefs.remove(key);
  }

  void resetSettings() {
    for (var key in SettingsKeys.allKeys) {
      removeValue(key);
    }
  }
}
