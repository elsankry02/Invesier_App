import 'package:shared_preferences/shared_preferences.dart';

class CachedHelper {
  static late SharedPreferences sharedPreferences;

  static Future<void> getInstance() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<void> setString({
    required String key,
    required String value,
  }) async {
    await sharedPreferences.setString(key, value);
  }

  static String? getString({required String key}) {
    return sharedPreferences.getString(key);
  }
}
