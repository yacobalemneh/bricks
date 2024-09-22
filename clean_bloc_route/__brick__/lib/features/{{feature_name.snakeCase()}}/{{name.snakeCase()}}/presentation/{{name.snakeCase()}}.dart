{{#bloc}}export 'bloc/{{name.snakeCase()}}_bloc.dart';{{/bloc}}{{#cubit}}export 'bloc/{{name.snakeCase()}}_cubit.dart';{{/cubit}}
export '{{name.snakeCase()}}_screen.dart';
export 'package:{{project_name.snakeCase()}}/core/navigation/i_base_navigation_page.dart';
export 'package:go_router/go_router.dart';


