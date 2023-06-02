import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/auth/user_bloc/user_bloc.dart';
import '../../../../domain/core/extensions.dart';
import '../../../../utils/extensions.dart';
import 'header.dart';

class Greeting extends StatelessWidget {
  const Greeting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: context.screenSize.height * 0.1,
        bottom: context.screenSize.height * 0.05,
      ),
      child: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        if (state.user.isNone()) {
          return Header(
            greetingText: context.l10n.unauthorizedGreeting,
            featuresInfoText: context.l10n.unauthorizedFeaturesInfo,
          );
        }
        final user = state.user.forceSome();
        return Header(
          greetingText: 'Witaj ${user.username}',
          featuresInfoText: '',
        );
      }),
    );
  }
}
