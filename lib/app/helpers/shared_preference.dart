import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHelper {
  PreferenceHelper._();
  static final PreferenceHelper instance = PreferenceHelper._();

  SharedPreferences? _sharedPreferences;
  Future<SharedPreferences> get sharedPreferences async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    return _sharedPreferences!;
  }

  Future<bool> setString(String key, String value) async {
    final prefs = await sharedPreferences;
    return prefs.setString(key, value);
  }

  Future<String?> getString(String key) async {
    final prefs = await sharedPreferences;
    return prefs.getString(key);
  }
}
