import 'package:fpdart/fpdart.dart';
import 'package:grpc/grpc.dart';

import '../../../users_repository.dart';
import '../core/typedefs.dart';
import 'call_failure.dart';

abstract class UsersRepositoryI {
  Future<Either<CallFailure, GetUserResponse>> getUser(String username);

  Future<Either<CallFailure, UpdateUserResponse>> updateUser(String username);

  Future<Either<CallFailure, CreateUserResponse>> createUser(
      String username, String password, String email);

  Future<Either<CallFailure, DeleteUserResponse>> deleteUser(String username);

  Future<Either<CallFailure, LoginUserResponse>> loginUser(
      String email, String password);

  Future<Either<CallFailure, LogoutUserResponse>> logoutUser(String id);

  late ClientChannel channel;
}
