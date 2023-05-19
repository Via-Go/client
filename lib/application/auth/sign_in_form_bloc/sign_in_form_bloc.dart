import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:users_repository/users_repository.dart';

import '../../../domain/auth/auth_failure.dart';
import '../../../domain/auth/value_objects.dart';

part 'sign_in_form_event.dart';

part 'sign_in_form_state.dart';

part 'sign_in_form_bloc.freezed.dart';

class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  SignInFormBloc(this._usersRepository) : super(SignInFormState.initial()) {
    on<EmailChanged>((event, emit) {
      emit(state.copyWith(
        emailAddress: EmailAddress(event.email),
      ));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(
        password: Password(event.password),
      ));
    });

    on<SignInWithEmailWithPasswordPressed>((event, emit) async {
      emit(state.copyWith(
        isSubmitting: true,
      ));

      final isEmailValid = state.emailAddress.isValid();
      final isPasswordValid = state.password.isValid();

      if (!isEmailValid || !isPasswordValid) {
        emit(state.copyWith(
          authResult: left(const AuthFailure.invalidEmailOrPassword()),
          isSubmitting: false,
        ));
        return;
      }

      final result = await _usersRepository.loginUser(
        state.emailAddress.getOrCrash(),
        state.password.getOrCrash(),
      );

      emit(state.copyWith(
        isSubmitting: false,
      ));

      if (result.isLeft()) {
        emit(state.copyWith(
          authResult: left(const AuthFailure.serverError()),
        ));
        return;
      }
      emit(state.copyWith(
        authResult: right(unit),
      ));
    });
  }

  final UsersRepositoryI _usersRepository;

  @override
  void onTransition(Transition<SignInFormEvent, SignInFormState> transition) {
    super.onTransition(transition);
    debugPrint(transition.toString());
  }

  @override
  void onChange(Change<SignInFormState> change) {
    super.onChange(change);
    debugPrint(change.toString());
    debugPrint(change.currentState.toString());
    debugPrint(change.nextState.toString());
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    debugPrint(error.toString());
  }

  @override
  void onEvent(SignInFormEvent event) {
    super.onEvent(event);
    debugPrint(event.toString());
  }
}
