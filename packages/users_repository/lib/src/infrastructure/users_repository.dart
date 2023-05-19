import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter/services.dart';
import 'package:grpc/grpc.dart';

import '../domain/core/typedefs.dart';
import '../domain/users/call_failure.dart';
import '../domain/users/users_repository_i.dart';
import '../gen/proto/v1/users.pbgrpc.dart';

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

class UsersRepository implements UsersRepositoryI {
  // without it, I can't close the channel, I do not know why
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
  Future<Either<CallFailure, GetUserResponse>> getUser(String username) async {
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
  Future<Either<CallFailure, UpdateUserResponse>> updateUser(String username) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

  @override
  Future<Either<CallFailure, CreateUserResponse>> createUser(
      String username, String password, String email) async {
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
  Future<Either<CallFailure, DeleteUserResponse>> deleteUser(String username) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<Either<CallFailure, LoginUserResponse>> loginUser(
      String email, String password) async {
    final channel = _createChannel();
    final client = UsersClient(channel);

    try {
      final response = await compute(
        client.loginUser,
        LoginUserRequest(
          username: email,
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
  Future<Either<CallFailure, LogoutUserResponse>> logoutUser(String id) {
    // TODO: implement logoutUser
    throw UnimplementedError();
  }
}
