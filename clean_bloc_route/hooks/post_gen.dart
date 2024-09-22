import 'package:mason/mason.dart';
import 'package:recase/recase.dart';
import 'dart:io';

Future<void> run(HookContext context) async {
  final projectName = ReCase(context.vars['project_name'] as String).snakeCase;
  final featureName = ReCase(context.vars['feature_name'] as String).snakeCase;
  final screenName = ReCase(context.vars['name'] as String).snakeCase;
  final screenClassName = ReCase(screenName).pascalCase;
  final routesPath = 'lib/features/$featureName/routes.dart';

  final file = File(routesPath);
  if (!file.existsSync()) {
    context.logger.err('routes.dart not found at $routesPath');
    return;
  }

  String content = await file.readAsString();

  // Insert the import statement above the END GENERATED CODE marker
  final importStatement =
      "import 'package:$projectName/features/$featureName/$screenName/presentation/route.dart';\n";
  content = content.replaceFirst(
    RegExp(r'// END GENERATED CODE'),
    '$importStatement// END GENERATED CODE',
  );

  // Find the 'registerFeatureRoutes' function
  final functionName = 'register${ReCase(featureName).pascalCase}Routes';

  // Prepare the route registration code
  final routeRegistration = '''
routeManager.registerRoute(
  path: '/$featureName/$screenName',
  pageBuilder: (state) => ${screenClassName}Route(state),
);
''';

  // Find the function body
  final functionPattern = RegExp(
      r'void\s+' + functionName + r'\s*\(RouteManager\s+\w+\)\s*\{([\s\S]*?)\}');
  final match = functionPattern.firstMatch(content);

  if (match == null) {
    context.logger.err('$functionName function not found in routes.dart');
    return;
  }

  final functionBodyStart = match.start + match.group(0)!.indexOf('{') + 1;
  final functionBodyEnd = match.end - 1;

  // Find the placeholder comment
  final placeholderComment = '// Register routes for other features here';
  final placeholderIndex =
      content.indexOf(placeholderComment, functionBodyStart);

  int insertionPoint;
  if (placeholderIndex != -1) {
    // Insert before the placeholder comment
    insertionPoint = placeholderIndex;
  } else {
    // Insert before the closing brace
    insertionPoint = functionBodyEnd;
  }

  // Prepare proper indentation
  final precedingContent = content.substring(0, insertionPoint);
  final lastLineBreak = precedingContent.lastIndexOf('\n');
  final lineStart = lastLineBreak != -1
      ? precedingContent.substring(lastLineBreak + 1)
      : precedingContent;
  final indentMatch = RegExp(r'^\s*').firstMatch(lineStart)?.group(0) ?? '';

  // Build the new content to insert
  String insertionContent = '\n' +
      indentMatch +
      routeRegistration.split('\n').map((line) => indentMatch + line).join('\n') +
      '\n' +
      indentMatch +
      placeholderComment +
      '\n';

  // Insert the new content
  if (placeholderIndex != -1) {
    // Replace the placeholder comment with the new route and placeholder
    content = content.substring(0, insertionPoint) +
        insertionContent +
        content.substring(placeholderIndex + placeholderComment.length);
  } else {
    // Insert the new route before the closing brace
    content = content.substring(0, insertionPoint) +
        insertionContent +
        content.substring(insertionPoint);
  }

  // Overwrite the file with the updated content
  await file.writeAsString(content);

  context.logger.success('Successfully updated routes.dart with $screenName route.');
}
