import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:users_repository/users_repository.dart';

part 'user.freezed.dart';

@freezed
sealed class User with _$User {
  const factory User({
    required String id,
    required String username,
    required String email,
  }) = _User;

  factory User.fromDTO(UserDTO dto) {
    return User(
      id: dto.id,
      username: dto.username,
      email: dto.email,
    );
  }
}
