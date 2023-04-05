import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/{{first_screen.snakeCase()}}/presentation/{{first_screen.snakeCase()}}.dart';


final {{first_screen.camelCase()}}ScreenRoute = GoRoute(
  path: '{{name.snakeCase()}}/{{first_screen.snakeCase()}}',
  pageBuilder: (context, state) {
    return MaterialPage(
      child: BlocProvider(
        create: (context) => {{#bloc}}{{first_screen.pascalCase()}}Bloc(){{/bloc}}{{#cubit}}{{first_screen.pascalCase()}}ScreenCubit(){{/cubit}},
        child: const {{first_screen.pascalCase()}}Screen(),
      ),
    );
  },
);
