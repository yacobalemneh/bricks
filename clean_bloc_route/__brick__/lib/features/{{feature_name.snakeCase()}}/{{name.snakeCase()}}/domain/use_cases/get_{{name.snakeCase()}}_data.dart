import 'package:{{project_name.snakeCase()}}/features/{{feature_name.snakeCase()}}/{{name.snakeCase()}}/domain/repositories/{{name.snakeCase()}}_repository.dart';

class Get{{name.pascalCase()}}Data {

  Get{{name.pascalCase()}}Data(this.{{name.snakeCase()}}Repository);
  final {{name.pascalCase()}}Repository {{name.snakeCase()}}Repository;

  // Define your use case methods here
}
