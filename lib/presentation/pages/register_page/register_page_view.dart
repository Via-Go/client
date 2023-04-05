import 'package:flutter/material.dart';

import '../../../utils/extensions.dart';
import '../../core/widgets/authentication/app_logo.dart';
import '../../core/widgets/authentication/page_title.dart';
import '../../core/widgets/default_padding.dart';
import 'widgets/sign_up_form.dart';

class RegisterPageView extends StatelessWidget {
  const RegisterPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppLogo(),
            DefaultPadding(
              child: PageTitle(title: context.l10n.authRegisterHeading),
            ),
            const SizedBox(height: 20),
            const SignUpForm(),
          ],
        ),
      ),
    );
  }
}
