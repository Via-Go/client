import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    required this.greetingText,
    required this.featuresInfoText,
    Key? key,
  }) : super(key: key);

  final String greetingText;
  final String featuresInfoText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          greetingText,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Divider(
          height: 10,
        ),
        Text(
          featuresInfoText,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey.withOpacity(0.9),
          ),
        ),
      ],
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('greetingText', greetingText))
      ..add(StringProperty('featuresInfoText', featuresInfoText));
  }
}
