import 'package:flutter/material.dart';

import '../../../../../../utils/extensions.dart';
import '../../../default_padding.dart';
import 'custom_dropdown_button_form_field.dart';

class DriverDropdown extends StatefulWidget {
  const DriverDropdown({super.key});

  @override
  State<DriverDropdown> createState() => _DriverDropdownState();
}

class _DriverDropdownState extends State<DriverDropdown> {
  @override
  Widget build(BuildContext context) {
    return DefaultPadding(
      child: CustomDropdownButtonFormField(
        items: [
          context.l10n.driverYes,
          context.l10n.driverNo,
        ],
        prefixIcon: const Icon(Icons.directions_car),
      ),
    );
  }
}
