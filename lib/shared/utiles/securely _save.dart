import 'package:flutter_secure_storage/flutter_secure_storage.dart';

AndroidOptions _getAndroidOptions() => AndroidOptions();
final storage = FlutterSecureStorage();

// Save refresh token
Future<void> saveRefreshToken(String token) async {
  await storage.write(key: 'refresh_token', value: token);
}

// Retrieve refresh token
Future<String?> getRefreshToken() async {
  return await storage.read(key: 'refresh_token');
}

// Delete refresh token
Future<void> deleteRefreshToken() async {
  // Corrected function name
  await storage.delete(key: 'refresh_token');
}

// Save access token
Future<void> saveAccessToken(String token) async {
  await storage.write(key: 'access_token', value: token);
}

// Retrieve access token
Future<String?> getAccessToken() async {
  return await storage.read(key: 'access_token')??"";
}

// Delete access token
Future<void> deleteAccessToken() async {
  await storage.delete(key: 'access_token');
}
