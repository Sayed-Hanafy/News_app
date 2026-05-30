import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManager {
  static final PreferencesManager _sharedPref = PreferencesManager._internal();

  factory PreferencesManager() {
    return _sharedPref;
  }

  PreferencesManager._internal();

  init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  late final SharedPreferences _sharedPreferences;

  //get
  String? getString(String key) {
    return _sharedPreferences.getString(key);
  }

  bool? getBool(String key) {
    return _sharedPreferences.getBool(key);
  }

  int? getInt(String key) {
    return _sharedPreferences.getInt(key);
  }

  double? getDouble(String key) {
    return _sharedPreferences.getDouble(key);
  }

  List<String>? getStringList(String key) {
    return _sharedPreferences.getStringList(key);
  }

  // set
  Future<bool> setString(String key, String value) async {
    return await _sharedPreferences.setString(key, value);
  }

  Future<bool> setBool(String key, bool value) async {
    return await _sharedPreferences.setBool(key, value);
  }

  Future<bool> setInt(String key, int value) async {
    return await _sharedPreferences.setInt(key, value);
  }

  Future<bool> setDouble(String key, double value) async {
    return await _sharedPreferences.setDouble(key, value);
  }

  Future<bool> setStringList(String key, List<String> value) async {
    return await _sharedPreferences.setStringList(key, value);
  }

  // remove
  Future<bool> remove(String key) {
    return _sharedPreferences.remove(key);
  }

  // clear all
  Future<bool> clear() {
    return _sharedPreferences.clear();
  }
}
