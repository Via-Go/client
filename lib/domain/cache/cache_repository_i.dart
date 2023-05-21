import 'package:fpdart/fpdart.dart';
import 'package:users_repository/users_repository.dart';

import '../auth/user.dart';
import 'access_token.dart';
import 'refresh_token.dart';

abstract class CacheRepositoryI {
  Future<void> saveAccessToken(AccessToken token);

  Future<void> saveRefreshToken(RefreshToken token);

  Future<void> saveTokens({
    required AccessToken accessToken,
    required RefreshToken refreshToken,
  });

  Future<Option<AccessToken>> retrieveAccessToken();

  Future<Option<RefreshToken>> retrieveRefreshToken();

  Future<void> saveUserFromDTO(UserDTO userDTO);

  Future<Option<User>> retrieveUser();

  Future<void> deleteToken(String key);

  void initAdapters();
}
