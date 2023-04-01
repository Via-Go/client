import 'package:flutter/material.dart';

import '../constants/dimensions.dart';

class DefaultPadding extends StatelessWidget {
  const DefaultPadding({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      child: child,
    );
  }
}
