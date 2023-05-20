import 'package:freezed_annotation/freezed_annotation.dart';

import '../auth/user.dart';

part 'auth_entry.freezed.dart';

@freezed
sealed class AuthEntry with _$AuthEntry {
  const factory AuthEntry.userDTO({
    required User user,
  }) = UserDTO;

  const factory AuthEntry.token(String token) = Token;
}
