import 'package:flutter/material.dart';

import 'radius.dart';

InputDecoration getInputDecoration({
  String hintText = '',
  Widget? prefixIcon,
  Widget? suffixIcon,
  bool showValidatorMessages = true,
}) {
  final outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(formFieldRadius),
      borderSide: const BorderSide(color: Color.fromARGB(255, 198, 53, 42)));
  return InputDecoration(
    suffixIcon: suffixIcon,
    prefixIcon: prefixIcon,
    hintText: hintText,
    filled: true,
    errorStyle: showValidatorMessages ? null : const TextStyle(fontSize: 0),
    focusedErrorBorder: outlineInputBorder,
    errorBorder: outlineInputBorder,
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(formFieldRadius),
        borderSide: BorderSide.none),
  );
}
