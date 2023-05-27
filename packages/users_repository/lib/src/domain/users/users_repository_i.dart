import 'package:fpdart/fpdart.dart';

import '../../../users_repository.dart';
import '../../gen/proto/v1/users.pbgrpc.dart';
import 'call_failure.dart';

abstract class UsersRepositoryI {
  Future<Either<CallFailure, GetUserResponse>> getUser({
    required String username,
  });

  Future<Either<CallFailure, UpdateUserResponse>> updateUser({
    required String username,
  });

  Future<Either<CallFailure, CreateUserResponse>> createUser({
    required String username,
    required String password,
    required String email,
  });

  Future<Either<CallFailure, DeleteUserResponse>> deleteUser({
    required String username,
  });

  Future<Either<CallFailure, LoginUserResponse>> loginUser({
    required String username,
    required String password,
  });

  Future<Either<CallFailure, LogoutUserResponse>> logoutUser({
    required String id,
  });
}
