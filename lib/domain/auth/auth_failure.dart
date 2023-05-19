import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
class AuthFailure with _$AuthFailure {
  const factory AuthFailure.cancelledByUser() = CancelledByUser;
  const factory AuthFailure.serverError() = ServerError;
  const factory AuthFailure.emailAlreadyInUse() = EmailAlreadyInUse;
  const factory AuthFailure.invalidEmailOrPassword() = InvalidEmailOrPassword;
}

extension AuthFailureX on AuthFailure {
  String get message {
    return when(
      cancelledByUser: () => 'Cancelled',
      serverError: () => 'Server error',
      emailAlreadyInUse: () => 'Email already in use',
      invalidEmailOrPassword: () => 'Invalid email or password',
    );
  }
}
