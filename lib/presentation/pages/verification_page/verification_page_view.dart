import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

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
            children: [
              DefaultPadding(
                child: PageTitle(
                  title: context.l10n.verifyEmailHeading,
                ),
              ),
              const SizedBox(height: 10),
              DefaultPadding(
                child: Text(
                  style: TextStyle(color: context.colors.onBackground),
                  textAlign: TextAlign.center,
                  context.l10n.verifyEmailInfo,
                ),
              ),
              DefaultPadding(
                child: Icon(
                  Icons.mail_outline,
                  color: context.colors.primary,
                  size: 300,
                ),
              ),
              DefaultPadding(
                child: TextButton(
                  onPressed: () => context.router.push(const FillDataRoute()),
                  child: Text(context.l10n.verifyEmailResend),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
