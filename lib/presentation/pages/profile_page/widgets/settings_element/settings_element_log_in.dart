import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../../router/router.dart';

import 'settings_element_core.dart';

class SettingsElementLogIn extends StatelessWidget {
  const SettingsElementLogIn({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return SettingsElementCore(
        title: title, onTap: () => {context.router.push(const LoginRoute())});
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('title', title));
  }
}
