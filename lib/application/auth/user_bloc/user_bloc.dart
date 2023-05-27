import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/auth/user.dart';
import '../../../domain/core/extensions.dart';
import '../../../infrastructure/cache_repository.dart';

part 'user_bloc.freezed.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(this._cacheRepository) : super(UserState.initial()) {
    on<AuthCheckRequested>((event, emit) async {
      emit(state.copyWith(
        isCheckingAuthStatus: some(true),
      ));

      // check token in cache? mock for now
      final accessToken = await _cacheRepository.retrieveAccessToken();

      if (accessToken.isNone()) {
        emit(state.copyWith(
          isCheckingAuthStatus: some(false),
        ));
        return;
      }

      final user = await _cacheRepository.retrieveUser();

      if (user.isNone()) {
        emit(state.copyWith(
          isCheckingAuthStatus: some(false),
          user: none(),
        ));
        return;
      }

      final _user = user.forceSome();

      emit(state.copyWith(
        isCheckingAuthStatus: some(false),
        user: some(_user),
      ));
    });

    on<LoggedIn>((event, emit) {
      emit(state.copyWith(
        user: some(event.user),
      ));
    });

    on<SignedOut>((event, emit) {
      // TODO remove token from cache
      emit(state.copyWith(
        user: none(),
      ));
    });
  }

  final CacheRepository _cacheRepository;
}
