import 'package:flutter/material.dart';

import '../../../../utils/extensions.dart';
import 'custom_text_form_field.dart';

class EmailFormField extends StatelessWidget {
  const EmailFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
        prefixIcon: const Icon(Icons.email),
        hintText: context.l10n.authEmail,
        keyboardType: TextInputType.emailAddress);
  }
}
