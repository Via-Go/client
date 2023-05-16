import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../application/auth/sign_in_form_bloc/sign_in_form_bloc.dart';
import '../../../../../../utils/extensions.dart';
import 'custom_text_form_field.dart';

class EmailFormField extends StatelessWidget {
  const EmailFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      prefixIcon: const Icon(Icons.email),
      hintText: context.l10n.email,
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        context.read<SignInFormBloc>().add(SignInFormEvent.emailChanged(value));
      },
      validator: (_) =>
          context.read<SignInFormBloc>().state.emailAddress.value.fold(
                (f) => f.maybeMap(
                  invalidEmail: (_) => 'Invalid email',
                  orElse: () => null,
                ),
                (_) => null,
              ),
    );
  }
}
