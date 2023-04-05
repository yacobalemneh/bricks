import 'update_routes.dart';
import 'package:mason/mason.dart';
import 'package:recase/recase.dart';

// Your existing run function
Future<void> run(HookContext context) async {
  
  final add_route = context.vars['add_route'];

  if (add_route == 'false') {
    return;
  }
  final project_name = context.vars['project_name'];
  final feature_name = context.vars['feature_name'];
  final routes_path = 'lib/features/$feature_name/routes.dart';
  final screen_name = context.vars['name'];
  final newRoute = '${ReCase(screen_name).camelCase}ScreenRoute';

  // Call the updateRoutesFile function
  await updateRoutesFile(routes_path, newRoute, feature_name, screen_name, project_name);
}
