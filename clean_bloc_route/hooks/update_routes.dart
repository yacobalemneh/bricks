import 'dart:io';
import 'package:recase/recase.dart';

Future<void> updateRoutesFile(String filePath, String newRoute,
    String featureName, String name, project_name) async {
  // Read the existing file
  final file = File(filePath);
  final content = await file.readAsString();

  // Insert the import and export statements
  final importStatement =
      "import 'package:${ReCase(project_name).snakeCase}/features/${ReCase(featureName).snakeCase}/${ReCase(name).snakeCase}/presentation/route.dart';\n";
  // final exportStatement = "export '${ReCase(name).snakeCase}/presentation/route.dart';\n";

  final updatedContent = content.replaceFirst(
    RegExp(r'// END GENERATED CODE'),
    '$importStatement// END GENERATED CODE',
  );

  // Find the position of the last route
  final lastRouteRegex = RegExp(r'\w+ScreenRoute(?=,|ScreenRoute\s+\])');
  final lastRouteMatch = lastRouteRegex.allMatches(updatedContent).last;

  if (lastRouteMatch == null) {
    throw Exception('Cannot find the position to insert the new route.');
  }

  // Insert the new route after the last route, with a comma as a separator
  final newRoutePosition = lastRouteMatch.end;
  final finalContent = updatedContent.replaceRange(
      newRoutePosition, newRoutePosition, ', \n  $newRoute');

  // Overwrite the file with the updated content
  await file.writeAsString(finalContent);
}
