import 'package:mason/mason.dart';
import 'dart:io';
import 'package:recase/recase.dart';

Future<void> run(HookContext context) async {
  final type = context.vars['bloc_type'] as String;
  final featureName = ReCase(context.vars['feature_name'] as String).snakeCase;
  final dir = Directory.current.path;
  final appName = ReCase(dir.split('/').last).snakeCase;

  context.logger.info('App Name: $appName');

  // Check if the feature directory exists
  final featureDirectory = Directory('$dir/lib/features/$featureName');
  final bool featureExists = await featureDirectory.exists();

  if (!featureExists) {
    throw Exception(
        'The directory $featureName does not exist in the lib/features folder. Please enter a correct feature_name.');
  }

  context.vars = {
    ...context.vars,
    'cubit': type == 'cubit',
    'bloc': type == 'bloc',
    'project_name': appName,
  };
}
