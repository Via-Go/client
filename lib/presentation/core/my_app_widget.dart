import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:users_repository/users_repository.dart';

import '../../application/auth/user_bloc/user_bloc.dart';
import '../router/router.dart';

class MyAppWidget extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => UsersRepository(),
      child: BlocProvider(
        create: (context) => UserBloc()
          ..add(
            const UserEvent.authCheckRequested(),
          ),
        child: _MyAppRouter(_appRouter),
      ),
    );
  }
}

class _MyAppRouter extends StatelessWidget {
  const _MyAppRouter(this.router, {Key? key}) : super(key: key);

  final AppRouter router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightBlueAccent,
        ),
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      title: 'Via Go',
      routerDelegate: router.delegate(),
      routeInformationParser: router.defaultRouteParser(),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('pl'),
      ],
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<AppRouter>('router', router));
  }
}
