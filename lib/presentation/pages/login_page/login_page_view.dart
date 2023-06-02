import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/auth/sign_in_form_bloc/sign_in_form_bloc.dart';
import '../../../domain/auth/auth_failure.dart';
import '../../../domain/core/extensions.dart';
import '../../../utils/extensions.dart';
import '../../core/widgets/authentication/app_logo.dart';
import '../../core/widgets/authentication/page_title.dart';
import '../../core/widgets/default_padding.dart';
import '../../router/router.dart';
import 'widgets/auth_snackbar.dart';
import 'widgets/sign_in_form.dart';

class LoginPageView extends StatelessWidget {
  const LoginPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SignInFormBloc, SignInFormState>(
        listenWhen: (previous, current) {
          if (previous.authResult.isNone() && current.authResult.isSome()) {
            return true;
          }

          return false;
        },
        listener: (context, state) {
          state.authResult.fold(() => null, (result) {
            if (result.isRight()) {
              context.router.popForced();
              context.router.push(const HomeRoute());
              return;
            }

            final failure = result.forceLeft();

            ScaffoldMessenger.of(context).showSnackBar(
              authSnackBar(
                content: failure.message(context),
              ),
            );
          });
        },
        builder: (context, state) {
          if (state.isSubmitting) {
            return const Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width,
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AppLogo(),
                    DefaultPadding(
                      child: PageTitle(title: context.l10n.authLoginHeading),
                    ),
                    const SizedBox(height: 20),
                    const SignInForm(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
