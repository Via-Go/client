import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import '../../../application/auth/user_bloc/user_bloc.dart';
import '../../../gen/assets.gen.dart';

import '../../router/router.dart';

class SplashPageView extends StatelessWidget {
  const SplashPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state.isCheckingAuthStatus.isNone()) {
          return;
        }
        final isChecking = state.isCheckingAuthStatus.getOrElse(() => false);
        if (isChecking) {
          return;
        }

        if (state.user.isSome()) {
          context.router.replace(const HomeRoute());
        } else {
          context.router.replace(const LoginRoute());
        }
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xffC7AEAE),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Assets.images.splashScreen.image(
              fit: BoxFit.fill,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
        ),
      ),
    );
  }
}
