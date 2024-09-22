import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/{{first_screen.snakeCase()}}/presentation/{{first_screen.snakeCase()}}.dart';


class {{first_screen.pascalCase()}}Route extends CustomPage {
  const {{first_screen.pascalCase()}}Route(GoRouterState state)
      : super(key: const ValueKey('{{first_screen.pascalCase()}}Route'), state: state);

  @override
  Route<dynamic> createRoute(BuildContext context) {
    return CupertinoPageRoute(
      settings: this,
      builder: (context) => buildContent(context),
    );
  }

  @override
  Widget buildContent(BuildContext context) {
    return BlocProvider(
      create: (context) => {{#bloc}}{{first_screen.pascalCase()}}Bloc(){{/bloc}}{{#cubit}}{{first_screen.pascalCase()}}ScreenCubit(){{/cubit}},
      child: const {{first_screen.pascalCase()}}Screen(),
    );
  }
}
