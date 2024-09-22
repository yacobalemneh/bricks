import 'package:mason/mason.dart';
import 'dart:io';
import 'package:recase/recase.dart';

Future<void> run(HookContext context) async {
  final type = context.vars['bloc_type'] as String;
  final dir = Directory.current.path;
  final appName = ReCase(dir.split('/').last).snakeCase;

  context.logger.info('App Name: $appName');

  context.vars = {
    ...context.vars,
    'cubit': type == 'cubit',
    'bloc': type == 'bloc',
    'project_name': appName,
  };
}
