import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/auth/sign_in_form_bloc/sign_in_form_bloc.dart';
import '../../../domain/auth/auth_failure.dart';
import '../../../domain/core/extensions.dart';
import '../../../utils/extensions.dart';
import '../../core/widgets/authentication/app_logo.dart';
import '../../core/widgets/authentication/page_title.dart';
import '../../core/widgets/default_padding.dart';
import 'widgets/auth_snackbar.dart';
import 'widgets/sign_in_form.dart';
import '../../../domain/auth/auth_failure.dart';

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
            if (state.authResult.isRight()) {
              return;
            }

            final failure = state.authResult.forceLeft();

            ScaffoldMessenger.of(context).showSnackBar(
              authSnackBar(
                content: failure.message,
              ),
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
