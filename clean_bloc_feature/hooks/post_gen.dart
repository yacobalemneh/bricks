import 'package:mason/mason.dart';
import 'dart:io';
import 'package:recase/recase.dart';

Future<void> run(HookContext context) async {
  final projectName = ReCase(context.vars['project_name'] as String).snakeCase;
  final featureName = ReCase(context.vars['name'] as String).snakeCase;
  
  final routesPath = 'lib/features/routes.dart';
  final registerFunction = 'register${ReCase(featureName).pascalCase}Routes(routeManager);'; // Removed ()

  // Read the existing routes.dart file
  final file = File(routesPath);
  if (!file.existsSync()) {
    context.logger.err('routes.dart not found at $routesPath');
    return;
  }

  String content = await file.readAsString();

  // Insert the import statement above the END GENERATED CODE marker
  final importStatement = "import 'package:${projectName}/features/${featureName}/routes.dart';\n";
  content = content.replaceFirst(
    RegExp(r'// END GENERATED CODE'),
    '$importStatement// END GENERATED CODE',
  );

  // Insert the route registration in the registerAllRoutes function
  // Assumes the function contains the comment '// Register routes for other features here'
  final placeholderComment = '// Register routes for other features here';
  if (!content.contains(placeholderComment)) {
    context.logger.err('Placeholder comment not found in registerAllRoutes function');
    return;
  }

  // Find the position to insert the register function call
  final insertionPoint = content.indexOf(placeholderComment);
  if (insertionPoint == -1) {
    context.logger.err('Placeholder comment not found in routes.dart');
    return;
  }

  // Prepare the register function call with proper indentation
  final precedingContent = content.substring(0, insertionPoint);
  final lastLineBreak = precedingContent.lastIndexOf('\n');
  final lineStart = lastLineBreak != -1 ? precedingContent.substring(lastLineBreak + 1) : precedingContent;
  final indentMatch = RegExp(r'^\s*').firstMatch(lineStart)?.group(0) ?? '';
  final registerFunctionIndented = '$indentMatch$registerFunction\n$indentMatch$placeholderComment';

  // Replace the placeholder comment with the register function call followed by the comment
  content = content.replaceFirst(
    placeholderComment,
    registerFunctionIndented,
  );

  // Overwrite the file with the updated content
  await file.writeAsString(content);

  context.logger.success('Successfully updated routes.dart with $featureName routes.');
}
