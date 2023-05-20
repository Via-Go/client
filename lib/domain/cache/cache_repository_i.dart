import 'auth_entry.dart';

abstract class CacheRepositoryI {
  Future<void> saveAuthData(AuthEntry authEntry);

  Future<void> deleteAuthData(String key);

  Future<void> init();
}
