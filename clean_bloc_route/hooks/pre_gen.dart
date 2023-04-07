import 'package:mason/mason.dart';
import 'dart:io';

Future<void> run(HookContext context) async {
  final type = context.vars['bloc_type'];
  final feature_name = context.vars['feature_name'];
  final dir = Directory.current.path;
  final app_name = dir.split('/').last;
  context.logger.info('App Name: $app_name');
  
    // Check if feature_name directory exists in the lib folder
  final feature_directory = Directory('$dir/lib/features/$feature_name');
  final bool feature_exists = await feature_directory.exists();

  context.logger.info('Feature Directory: $feature_directory');
  if (feature_name.isEmpty || !feature_exists) {
    throw Exception(
        'The directory $feature_name does not exist in the lib/features folder. Please enter a correct feature_name.');
  }
  final routes_path = 'lib/features/$feature_name/routes.dart';
  final routes_file = File(routes_path);
  final bool routes_file_exists = await routes_file.exists();
  final create_file = !routes_file_exists;
  
  context.vars = {
    ...context.vars,
    'cubit': type == 'cubit',
    'bloc': type == 'bloc',
    'project_name': app_name,
    'initiate_route': create_file,
  };
  context.logger.info(context.vars.entries.toString());
}