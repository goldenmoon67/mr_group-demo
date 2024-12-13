import 'package:deeplink_project_for_mr_group/locator.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenManager {
  final FlutterSecureStorage _storage = getIt<FlutterSecureStorage>();
  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';
  static const _accessTokenExpiryKey = 'access_token_expiry';

  Future<void> saveTokens(
      String accessToken, String refreshToken, int expiry) async {
    await _storage.write(key: _accessTokenKey, value: accessToken);
    await _storage.write(key: _refreshTokenKey, value: refreshToken);
    await _storage.write(key: _accessTokenExpiryKey, value: expiry.toString());
  }

  Future<void> saveAccessToken(String token) async {
    await _storage.write(key: _accessTokenKey, value: token);
  }

  Future<String?> getAccessToken() async {
    return await _storage.read(key: _accessTokenKey);
  }

  Future<bool> isAccessTokenExpired() async {
    final expiryString = await _storage.read(key: _accessTokenExpiryKey);
    if (expiryString == null) return true;
    final expiry = int.tryParse(expiryString);
    return expiry != null && DateTime.now().millisecondsSinceEpoch > expiry;
  }

  Future<String?> getRefreshToken() async {
    return await _storage.read(key: _refreshTokenKey);
  }

  Future<void> clearTokens() async {
    await _storage.delete(key: _accessTokenKey);
    await _storage.delete(key: _refreshTokenKey);
    await _storage.delete(key: _accessTokenExpiryKey);
  }
}
