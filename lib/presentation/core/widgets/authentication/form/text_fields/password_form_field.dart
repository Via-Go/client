import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../application/auth/sign_in_form_bloc/sign_in_form_bloc.dart';
import '../../../../../../utils/extensions.dart';
import '../../../../constants/decorations.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({
    super.key,
    this.onPressed,
  });

  final Function()? onPressed;

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ObjectFlagProperty<Function()?>.has('onPressed', onPressed));
  }
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: getInputDecoration(
        hintText: context.l10n.password,
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: const Icon(Icons.remove_red_eye),
          onPressed: widget.onPressed,
        ),
      ),
      autocorrect: false,
      obscureText: true,
      onChanged: (value) => context.read<SignInFormBloc>().add(
            SignInFormEvent.passwordChanged(value),
          ),
      onEditingComplete: () => {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
                'Password should contains 8-16 characters, one uppercase and lowercase letter and one special character'),
          ),
        ),
      },
      validator: (_) =>
          context.read<SignInFormBloc>().state.password.value.fold(
                (l) => l.maybeMap(
                  invalidPassword: (_) => 'Invalid Password',
                  orElse: () => null,
                ),
                (_) => null,
              ),
    );
  }
}
