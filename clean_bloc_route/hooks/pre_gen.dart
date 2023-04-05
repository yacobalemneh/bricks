import 'package:mason/mason.dart';
import 'dart:io';

Future<void> run(HookContext context) async {
  final type = context.vars['bloc_type'];
  final feature_name = context.vars['feature_name'];
  final dir = Directory.current.path;
  final app_name = dir.split('/').last;
  context.logger.info('App Name: $app_name');
  
    // Check if feature_name directory exists in the lib folder
  final featureDirectory = Directory('$dir/lib/features/$feature_name');
  final bool feature_exists = await featureDirectory.exists();
  context.logger.info('Feature Directory: $featureDirectory');
  if (feature_name.isEmpty || !feature_exists) {
    throw Exception(
        'The directory $feature_name does not exist in the lib/features folder. Please enter a correct feature_name.');

  }
  context.vars = {
    ...context.vars,
    'cubit': type == 'cubit',
    'bloc': type == 'bloc',
    'project_name': app_name,
  };
  context.logger.info(context.vars.entries.toString());
}