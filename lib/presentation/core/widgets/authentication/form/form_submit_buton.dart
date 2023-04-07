import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../constants/radius.dart';

class FormSubmitButton extends StatelessWidget {
  const FormSubmitButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });
  final String buttonText;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(formFieldRadius),
          ),
        ),
        onPressed: onPressed,
        child: Text(buttonText),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('buttonText', buttonText))
      ..add(ObjectFlagProperty<Function()>.has('onPressed', onPressed));
  }
}
