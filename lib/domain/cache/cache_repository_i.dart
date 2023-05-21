import 'access_token.dart';
import 'refresh_token.dart';

abstract class CacheRepositoryI {
  Future<void> saveAccessToken(AccessToken token);

  Future<void> saveRefreshToken(RefreshToken token);

  Future<void> deleteToken(String key);

  Future<void> init();
}
