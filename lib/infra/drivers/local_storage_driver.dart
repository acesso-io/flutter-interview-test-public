import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageDriver {
  const LocalStorageDriver();

  Future<bool?> getLocalBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  Future<bool> saveLocalBool(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setBool(key, value);
  }
}
