import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtual_traveller_flutter/consts/shared_prefs_keys.dart';

class SettingsPrefs {
  SettingsPrefs(this._sharedPrefs);

  final SharedPreferences _sharedPrefs;

  void setDeparture(String value) {
    _sharedPrefs.setString(SettingsKeys.departure, value);
  }

  String get departure {
    return _sharedPrefs.getString(SettingsKeys.departure) ?? 'Boston,BOS';
  }

  void setLanguage(String value) {
    _sharedPrefs.setString(SettingsKeys.lang, value);
  }

  String get language {
    return _sharedPrefs.getString(SettingsKeys.lang) ?? 'en-US';
  }

  void setCurrency(String value) {
    _sharedPrefs.setString(SettingsKeys.curr, value);
  }

  String get currency {
    return _sharedPrefs.getString(SettingsKeys.curr) ?? 'EUR';
  }

  void setTemperature(String value) {
    _sharedPrefs.setString(SettingsKeys.temp, value);
  }

  String get temperature {
    return _sharedPrefs.getString(SettingsKeys.temp) ?? 'Celsius';
  }

  void setLengthUnit(String value) {
    _sharedPrefs.setString(SettingsKeys.lengthUnit, value);
  }

  String get lengthUnit {
    return _sharedPrefs.getString(SettingsKeys.lengthUnit) ?? 'km';
  }

  void setTheme(String value) {
    _sharedPrefs.setString(SettingsKeys.theme, value);
  }

  String get theme {
    return _sharedPrefs.getString(SettingsKeys.theme) ?? 'darkBlue';
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
