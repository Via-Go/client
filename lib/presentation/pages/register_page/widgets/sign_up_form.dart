import 'package:flutter/material.dart';

import '../../../../utils/extensions.dart';

import '../../../core/widgets/authentication/form/ex_form.dart';
import '../../../core/widgets/default_padding.dart';
import '../../../router/router.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(children: [
        const DefaultPadding(
          child: EmailFormField(),
        ),
        const SizedBox(
          height: 12,
        ),
        DefaultPadding(
          child: FormSubmitButton(
            buttonText: context.l10n.authSignUp,
          ),
        ),
        const SizedBox(
          height: 36,
        ),
        SwitchFormButton(
          leadingText: context.l10n.authHaveAccount,
          buttonText: context.l10n.authSignIn,
          route: const LoginRoute(),
        )
      ]),
    );
  }
}
