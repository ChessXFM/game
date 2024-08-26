//Singleton Design Pattern
import 'package:audioplayers/audioplayers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late final AudioCache playerCache;
  static late final AudioPlayer player;
  static late final SharedPreferences _sharedpreferences;
  static Future<void> init() async {
    _sharedpreferences = await SharedPreferences.getInstance();
    player = AudioPlayer();
  }

  static void setString(String key, String value) {
    _sharedpreferences.setString(key, value);
  }

  static String? getString(String key) => _sharedpreferences.getString(key);

  static void setInt(String key, int value) {
    _sharedpreferences.setInt(key, value);
  }

  static int? getInt(String key) => _sharedpreferences.getInt(key);
}
