part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.authCheckRequested() = AuthCheckRequested;

  const factory UserEvent.signedOut() = SignedOut;

  const factory UserEvent.loggedIn(User user) = LoggedIn;
}
