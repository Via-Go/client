import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../utils/extensions.dart';
import 'custom_text_form_field.dart';

class DateField extends StatefulWidget {
  const DateField({
    super.key,
  });

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  TextEditingController dateinput = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
        controller: dateinput,
        prefixIcon: Icon(Icons.calendar_today),
        hintText: context.l10n.dateOfBirth,
        readOnly: true,
        onTap: () async {
          final now = DateTime.now();
          final pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime(now.year - 18, now.month, now.day),
              firstDate: DateTime(1900),
              lastDate: DateTime.now());
          if (pickedDate != null) {
            final formattedDate =
                DateFormat('dd MMMM, yyyy').format(pickedDate);
            setState(() {
              dateinput.text =
                  formattedDate; //set output date to TextField value.
            });
          }
        });
  }
}
