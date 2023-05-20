import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/auth/sign_in_form_bloc/sign_in_form_bloc.dart';
import '../../../../utils/extensions.dart';

import '../../../core/widgets/authentication/form/form_submit_buton.dart';
import '../../../core/widgets/authentication/form/switch_form_button.dart';
import '../../../core/widgets/authentication/form/text_fields/email_form_field.dart';
import '../../../core/widgets/authentication/form/text_fields/password_form_field.dart';
import '../../../core/widgets/authentication/form/text_fields/username_form_field.dart';
import '../../../core/widgets/default_padding.dart';
import '../../../router/router.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const DefaultPadding(
            child: UsernameFormField(),
          ),
          const DefaultPadding(
            child: EmailFormField(),
          ),
          const DefaultPadding(
            child: PasswordFormField(),
          ),
          const SizedBox(
            height: 20,
          ),
          DefaultPadding(
            child: FormSubmitButton(
              onPressed: () => context.read<SignInFormBloc>().add(
                    const SignUpPressed(),
                  ),
              buttonText: context.l10n.authSignUp,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SwitchFormButton(
            leadingText: context.l10n.authHaveAccount,
            buttonText: context.l10n.authSignIn,
            route: const LoginRoute(),
          )
        ],
      ),
    );
  }
}
