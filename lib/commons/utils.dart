import 'dart:async' show Future;

import 'package:shared_preferences/shared_preferences.dart';
import 'package:work_samurai/models/api_models/bank_detail/bank_detail_response.dart';
import 'package:work_samurai/models/api_models/login_screen/login_response.dart';
import 'package:work_samurai/res/strings.dart';

class PreferenceUtils {
  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences _prefsInstance;

  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance;
  }

  static String getString(String key, [String defValue]) {
    return _prefsInstance.getString(key) ?? defValue ?? "";
  }

  static bool getBoolean(String key, [String defValue]) {
    return _prefsInstance.getBool(key) ?? defValue ?? false;
  }

  static Future<bool> setString(String key, String value) async {
    var prefs = await _instance;
    return prefs?.setString(key, value) ?? Future.value(null);
  }

  static Future<bool> setBool(String key, bool value) async {
    var prefs = await _instance;
    return prefs?.setBool(key, value) ?? Future.value(false);
  }

  static Future setLoginResponse(LoginResponse loginResponse) async {
    var prefs = await _instance;

    prefs.setBool(Strings.IS_LOGGED_IN, true);

    prefs.setString(Strings.ACCESS_TOKEN, loginResponse.accessToken);
    prefs.setString(Strings.REFRESH_TOKEN, loginResponse.refreshToken);
    prefs.setString(Strings.ACCESS_EXPIRY, loginResponse.accessExpiry);
    prefs.setString(Strings.REFRESH_EXPIRY, loginResponse.refreshExpiry);
    prefs.setInt(Strings.TOKEN_RESPONSE, loginResponse.tokenResponse);
  }

  static Future setBankUpdateResponse(BankDetailResponse bankDetailResponse) async {
    var prefs = await _instance;

    prefs.setString(Strings.ACCOUNT_NAME, bankDetailResponse.data.holderName);
    prefs.setString(Strings.ACCOUNT_Number, bankDetailResponse.data.accountNumber);
    prefs.setString(Strings.BSB_Number, bankDetailResponse.data.bsb);
  }

  static Future setUserData(String userData) async {
    var prefs = await _instance;

    prefs.setString(Strings.USER_DATA, userData);
  }

  static Future<bool> setInt(String key, int value) async {
    var prefs = await _instance;

    return prefs?.setInt(key, value) ?? Future.value(null);
  }

  static int getInt(String key, [int defValue]) {
    return _prefsInstance.getInt(key) ?? defValue ?? 0;
  }

  static bool getBool(String key, [bool defValue]) {
    return _prefsInstance.getBool(key) ?? defValue ?? false;
  }

  static void reset() {
    _prefsInstance.clear();
  }
}
