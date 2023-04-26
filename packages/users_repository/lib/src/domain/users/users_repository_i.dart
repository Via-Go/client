import '../core/typedefs.dart';

abstract class UsersRepositoryI {
  Future<CallResult> getUser(String username);

  Future<CallResult> updateUser(String username);

  Future<CallResult> createUser(String username, String password, String email);

  Future<CallResult> deleteUser(String username);

  Future<CallResult> loginUser(String email, String password);

  Future<CallResult> logoutUser(String id);
}
