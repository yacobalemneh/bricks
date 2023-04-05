
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/{{first_screen.snakeCase()}}/domain/repositories/{{first_screen.snakeCase()}}_repository.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/{{first_screen.snakeCase()}}/data/data_sources/{{first_screen.snakeCase()}}_remote_data_source.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/{{first_screen.snakeCase()}}/data/models/{{first_screen.snakeCase()}}_model.dart';

class {{first_screen.pascalCase()}}RepositoryImpl implements {{first_screen.pascalCase()}}Repository {

  {{first_screen.pascalCase()}}RepositoryImpl(this.remoteDataSource);
  final {{first_screen.pascalCase()}}RemoteDataSource remoteDataSource;

  // Implement your repository methods here
}

