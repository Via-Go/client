import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/auth/sign_in_form_bloc/sign_in_form_bloc.dart';
import '../../../domain/auth/auth_failure.dart';
import '../../../utils/extensions.dart';
import '../../core/widgets/authentication/app_logo.dart';
import '../../core/widgets/authentication/page_title.dart';
import '../../core/widgets/default_padding.dart';
import 'widgets/auth_snackbar.dart';
import 'widgets/sign_in_form.dart';

class LoginPageView extends StatelessWidget {
  const LoginPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: BlocConsumer<SignInFormBloc, SignInFormState>(
          listenWhen: (previous, current) {
            if (previous.authResult.isRight() && current.authResult.isLeft()) {
              return true;
            }
            return false;
          },
          listener: (context, state) {
            var snackBarContent = '';

            // I do not like this approach, but I don't know how to do it better.
            // It seems kinda ugly but maybe
            // TODO - find a better way to do this, replace raw strings with l10n
            state.authResult.fold(
              (failure) {
                failure.map(
                  cancelledByUser: (_) => snackBarContent =
                      'You have canceled the sign in process.',
                  serverError: (_) => snackBarContent = 'Server error.',
                  emailAlreadyInUse: (_) =>
                      snackBarContent = 'Email already in use.',
                  invalidEmailOrPassword: (_) =>
                      snackBarContent = 'Invalid email or password.',
                );

                ScaffoldMessenger.of(context).showSnackBar(
                  authSnackBar(content: snackBarContent),
                );
              },
              (r) => null,
            );
          },
          builder: (context, state) {
            if (state.isSubmitting) {
              return const Center(child: CircularProgressIndicator());
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AppLogo(),
                DefaultPadding(
                  child: PageTitle(title: context.l10n.authLoginHeading),
                ),
                const SizedBox(height: 20),
                const SignInForm(),
              ],
            );
          },
        ),
      ),
    );
  }
}
