import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zeepalm_assessment/src/core/local/shared_preference_repository.dart';
import 'package:zeepalm_assessment/src/core/local/shared_preferences_provider.dart';

abstract interface class SharedPrefService {
  Future<bool> setAccessToken(String token);

  String? get accessToken;

  Future<void> setIsFirstTime(bool value);

  bool getIsFirstTime();

  Future<void> saveUsername(String username);

  String? get username;

  Future<void> saveUserRole(String role);

  String get roleOfUser;

  Future<bool> clearAllData();

  Future<void> saveHeaderCookie(String headerCookie);

  String get getHeaderCookie;

  Future<void> saveUserId(String userId);

  String get getUserId;

  Future<void> saveUserType(String userType);

  String get getUserType;

  Future<void> removeUserType(String userType);

  Future<void> saveCardHolderName(String name);

  Future<void> saveCardNumber(String number);

  Future<void> saveCvv(String cvv);

  Future<void> saveExpiry(String expiry);

  Future<void> removeCardHolderName(String name);

  Future<void> removeCardNumber(String number);

  Future<void> removeCvv(String cvv);

  Future<void> removeExpiry(String expiry);

  String get getCardHolderName;

  String get getCardNumber;

  String get getCvv;

  String get getExpiry;

  Future<void> saveTagProgress(String value);

  String get getTagProgress;
}

final localDataProvider = Provider<SharedPrefService>(
  (ref) => SharedPreferencesService(ref.read(preferencesProvider)),
);
