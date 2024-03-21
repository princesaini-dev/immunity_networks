import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:immunity_networks/data/model/auth_data_model.dart';
import 'package:immunity_networks/presentation/utills/extentions.dart';

abstract class SecureStorage {
  final String userData = "userData";
  final String providerStorageKey = "providerStorageKey";
  final String scheduleApiKey = "scheduleApiKey";
  final String fcmToken = "fcmToken";
  final String routerConnectionUrl = "routerConnectionUrl";
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  /// Save firebase fcm token to secure storage
  Future<void> saveFCMToken(String token) async {
    await _secureStorage.write(key: fcmToken, value: token);
    'FCM Token ::: $token'.printMessage();
  }

  /// Get firebase fcm token from secure storage
  Future<String?> getFCMToken() async {
    String? token = await _secureStorage.read(key: fcmToken);
    'FCM Token ::: $token'.printMessage();
    return token;
  }

  /// Get header data for api calls.
  Future<Map<String, String>> getHeaderData() async {
    var header = <String, String>{};
    header['Accept'] = 'application/json';
    header['Content-Type'] = 'application/json';
    final user = await getAuthenticationInfo();
    if (user != null) {
      header['Authorization'] = 'Bearer ${user.token}';
    }
    return header;
  }

  /// Save user login info after login and sign up
  Future<bool> saveAuthenticationInfo(AuthDataModel response) async {
    await _secureStorage.write(
        key: userData, value: jsonEncode(response.toJson()));
    return true;
  }

  /// Clear storage data when user logout
  Future<bool> clearStorage() async {
    await _secureStorage.delete(key: userData);
    return true;
  }

  /// Get user authentication data
  Future<AuthDataModel?> getAuthenticationInfo() async {
    String? json = await _secureStorage.read(key: userData);
    if (json == null) {
      return null;
    }
    final Map<String, dynamic> object = jsonDecode(json);
    return AuthDataModel.fromJson(object);
  }
}
