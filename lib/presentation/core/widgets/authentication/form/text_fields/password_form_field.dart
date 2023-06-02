import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../application/auth/sign_in_form_bloc/sign_in_form_bloc.dart';
import '../../../../../../utils/extensions.dart';
import '../../../../constants/decorations.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({
    super.key,
  });

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInFormBloc, SignInFormState>(
      builder: (context, state) {
        return TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: getInputDecoration(
            hintText: context.l10n.password,
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
              icon: obscure
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility),
              onPressed: () => setState(() => obscure = !obscure),
            ),
            showValidatorMessages: state.password.value.fold(
              (f) => state.showValidatorMessages,
              (_) => false,
            ),
          ),
          autocorrect: false,
          obscureText: obscure,
          onChanged: (value) => context.read<SignInFormBloc>().add(
                SignInFormEvent.passwordChanged(value),
              ),
          onEditingComplete: () => {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(context.l10n.formInvalidPasswordExplanation)),
            ),
          },
          validator: (_) =>
              context.read<SignInFormBloc>().state.password.value.fold(
                    (l) => l.maybeMap(
                      invalidPassword: (_) => context.l10n.formInvalidPassword,
                      orElse: () => null,
                    ),
                    (_) => null,
                  ),
        );
      },
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('obscure', obscure));
  }
}
