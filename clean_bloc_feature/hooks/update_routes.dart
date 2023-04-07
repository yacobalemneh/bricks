import 'dart:io';
import 'package:recase/recase.dart';

Future<void> updateRoutesFile(
    String filePath, String newRoute, featureName, project_name) async {
  // Read the existing file
  final file = File(filePath);
  final content = await file.readAsString();

  // Insert the import statement
  final importStatement =
      "import 'package:${ReCase(project_name).snakeCase}/features/${ReCase(featureName).snakeCase}/routes.dart';\n";
  final updatedContent = content.replaceFirst(
    RegExp(r'// END GENERATED CODE'),
    '$importStatement// END GENERATED CODE',
  );

  // Find the position of the featureRoutes list
  final featureRoutesRegex = RegExp(r'final List<GoRoute> featureRoutes = \[');
  final featureRoutesMatch = featureRoutesRegex.firstMatch(updatedContent);

  if (featureRoutesMatch == null) {
    throw Exception('Cannot find the featureRoutes list.');
  }

  // Find the position of the last route in the featureRoutes list
  final lastRouteRegex = RegExp(r'\.\.\w+Routes(?=,|\s+\])');
  final lastRouteMatch = lastRouteRegex.allMatches(updatedContent).last;

  if (lastRouteMatch == null) {
    throw Exception('Cannot find the position to insert the new route.');
  }

  // Insert the new route after the last route, with a comma as a separator
  final newRoutePosition = lastRouteMatch.end;
  final finalContent = updatedContent.replaceRange(
      newRoutePosition, newRoutePosition, ', \n  ...$newRoute');

  // Overwrite the file with the updated content
  await file.writeAsString(finalContent);
}
