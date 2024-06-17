import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static late SharedPreferences prefs;

  static Future<void> configurePrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setToken(String token) async {
    await prefs.setString('token', token);
  }

  static String? getToken() {
    return prefs.getString('token');
  }

  static Future<void> clearToken() async {
    await prefs.remove('token');
  }
}