import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../../../utils/extensions.dart';
import '../../../../constants/decorations.dart';
import '../../../default_padding.dart';

class NameFormField extends StatelessWidget {
  const NameFormField({
    super.key,
    this.firstName = true,
  });

  final bool firstName;

  @override
  Widget build(BuildContext context) {
    return DefaultPadding(
      child: TextFormField(
        decoration: getInputDecoration(
          hintText: firstName ? context.l10n.firstName : context.l10n.lastName,
          prefixIcon: const Icon(Icons.person),
        ),
        keyboardType: TextInputType.name,
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('firstName', firstName));
  }
}
