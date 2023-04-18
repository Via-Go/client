import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_repository/users_repository.dart';

import '../../../application/auth/sign_in_form_bloc/sign_in_form_bloc.dart';
import 'login_page_view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInFormBloc(context.read<UsersRepository>()),
      child: const LoginPageView(),
    );
  }
}
