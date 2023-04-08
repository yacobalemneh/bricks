import 'package:flutter/material.dart';
import 'package:{{project_name.snakeCase()}}/l10n/l10n.dart';
import 'package:{{project_name.snakeCase()}}/presentation/routes.dart';
import 'package:{{project_name.snakeCase()}}/presentation/theme/theme_data.dart';


class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final goRouter = GoRouter(
    routes: appRoutes,
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.customTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerDelegate: goRouter.routerDelegate,
      routeInformationParser: goRouter.routeInformationParser,
    );
  }
}