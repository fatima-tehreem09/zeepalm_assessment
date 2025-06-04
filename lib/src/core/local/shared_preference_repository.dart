import 'package:shared_preferences/shared_preferences.dart';

import 'local_storage_repository.dart';

class SharedPreferencesService implements SharedPrefService {
  SharedPreferencesService(this.sharedPreferences);

  final SharedPreferences sharedPreferences;

  final _tokenKey = 'access-token';
  final _isFirstTimeKey = 'is-first-time';
  final _cookiesKey = 'header-cookie-key';
  final name = 'name-user';
  final userRole = 'role-user';
  final idKey = 'id-user';
  final userTypeKey = 'type-user';
  final progressTag = 'progress-tag';
  final cardHolderName = 'card-holder-name';
  final cardNumber = 'card-number';
  final cvvKey = 'cvv';
  final expiryKey = 'expiry';

  @override
  String? get accessToken => sharedPreferences.getString(_tokenKey);

  @override
  Future<bool> setAccessToken(String token) async {
    return await sharedPreferences.setString(_tokenKey, token);
  }

  @override
  Future<void> saveUsername(String username) {
    return sharedPreferences.setString(name, username);
  }

  @override
  String? get username => sharedPreferences.getString(name);

  @override
  bool getIsFirstTime() {
    return sharedPreferences.getBool(_isFirstTimeKey) ?? true;
  }

  @override
  Future<void> setIsFirstTime(bool value) async {
    await sharedPreferences.setBool(_isFirstTimeKey, value);
  }

  @override
  Future<bool> clearAllData() async {
    return await sharedPreferences.clear();
  }

  @override
  Future<void> saveHeaderCookie(String headerCookie) async {
    await sharedPreferences.setString(_cookiesKey, headerCookie);
  }

  @override
  String get roleOfUser => sharedPreferences.getString(userRole) ?? "";

  @override
  Future<void> saveUserRole(String role) async {
    await sharedPreferences.setString(userRole, role);
  }

  @override
  String get getUserId => sharedPreferences.getString(idKey) ?? "";

  @override
  Future<void> saveUserId(String userId) {
    return sharedPreferences.setString(idKey, userId);
  }

  @override
  String get getHeaderCookie => sharedPreferences.getString(_cookiesKey) ?? "";

  @override
  String get getUserType => sharedPreferences.getString(userTypeKey) ?? "";

  @override
  Future<void> saveUserType(String userType) {
    return sharedPreferences.setString(userTypeKey, userType);
  }

  @override
  String get getTagProgress => sharedPreferences.getString(progressTag) ?? "";

  @override
  Future<void> saveTagProgress(String value) {
    return sharedPreferences.setString(progressTag, value);
  }

  @override
  Future<void> removeUserType(String userType) {
    return sharedPreferences.remove(userTypeKey);
  }

  @override
  String get getCardHolderName =>
      sharedPreferences.getString(cardHolderName) ?? "";

  @override
  String get getCardNumber => sharedPreferences.getString(cardNumber) ?? "";

  @override
  String get getCvv => sharedPreferences.getString(cvvKey) ?? "";

  @override
  String get getExpiry => sharedPreferences.getString(expiryKey) ?? "";

  @override
  Future<void> saveCardHolderName(String name) {
    return sharedPreferences.setString(cardHolderName, name);
  }

  @override
  Future<void> saveCardNumber(String number) {
    return sharedPreferences.setString(cardNumber, number);
  }

  @override
  Future<void> saveCvv(String cvv) {
    return sharedPreferences.setString(cvvKey, cvv);
  }

  @override
  Future<void> saveExpiry(String expiry) {
    return sharedPreferences.setString(expiryKey, expiry);
  }

  @override
  Future<void> removeCardHolderName(String name) {
    return sharedPreferences.remove(cardHolderName);
  }

  @override
  Future<void> removeCardNumber(String number) {
    return sharedPreferences.remove(cardNumber);
  }

  @override
  Future<void> removeCvv(String cvv) {
    return sharedPreferences.remove(cvvKey);
  }

  @override
  Future<void> removeExpiry(String expiry) {
    return sharedPreferences.remove(expiryKey);
  }
}
