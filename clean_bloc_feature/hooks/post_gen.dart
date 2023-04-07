import 'update_routes.dart';
import 'package:mason/mason.dart';
import 'package:recase/recase.dart';

// Your existing run function
Future<void> run(HookContext context) async {
  

  final project_name = context.vars['project_name'];
  final feature_name = context.vars['name'];
  final routes_path = 'lib/features/routes.dart';
  final newRoute = '${ReCase(feature_name).camelCase}Routes';

  // Call the updateRoutesFile function
  await updateRoutesFile(routes_path, newRoute, feature_name, project_name);
}
