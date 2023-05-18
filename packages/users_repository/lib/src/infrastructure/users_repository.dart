import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:grpc/grpc.dart';

import '../domain/core/typedefs.dart';
import '../domain/users/call_failure.dart';
import '../domain/users/users_repository_i.dart';
import '../gen/proto/v1/users.pbgrpc.dart';

class UsersRepository implements UsersRepositoryI {
  @override
  Future<Either<CallFailure, GetUserResponse>> getUser(String username) async {
    final client = UsersClient(channel);

    try {
      final response = await client.getUser(
        GetUserRequest()..username = username,
      );

      await channel.shutdown();
      return right(response);
    } on GrpcError catch (err) {
      if (kDebugMode) {
        debugPrint(err.toString());
      }
      await channel.shutdown();
      return left(const CallFailure.serverError());
    }
  }

  @override
  Future<Either<CallFailure, UpdateUserResponse>> updateUser(String username) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

  @override
  Future<Either<CallFailure, CreateUserResponse>> createUser(
      String username, String password, String email) async {
    final client = UsersClient(channel);

    try {
      final response = await client.createUser(
        CreateUserRequest(
          username: username,
          password: password,
          email: email,
        ),
      );

      await channel.shutdown();
      return right(response);
    } on GrpcError catch (err) {
      if (kDebugMode) {
        debugPrint(err.toString());
      }
      await channel.shutdown();
      return left(const CallFailure.serverError());
    }
  }

  @override
  Future<Either<CallFailure, DeleteUserResponse>> deleteUser(String username) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<Either<CallFailure, LoginUserResponse>> loginUser(String email, String password) {
    // TODO: implement loginUser
    throw UnimplementedError();
  }

  @override
  Future<Either<CallFailure, LogoutUserResponse>> logoutUser(String id) {
    // TODO: implement logoutUser
    throw UnimplementedError();
  }

  @override
  ClientChannel channel = ClientChannel(
    '192.168.0.100',
    port: 50051,
    options: ChannelOptions(
      credentials: const ChannelCredentials.insecure(),
      codecRegistry:
          CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
    ),
  );
}
