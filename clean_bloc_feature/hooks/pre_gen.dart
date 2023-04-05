import 'package:mason/mason.dart';
import 'dart:io';

Future<void> run(HookContext context) async {
  final type = context.vars['bloc_type'];
  final dir = Directory.current.path;
  final app_name = dir.split('/').last;
  context.logger.info('App Name: $app_name');
  context.vars = {
    ...context.vars,
    'cubit': type == 'cubit',
    'bloc': type == 'bloc',
    'project_name': app_name,
  };
}