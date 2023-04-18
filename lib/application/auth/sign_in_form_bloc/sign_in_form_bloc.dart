import 'package:bloc/bloc.dart';
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
        emailAddress: EmailAddress(event.password),
      ));
    });
  }

  final UsersRepositoryI _usersRepository;
}
