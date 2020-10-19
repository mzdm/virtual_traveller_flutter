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

  Future<bool> containsKey(String key) async {
    return _sharedPrefs.containsKey(key);
  }

  Future<bool> removeValue(String key) async {
    return _sharedPrefs.remove(key);
  }

  Future<bool> removeAll() async {
    return _sharedPrefs.clear();
  }
}
