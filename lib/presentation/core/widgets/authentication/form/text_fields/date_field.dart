import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../utils/extensions.dart';
import '../../../../constants/decorations.dart';
import '../../../default_padding.dart';

class DateField extends StatefulWidget {
  const DateField({
    super.key,
  });

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  TextEditingController dateInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultPadding(
      child: TextFormField(
        decoration: getInputDecoration(
          prefixIcon: const Icon(Icons.calendar_today),
          hintText: context.l10n.dateOfBirth,
        ),
        controller: dateInput,
        readOnly: true,
        onTap: () async {
          final pickedDate = await showDatePicker(
            context: context,
            initialDate: initialDate(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );
          if (pickedDate != null) {
            final formattedDate =
                DateFormat('dd MMMM, yyyy').format(pickedDate);
            setState(() {
              dateInput.text = formattedDate;
            });
          }
        },
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty<TextEditingController>('dateinput', dateInput));
  }
}

DateTime initialDate() {
  final now = DateTime.now();

  // Laws differ from country to country, therefore this separation
  // may come in handy later, when we will want to support more countries.
  const adulteryAge = 18;

  return DateTime(now.year - adulteryAge, now.month, now.day);
}
