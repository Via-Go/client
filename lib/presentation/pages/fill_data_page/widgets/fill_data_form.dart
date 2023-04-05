import 'package:flutter/material.dart';

import '../../../../utils/extensions.dart';
import '../../../core/widgets/authentication/form/form_submit_buton.dart';
import '../../../core/widgets/authentication/form/selection/custom_dropdown_button_form_field.dart';
import '../../../core/widgets/authentication/form/selection/gender_dropdown.dart';
import '../../../core/widgets/authentication/form/text_fields/email_form_field.dart';
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
          child: EmailFormField(),
        ),
        DefaultPadding(
          child: GenderDropdown(),
        ),
        DefaultPadding(
          child: FormSubmitButton(
            buttonText: context.l10n.fillDataSubmit,
          ),
        ),
      ],
    ));
  }
}
