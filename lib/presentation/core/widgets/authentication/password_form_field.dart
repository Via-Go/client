import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../utils/extensions.dart';
import 'custom_text_form_field.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({
    super.key,
    this.forgotPassword = false,
  });
  final bool forgotPassword;

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('forgotPassword', forgotPassword));
  }
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CustomTextFormField(
          hintText: context.l10n.authPassword,
          keyboardType: TextInputType.visiblePassword,
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: IconButton(
            onPressed: () => setState(() => _obscureText = !_obscureText),
            icon: _obscureText
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility),
          ),
          obscureText: _obscureText,
        ),
        if (widget.forgotPassword)
          TextButton(
              onPressed: () {},
              child: Text(
                context.l10n.authForgotPassword,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ))
      ],
    );
  }
}
