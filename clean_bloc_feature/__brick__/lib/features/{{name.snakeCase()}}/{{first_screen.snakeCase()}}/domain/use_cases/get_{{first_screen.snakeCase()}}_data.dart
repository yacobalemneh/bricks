import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/{{first_screen.snakeCase()}}/domain/repositories/{{first_screen.snakeCase()}}_repository.dart';

class Get{{first_screen.pascalCase()}}Data {

  Get{{first_screen.pascalCase()}}Data(this.{{first_screen.snakeCase()}}Repository);
  final {{first_screen.pascalCase()}}Repository {{first_screen.snakeCase()}}Repository;

  // Define your use case methods here
}
