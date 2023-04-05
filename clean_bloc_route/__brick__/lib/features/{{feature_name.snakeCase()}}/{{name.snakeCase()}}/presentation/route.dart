import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:{{project_name.snakeCase()}}/features/{{feature_name.snakeCase()}}/{{name.snakeCase()}}/presentation/{{name.snakeCase()}}.dart';


final {{name.camelCase()}}ScreenRoute = GoRoute(
  path: '/{{feature_name.snakeCase()}}/{{name.snakeCase()}}',
  pageBuilder: (context, state) {
    return MaterialPage(
      child: BlocProvider(
        create: (context) => {{#bloc}}{{name.pascalCase()}}Bloc(){{/bloc}}{{#cubit}}{{name.pascalCase()}}ScreenCubit(){{/cubit}},
        child: const {{name.pascalCase()}}Screen(),
      ),
    );
  },
);
