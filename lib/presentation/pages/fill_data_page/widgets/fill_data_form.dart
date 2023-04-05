import 'package:flutter/material.dart';

import '../../../../utils/extensions.dart';
import '../../../core/widgets/authentication/form/form_submit_buton.dart';
import '../../../core/widgets/authentication/form/selection/driver_dropdown.dart';
import '../../../core/widgets/authentication/form/selection/gender_dropdown.dart';
import '../../../core/widgets/authentication/form/text_fields/date_field.dart';
import '../../../core/widgets/authentication/form/text_fields/name_form_field.dart';
import '../../../core/widgets/default_padding.dart';

class FillDataForm extends StatelessWidget {
  const FillDataForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const DefaultPadding(
            child: NameFormField(),
          ),
          const DefaultPadding(
            child: NameFormField(
              firstName: false,
            ),
          ),
          const DefaultPadding(
            child: GenderDropdown(),
          ),
          const DefaultPadding(
            child: DateField(),
          ),
          const DefaultPadding(
            child: DriverDropdown(),
          ),
          DefaultPadding(
            child: FormSubmitButton(
              buttonText: context.l10n.fillDataSubmit,
            ),
          ),
        ],
      ),
    );
  }
}
