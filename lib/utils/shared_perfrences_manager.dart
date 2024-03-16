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
    await _preferences!.setInt(key, value);
  }

  //read data
  num? getInt(String key) {
    return _preferences!.getDouble(key);
  }
}
