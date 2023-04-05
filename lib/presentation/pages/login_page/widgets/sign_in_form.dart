import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../utils/extensions.dart';

import '../../../core/widgets/authentication/form/form_submit_buton.dart';
import '../../../core/widgets/authentication/form/switch_form_button.dart';
import '../../../core/widgets/authentication/form/text_fields/email_form_field.dart';
import '../../../core/widgets/authentication/form/text_fields/password_form_field.dart';
import '../../../core/widgets/default_padding.dart';
import '../../../router/router.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(children: [
        const DefaultPadding(
          child: EmailFormField(),
        ),
        DefaultPadding(
          child: PasswordFormField(
            onPressed: () => context.router.push(const ResetPasswordRoute()),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        DefaultPadding(
          child: FormSubmitButton(
            buttonText: context.l10n.authSignIn,
            onPressed: () {},
          ),
        ),
        const SizedBox(
          height: 36,
        ),
        SwitchFormButton(
          leadingText: context.l10n.authNoAccount,
          buttonText: context.l10n.authSignUp,
          route: const RegisterRoute(),
        )
      ]),
    );
  }
}
