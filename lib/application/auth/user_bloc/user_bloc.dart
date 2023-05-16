import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/auth/user.dart';

part 'user_event.dart';

part 'user_state.dart';

part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState.initial()) {
    on<AuthCheckRequested>((event, emit) {
      emit(state.copyWith(
        isCheckingAuthStatus: some(true),
      ));

      // check token in cache? mock for now
      final token = DateTime.now().second % 2 == 0 ? some('token') : none();
      if (token.isNone()) {
        emit(state.copyWith(
          isCheckingAuthStatus: some(false),
        ));
        return;
      }

      // <TODO> fetch user
      const user = User(
        id: 'id',
        username: 'username',
        email: 'email',
      );
      emit(state.copyWith(
        user: some(user),
        isCheckingAuthStatus: some(false),
      ));
    });

    on<LoggedIn>((event, emit) {
      emit(state.copyWith(
        user: some(event.user),
      ));
    });

    on<SignedOut>((event, emit){
      // TODO remove token from cache
      emit(state.copyWith(
        user: none(),
      ));
    });
  }
}
