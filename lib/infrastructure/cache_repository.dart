import 'package:hive_flutter/hive_flutter.dart';

import '../domain/cache/access_token.dart';
import '../domain/cache/cache_repository_i.dart';
import '../domain/cache/refresh_token.dart';

class CacheRepository implements CacheRepositoryI {
  @override
  Future<void> deleteToken(String key) {
    // TODO: implement deleteAuthData
    throw UnimplementedError();
  }

  @override
  Future<void> init() async {
    await Hive.initFlutter();

    Hive
      ..registerAdapter(AccessTokenAdapter())
      ..registerAdapter(RefreshTokenAdapter());
  }

  @override
  Future<void> saveAccessToken(AccessToken token) async {
    final box = await Hive.openBox<AccessToken>('access_tokens');
    await box.put('access_token', token);
  }

  @override
  Future<void> saveRefreshToken(RefreshToken token) async {
    final box = await Hive.openBox<RefreshToken>('refresh_tokens');
    await box.put('refresh_token', token);
  }
}
