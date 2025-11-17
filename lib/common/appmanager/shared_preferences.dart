import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class SharedPreferencesService {
  SharedPreferencesService._internal();

  // final _log = getLogger('SharedPreferencesService');

  SharedPreferences? sharedPreferences;

  static final SharedPreferencesService _instance =
      SharedPreferencesService._internal();

  factory SharedPreferencesService() => _instance;

  static SharedPreferencesService get instance => _instance;

  Future<void> initilize() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static const String keyAuthToken = 'auth_token';
  static const String userLocationToken = 'user_location';
  static const String logginKey = 'loggin';
  static const String userData = 'user';
  static const String userDataBalance = 'userBalance';
  static const String biometricKey = 'biometricKey';
  static const String found401erorr = 'found401erorr';

  final _storage = const FlutterSecureStorage();

  // Keys
  final String _emailKey = 'userEmail';
  final String _passwordKey = 'userPassword';

  // Save email and password securely
  Future<void> saveCredentials(String email, String password) async {
    await _storage.write(key: _emailKey, value: email);
    await _storage.write(key: _passwordKey, value: password);
  }

  // Retrieve email and password
  Future<Map<String, String?>> getCredentials() async {
    String? email = await _storage.read(key: _emailKey);
    String? password = await _storage.read(key: _passwordKey);
    return {'email': email, 'password': password};
  }

  // Clear stored credentials
  Future<void> clearCredentials() async {
    await _storage.delete(key: _emailKey);
    await _storage.delete(key: _passwordKey);
  }

  // Check if user is logged in
  Future<bool> isLogIn() async {
    String? email = await _storage.read(key: _emailKey);
    return email != null;
  }

  String get authToken => sharedPreferences?.getString(keyAuthToken) ?? '';
  String get userLocation =>
      sharedPreferences?.getString(userLocationToken) ?? '';
  bool get isLoggedIn => sharedPreferences?.getBool(logginKey) ?? false;

  bool get setBiometric => sharedPreferences?.getBool(biometricKey) ?? false;
  set setBiometric(bool enable) =>
      sharedPreferences?.setBool(biometricKey, enable);
  bool get isFound401erorr =>
      sharedPreferences?.getBool(found401erorr) ?? false;

  set isFound401erorr(bool login) =>
      sharedPreferences?.setBool(found401erorr, login);

  Map<String, dynamic> get usersData {
    final userDataString = sharedPreferences?.getString(userData);
    if (userDataString != null && userDataString.isNotEmpty) {
      return json.decode(userDataString);
    }
    return {};
  }

  Map<String, dynamic> get usersDataBalance {
    final userDatainfo = sharedPreferences?.getString(userDataBalance);
    if (userDatainfo != null && userDatainfo.isNotEmpty) {
      return json.decode(userDatainfo);
    }
    return {};
  }

  set isLoggedIn(bool logging) =>
      sharedPreferences?.setBool(logginKey, logging);
  set userLocation(String locate) =>
      sharedPreferences?.setString(userLocationToken, locate);
  set authToken(String authToken) =>
      sharedPreferences?.setString(keyAuthToken, authToken);
  set usersData(Map<String, dynamic>? map) =>
      sharedPreferences?.setString(userData, json.encode(map));
  set usersDataBalance(Map<String, dynamic>? map) =>
      sharedPreferences?.setString(userDataBalance, json.encode(map));

  Future<bool> logOut() async {
    await sharedPreferences!.clear();
    await sharedPreferences?.reload();
    await clearCredentials();
    // try {
    //   final cacheDir = await getTemporaryDirectory();
    //   if (cacheDir.existsSync()) {
    //     cacheDir.deleteSync(recursive: true);
    //   }
    //   final appDir = await getApplicationSupportDirectory();
    //   if (appDir.existsSync()) {
    //     appDir.deleteSync(recursive: true);
    //   }
    // } catch (e) {
    //   _log.e("error clearing cache");
    // }
    return true;
  }
}
