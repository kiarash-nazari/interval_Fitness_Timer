import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  SharedPreferencesManager._priveteConstractor();
  SharedPreferences? _preferences;

  static final SharedPreferencesManager instance =
      SharedPreferencesManager._priveteConstractor();

  factory SharedPreferencesManager() {
    return instance;
  }
  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  //write data
  Future<void> saveInt(String key, int value) async {
    try {
      await _preferences?.setInt(key, value);
      print("$key : $value  ");
    } catch (e) {
      print("Booooz $e");
    }
  }

  //read data
  int? getInt(String key) {
    try {
      print(_preferences?.getInt(key));
      return _preferences?.getInt(key);
    } catch (e) {
      print("Get Int Error $e");
    }
    return 3;
  }

  //wrtite data lists

  Future<void> saveStringList(String key, List<String> value) async {
    try {
      await _preferences?.setStringList(key, value);
    } catch (e) {
      print("Booooz $e");
    }
  }

  //read data lists
  List<String>? getStringList(String key) {
    try {
      return _preferences?.getStringList(key);
    } catch (e) {
      print("Get Int Error $e");
    }
    return null;
  }

  //write data double
  Future<void> saveDouble(String key, double value) async {
    try {
      await _preferences?.setDouble(key, value);
    } catch (e) {
      print("Booooz $e");
    }
  }

  //read data double
  double? getDouble(String key) {
    try {
      return _preferences?.getDouble(key);
    } catch (e) {
      print(e);
    }
    return 0.0;
  }

  //write data map
  Future<void> saveMap(String key, Map<String, dynamic> value) async {
    try {
      final jsonString = json.encode(value);
      await _preferences?.setString(key, jsonString);
      // print("$key : $value");
    } catch (e) {
      print("Error saving map: $e");
    }
  }

  //read data map
  Map<String, dynamic> getMap(String key) {
    // print(_preferences?.getString(key));
    return json.decode(_preferences?.getString(key) ?? "{}");
  }

  // remove data
  Future<void> remove(String key) async {
    try {
      await _preferences?.remove(key);
    } catch (e) {
      print("Error removing key: $e");
    }
  }
}
