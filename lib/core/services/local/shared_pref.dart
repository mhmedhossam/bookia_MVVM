import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late SharedPreferences prefs;
  static const String ktoken = "token";
  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static setToken(String? token) {
    if (token == null) return;
    setData(ktoken, token);
  }

  static String? getToken() {
    return getData(ktoken);
  }

  static setData(String key, dynamic value) {
    if (value is int) {
      prefs.setInt(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    } else if (value is double) {
      prefs.setDouble(key, value);
    } else if (value is String) {
      prefs.setString(key, value);
    } else if (value is List<String>) {
      prefs.setStringList(key, value);
    }
  }

  static getData(String key) {
    return prefs.get(key);
  }

  static detete(String key) {
    return prefs.remove(key);
  }
}
