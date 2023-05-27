part of 'sign_in_form_bloc.dart';

@freezed
class SignInFormState with _$SignInFormState {
  factory SignInFormState({
    required EmailAddress emailAddress,
    required Password password,
    required Username username,
    required bool showValidatorMessages,
    required bool isSubmitting,
    required Option<Either<AuthFailure, Unit>> authResult,
  }) = _SignInFormState;

  factory SignInFormState.initial() => SignInFormState(
        emailAddress: EmailAddress(''),
        password: Password(''),
        username: Username(''),
        isSubmitting: false,
        showValidatorMessages: false,
        authResult: none(),
      );
}
