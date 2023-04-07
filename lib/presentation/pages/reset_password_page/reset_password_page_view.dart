import 'package:flutter/material.dart';

import '../../../utils/extensions.dart';
import '../../core/widgets/authentication/page_title.dart';
import '../../core/widgets/default_padding.dart';
import 'widgets/reset_password_form.dart';

class ResetPasswordPageView extends StatelessWidget {
  const ResetPasswordPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefaultPadding(
                child: PageTitle(
                  title: context.l10n.resetPasswordHeading,
                ),
              ),
              const SizedBox(height: 10),
              DefaultPadding(
                child: Text(
                  style: TextStyle(color: context.colors.onBackground),
                  textAlign: TextAlign.center,
                  context.l10n.resetPasswordInfo,
                ),
              ),
              const SizedBox(height: 20),
              const ResetPaswordForm(),
            ],
          ),
        ),
      ),
    );
  }
}
