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
  String? selected;
  @override
  Widget build(BuildContext context) {
    selected ??= context.l10n.genderMale;
    return CustomDropdownButtonFormField(
      items: [
        context.l10n.genderMale,
        context.l10n.genderFemale,
        context.l10n.genderOther
      ],
      prefixIcon: selected == context.l10n.genderMale
          ? const Icon(Icons.male)
          : selected == context.l10n.genderFemale
              ? const Icon(Icons.female)
              : const Icon(Icons.transgender),
      onChanged: (el) {
        setState(() {
          selected = el;
        });
      },
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('selected', selected));
  }
}
