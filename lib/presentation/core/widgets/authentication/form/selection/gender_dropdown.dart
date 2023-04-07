import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../../../utils/extensions.dart';
import '../../../default_padding.dart';
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

    return DefaultPadding(
      child: CustomDropdownButtonFormField(
        items: [
          context.l10n.genderMale,
          context.l10n.genderFemale,
          context.l10n.genderOther
        ],
        prefixIcon: genderPrefixIcon(context, selected),
        onChanged: (el) {
          setState(() {
            selected = el;
          });
        },
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('selected', selected));
  }
}

Widget genderPrefixIcon(BuildContext context, String? current) {
  if (current == context.l10n.genderMale) {
    return const Icon(Icons.male);
  }
  if (current == context.l10n.genderFemale) {
    return const Icon(Icons.female);
  }

  return const Icon(Icons.transgender);
}
