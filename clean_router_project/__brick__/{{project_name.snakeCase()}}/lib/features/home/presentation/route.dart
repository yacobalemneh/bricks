import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:{{project_name.snakeCase()}}/features/home/presentation/home.dart';

final homeScreenRoute = GoRoute(
  path: '/',
  pageBuilder: (context, state) {
    return MaterialPage(
      child: BlocProvider(
        create: (context) => HomeScreenCubit(),
        child: const HomeScreenPage(),
      ),
    );
  },
);

