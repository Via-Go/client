import 'package:hive_flutter/hive_flutter.dart';

import '../domain/cache/auth_entry.dart';
import '../domain/cache/cache_repository_i.dart';

class CacheRepository implements CacheRepositoryI {
  @override
  Future<void> deleteAuthData(String key) {
    // TODO: implement deleteAuthData
    throw UnimplementedError();
  }

  @override
  Future<void> saveAuthData(AuthEntry authEntry) {
    // TODO: implement saveAuthData
    throw UnimplementedError();
  }

  @override
  Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox<AuthEntry>('auth');
  }
}
