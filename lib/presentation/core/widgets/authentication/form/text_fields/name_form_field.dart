import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../../../utils/extensions.dart';
import 'custom_text_form_field.dart';

class NameFormField extends StatelessWidget {
  const NameFormField({
    super.key,
    this.firstName = true,
  });
  final bool firstName;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: firstName ? context.l10n.firstName : context.l10n.lastName,
      keyboardType: TextInputType.name,
      prefixIcon: const Icon(Icons.person),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('firstName', firstName));
  }
}
