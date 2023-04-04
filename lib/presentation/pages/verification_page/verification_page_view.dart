import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../gen/assets.gen.dart';

import '../../../utils/extensions.dart';
import '../../core/widgets/authentication/page_title.dart';
import '../../core/widgets/default_padding.dart';
import '../../router/router.dart';

class VerificationPageView extends StatelessWidget {
  const VerificationPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PageTitle(title: context.l10n.verifyEmailHeading),
            DefaultPadding(
              child: Text(
                  style: TextStyle(color: context.colors.onBackground),
                  textAlign: TextAlign.center,
                  context.l10n.verifyEmailInfo),
            ),
            Icon(
              Icons.mail_outline,
              color: context.colors.primary,
              size: 200,
            ),
            TextButton(
                onPressed: () {}, child: Text(context.l10n.verifyEmailResend))
          ],
        )),
      ),
    );
  }
}
