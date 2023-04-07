import 'package:flutter/material.dart';

import '../../../../utils/extensions.dart';
import '../../../core/widgets/authentication/form/text_fields/email_form_field.dart';
import '../../../core/widgets/default_padding.dart';

class ResetPaswordForm extends StatelessWidget {
  const ResetPaswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const DefaultPadding(
            child: EmailFormField(),
          ),
          const SizedBox(height: 20),
          DefaultPadding(
            child: TextButton(
              onPressed: () {},
              child: Text(context.l10n.resetPasswordSubmit),
            ),
          )
        ],
      ),
    );
  }
}
