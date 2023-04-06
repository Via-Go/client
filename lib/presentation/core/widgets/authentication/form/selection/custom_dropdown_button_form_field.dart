import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../../../utils/extensions.dart';
import '../../../../constants/decorations.dart';
import '../../../../constants/radius.dart';

class CustomDropdownButtonFormField extends StatelessWidget {
  const CustomDropdownButtonFormField(
      {super.key, required this.items, this.prefixIcon, this.onChanged});
  final List<String> items;
  final Widget? prefixIcon;
  final Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButtonFormField(
          decoration: getInputDecoration(prefixIcon: prefixIcon),
          isExpanded: true,
          borderRadius: BorderRadius.circular(formFieldRadius),
          dropdownColor: context.colors.surfaceVariant,
          value: items.first,
          items: items
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Text(e),
                ),
              )
              .toList(),
          onChanged: onChanged ?? (_) {},
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IterableProperty<String>('items', items))
      ..add(ObjectFlagProperty<Function(String? p1)?>.has(
          'onChanged', onChanged));
  }
}