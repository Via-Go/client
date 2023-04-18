import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../constants/decorations.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.controller,
    this.keyboardType,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.onChanged,
    this.onTap,
    this.readOnly = false,
  }) : super(key: key);

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final Function(String)? onChanged;
  final Function()? onTap;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: getInputDecoration(
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        ),
        keyboardType: keyboardType,
        onChanged: onChanged,
        readOnly: readOnly,
        onTap: onTap);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('hintText', hintText))
      ..add(DiagnosticsProperty<TextInputType>('keyboardType', keyboardType))
      ..add(DiagnosticsProperty<bool>('obscureText', obscureText))
      ..add(ObjectFlagProperty<Function(String)?>.has('onChanged', onChanged))
      ..add(DiagnosticsProperty<bool?>('readOnly', readOnly))
      ..add(
          DiagnosticsProperty<TextEditingController?>('controller', controller))
      ..add(ObjectFlagProperty<Function()?>.has('onTap', onTap));
  }
}
