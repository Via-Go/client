import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/extensions.dart';

part 'auth_failure.freezed.dart';

@freezed
class AuthFailure with _$AuthFailure {
  const factory AuthFailure.cancelledByUser() = CancelledByUser;

  const factory AuthFailure.serverError() = ServerError;

  const factory AuthFailure.emailAlreadyInUse() = EmailAlreadyInUse;

  const factory AuthFailure.invalidEmailOrPassword() = InvalidEmailOrPassword;

  const factory AuthFailure.invalidRegistrationInput() = InvalidEmail;
}

extension AuthFailureX on AuthFailure {
  String message(BuildContext context) {
    return when(
      cancelledByUser: () => context.l10n.authCancelledByUser,
      serverError: () => context.l10n.authServerError,
      emailAlreadyInUse: () => context.l10n.authEmailAlreadyInUse,
      invalidEmailOrPassword: () => context.l10n.authInvalidEmailOrPassword,
      invalidRegistrationInput: () => context.l10n.authInvalidRegistrationInput,
    );
  }
}
