import 'package:flutter/material.dart';

import 'radius.dart';

InputDecoration getInputDecoration({
  String hintText = '',
  Widget? prefixIcon,
  Widget? suffixIcon,
}) {
  return InputDecoration(
    suffixIcon: suffixIcon,
    prefixIcon: prefixIcon,
    hintText: hintText,
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(formFieldRadius),
      borderSide: BorderSide.none,
    ),
  );
}
