import 'package:fpdart/fpdart.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:users_repository/src/gen/proto/v1/users.pb.dart';

import '../domain/auth/user.dart';
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
  void initAdapters() {
    Hive
      ..registerAdapter(AccessTokenAdapter())
      ..registerAdapter(RefreshTokenAdapter())
      ..registerAdapter(UserAdapter());
  }

  @override
  Future<void> saveAccessToken(AccessToken token) async {
    final box = await Hive.openBox<AccessToken>(_accessTokenBox);
    await box.put(_accessTokenKey, token);
  }

  @override
  Future<void> saveRefreshToken(RefreshToken token) async {
    final box = await Hive.openBox<RefreshToken>(_refreshTokenBox);
    await box.put(_refreshTokenKey, token);
  }

  @override
  Future<Option<AccessToken>> retrieveAccessToken() async {
    final box = await Hive.openBox<AccessToken>(_accessTokenBox);

    final accessToken = box.get(_accessTokenKey);

    if (accessToken == null) {
      return none();
    }

    return some(accessToken);
  }

  @override
  Future<Option<RefreshToken>> retrieveRefreshToken() async {
    final box = await Hive.openBox<RefreshToken>(_refreshTokenBox);
    final refreshToken = box.get(_refreshTokenKey);

    if (refreshToken == null) {
      return none();
    }

    return some(refreshToken);
  }

  @override
  Future<void> saveTokens({
    required AccessToken accessToken,
    required RefreshToken refreshToken,
  }) async {
    await saveAccessToken(accessToken);
    await saveRefreshToken(refreshToken);
  }

  @override
  Future<Option<User>> retrieveUser() async {
    final box = await Hive.openBox<User>(_usersBox);

    final user = box.get(_userKey);

    if (user == null) {
      return none();
    }

    return some(user);
  }

  @override
  Future<void> saveUserFromDTO(UserDTO userDTO) async {
    final box = await Hive.openBox<User>(_usersBox);
    await box.put(_userKey, User.fromDTO(userDTO));
  }

  final String _accessTokenKey = 'access_token';

  final String _refreshTokenKey = 'refresh_token';

  final String _accessTokenBox = 'access_tokens';

  final String _refreshTokenBox = 'refresh_tokens';

  final String _usersBox = 'users';

  final String _userKey = 'user';
}
