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
}
