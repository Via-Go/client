import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:grpc/grpc.dart';

import '../domain/users/call_failure.dart';
import '../domain/users/users_repository_i.dart';
import '../gen/proto/v1/users.pbgrpc.dart';

/*
class MyChannelCredentials extends ChannelCredentials {
  MyChannelCredentials({
    Uint8List? trustedRoots,
    this.certificateChain,
    this.privateKey,
    String? authority,
    BadCertificateHandler? onBadCertificate,
  }) : super.secure(
            certificates: trustedRoots,
            authority: authority,
            onBadCertificate: onBadCertificate);
  final Uint8List? certificateChain;
  final Uint8List? privateKey;

  @override
  SecurityContext get securityContext {
    final ctx = super.securityContext;
    if (certificateChain != null) {
      ctx!.useCertificateChainBytes(certificateChain as List<int>);
    }
    if (privateKey != null) {
      ctx!.usePrivateKeyBytes(privateKey as List<int>);
    }
    return ctx!;
  }
}

 */

class UsersRepository implements UsersRepositoryI {
  ClientChannel _createChannel() {
    return ClientChannel(
      '127.0.0.1',
      port: 50051,
      options: ChannelOptions(
        credentials: const ChannelCredentials.insecure(),
        codecRegistry: CodecRegistry(
          codecs: const [GzipCodec(), IdentityCodec()],
        ),
      ),
    );
  }

  @override
  Future<Either<CallFailure, GetUserResponse>> getUser({
    required String username,
  }) async {
    final channel = _createChannel();
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
  Future<Either<CallFailure, UpdateUserResponse>> updateUser({
    required String username,
  }) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

  @override
  Future<Either<CallFailure, CreateUserResponse>> createUser({
    required String username,
    required String password,
    required String email,
  }) async {
    final channel = _createChannel();
    final client = UsersClient(channel);

    try {
      final response = await compute(
        client.createUser,
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
      return left(const CallFailure.serverError());
    } finally {
      await channel.shutdown();
    }
  }

  @override
  Future<Either<CallFailure, DeleteUserResponse>> deleteUser({
    required String username,
  }) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<Either<CallFailure, LoginUserResponse>> loginUser({
    required String username,
    required String password,
  }) async {
    final channel = _createChannel();
    final client = UsersClient(channel);

    try {
      final response = await compute(
        client.loginUser,
        LoginUserRequest(
          username: username,
          password: password,
        ),
      );

      return right(response);
    } on GrpcError catch (err) {
      if (kDebugMode) {
        debugPrint(err.toString());
      }
      return left(const CallFailure.serverError());
    } finally {
      await channel.shutdown();
    }
  }

  @override
  Future<Either<CallFailure, LogoutUserResponse>> logoutUser({
    required String id,
  }) {
    // TODO: implement logoutUser
    throw UnimplementedError();
  }
}
