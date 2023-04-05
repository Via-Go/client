import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../../../utils/extensions.dart';
import 'custom_dropdown_button_form_field.dart';

class GenderDropdown extends StatefulWidget {
  const GenderDropdown({super.key});

  @override
  State<GenderDropdown> createState() => _GenderDropdownState();
}

class _GenderDropdownState extends State<GenderDropdown> {
  bool male = true;
  @override
  Widget build(BuildContext context) {
    return CustomDropdownButtonFormField(
      items: [context.l10n.genderMale, context.l10n.genderFemale],
      prefixIcon: male ? const Icon(Icons.male) : const Icon(Icons.female),
      onChanged: (el) {
        setState(() {
          male = el == context.l10n.genderMale;
        });
      },
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('male', male));
  }
}
