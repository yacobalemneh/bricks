// ignore_for_file: directives_ordering
import 'package:{{project_name.snakeCase()}}/core/navigation/route_manager.dart';

// Feature-specific import statements
// You can manually add your screen routes here
// GENERATED CODE - DO NOT MODIFY BY HAND
// (import statements will be added here)
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/{{first_screen.snakeCase()}}/presentation/route.dart';
// END GENERATED CODE

void register{{name.pascalCase()}}Routes(RouteManager routeManager) {
  routeManager.registerRoute(
      path: '/{{name.snakeCase()}}/{{first_screen.snakeCase()}}',
      pageBuilder: (state) => {{first_screen.pascalCase()}}Route(state),
    );
}
