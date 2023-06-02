part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  factory UserState({
    required Option<User> user,
    required Option<bool> isCheckingAuthStatus,
  }) = _UserState;

  factory UserState.initial() => UserState(
        user: none(),
        isCheckingAuthStatus: none(),
      );
}
