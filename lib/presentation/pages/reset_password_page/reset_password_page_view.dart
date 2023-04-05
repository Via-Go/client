import 'package:flutter/material.dart';

import '../../../utils/extensions.dart';
import '../../core/widgets/authentication/form/text_fields/email_form_field.dart';
import '../../core/widgets/authentication/page_title.dart';
import '../../core/widgets/default_padding.dart';

class ResetPasswordPageView extends StatelessWidget {
  const ResetPasswordPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefaultPadding(
                child: PageTitle(
                  title: context.l10n.resetPasswordHeading,
                ),
              ),
              DefaultPadding(
                child: Text(
                  style: TextStyle(color: context.colors.onBackground),
                  textAlign: TextAlign.center,
                  context.l10n.resetPasswordInfo,
                ),
              ),
              const DefaultPadding(
                child: EmailFormField(),
              ),
              TextButton(
                onPressed: () {},
                child: Text(context.l10n.resetPasswordSubmit),
              )
            ],
          ),
        ),
      ),
    );
  }
}
