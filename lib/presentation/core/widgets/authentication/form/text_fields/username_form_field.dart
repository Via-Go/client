import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../application/auth/sign_in_form_bloc/sign_in_form_bloc.dart';
import '../../../../../../utils/extensions.dart';
import '../../../../constants/decorations.dart';

class UsernameFormField extends StatelessWidget {
  const UsernameFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: getInputDecoration(
        prefixIcon: const Icon(Icons.person),
        hintText: 'Username',
      ),
      keyboardType: TextInputType.name,
      onChanged: (value) {
        context
            .read<SignInFormBloc>()
            .add(SignInFormEvent.usernameChanged(value));
      },
      validator: (_) =>
          context.read<SignInFormBloc>().state.username.value.fold(
                (f) => f.maybeMap(
                  invalidUsername: (_) => context.l10n.formInvalidUsername,
                  orElse: () => null,
                ),
                (_) => null,
              ),
    );
  }
}
