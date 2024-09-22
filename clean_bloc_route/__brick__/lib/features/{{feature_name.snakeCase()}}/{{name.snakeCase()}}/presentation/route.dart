import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{project_name.snakeCase()}}/features/{{feature_name.snakeCase()}}/{{name.snakeCase()}}/presentation/{{name.snakeCase()}}.dart';


class {{name.pascalCase()}}Route extends CustomPage {
  const {{name.pascalCase()}}Route(GoRouterState state)
      : super(key: const ValueKey('{{name.pascalCase()}}Route'), state: state);

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
      create: (context) => {{#bloc}}{{name.pascalCase()}}Bloc(){{/bloc}}{{#cubit}}{{name.pascalCase()}}ScreenCubit(){{/cubit}},
      child: const {{name.pascalCase()}}Screen(),
    );
  }
}
