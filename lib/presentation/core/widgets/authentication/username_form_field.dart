import 'package:flutter/material.dart';

import '../../../../utils/extensions.dart';
import 'custom_text_form_field.dart';

class UsernameFormField extends StatelessWidget {
  const UsernameFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: context.l10n.authUsername,
      keyboardType: TextInputType.name,
      prefixIcon: const Icon(Icons.person),
    );
  }
}
