import 'package:flutter/material.dart';

import '../../../../utils/extensions.dart';
import '../../../core/constants/dimensions.dart';
import '../../../core/widgets/authentication/email_form_field.dart';
import '../../../core/widgets/authentication/form_submit_buton.dart';
import '../../../core/widgets/authentication/password_form_field.dart';
import '../../../core/widgets/authentication/switch_form_button.dart';
import '../../../router/router.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(children: [
        const Padding(
          padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding, vertical: verticalPadding),
          child: EmailFormField(),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding, vertical: verticalPadding),
          child: PasswordFormField(
            forgotPassword: true,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: horizontalPadding, vertical: verticalPadding),
          child: FormSubmitButton(buttonText: context.l10n.authSignIn),
        ),
        const SizedBox(
          height: 36,
        ),
        SwitchFormButton(
            leadingText: context.l10n.authNoAccount,
            buttonText: context.l10n.authSignUp,
            route: const RegisterRoute())
      ]),
    );
  }
}
