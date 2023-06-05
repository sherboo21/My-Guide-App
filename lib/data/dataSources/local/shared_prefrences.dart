import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;

class StartPrefs {
  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  // set user token value //

  static Future<bool> setUserToken(value) async {
    return await prefs.setString('user_token', value);
  }

  static String getUserToken() {
    return prefs.getString('user_token') ?? '';
  }

  // set login value //

  static Future<bool> setLoginValue(value) async {
    return await prefs.setBool('is_login', value);
  }

  static bool getLoginValue() {
    return prefs.getBool('is_login') ?? false;
  }

  // set onBoarding value //

  static Future<bool> setOnBoardingValue(value) async {
    return await prefs.setBool('is_onBoarding', value);
  }

  static bool getOnBoardingValue() {
    return prefs.getBool('is_onBoarding') ?? false;
  }

  // set user id value //

  static Future<bool> setUserId(value) async {
    return await prefs.setInt('user_id', value);
  }

  static int getUserId() {
    return prefs.getInt('user_id') ?? 0;
  }

  // set fcm token value //

  static Future<bool> setFcmToken(value) async {
    return await prefs.setString('fcm_token', value);
  }

  static String getFcmToken() {
    return prefs.getString('fcm_token') ?? '';
  }

  // set user type value //

  static Future<bool> setUserTypeValue(value) async {
    return await prefs.setString('user_type_value', value);
  }

  static String getUserTypeValue() {
    return prefs.getString('user_type_value') ?? '';
  }

  // set theme value //

  static Future<bool> setThemeValue(value) async {
    return await prefs.setBool('theme_value', value);
  }

  static bool getThemeValue() {
    return prefs.getBool('theme_value') ?? false;
  }

  // set user lat value //

  static Future<bool> setUserLatValue(value) async {
    return await prefs.setString('user_lat_value', value);
  }

  static String getUserLatValue() {
    return prefs.getString('user_lat_value') ?? '';
  }

  // set user long value //

  static Future<bool> setUserLongValue(value) async {
    return await prefs.setString('user_long_value', value);
  }

  static String getUserLongValue() {
    return prefs.getString('user_long_value') ?? '';
  }
}
