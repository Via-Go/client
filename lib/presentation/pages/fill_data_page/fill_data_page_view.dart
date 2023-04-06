import 'package:flutter/material.dart';

import '../../../utils/extensions.dart';
import '../../core/widgets/authentication/page_title.dart';
import '../../core/widgets/default_padding.dart';
import 'widgets/fill_data_form.dart';

class FillDataPageView extends StatelessWidget {
  const FillDataPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefaultPadding(
                child: PageTitle(title: context.l10n.fillDataHeading),
              ),
              const SizedBox(height: 20),
              const FillDataForm(),
            ],
          ),
        )),
      ),
    );
  }
}
