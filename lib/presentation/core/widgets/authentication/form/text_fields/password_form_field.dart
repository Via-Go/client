import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../../../utils/extensions.dart';
import 'custom_text_form_field.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({
    super.key,
    this.onPressed,
  });
  final Function()? onPressed;

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ObjectFlagProperty<Function()?>.has('onPressed', onPressed));
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
          hintText: context.l10n.password,
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
        if (widget.onPressed != null)
          TextButton(
              onPressed: widget.onPressed,
              child: Text(
                context.l10n.authForgotPassword,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ))
      ],
    );
  }
}
