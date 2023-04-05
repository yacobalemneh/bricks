
import 'package:{{project_name.snakeCase()}}/features/{{feature_name.snakeCase()}}/{{name.snakeCase()}}/data/data_sources/{{name.snakeCase()}}_remote_data_source.dart';
import 'package:{{project_name.snakeCase()}}/features/{{feature_name.snakeCase()}}/{{name.snakeCase()}}/domain/repositories/{{name.snakeCase()}}_repository.dart';

class {{name.pascalCase()}}RepositoryImpl implements {{name.pascalCase()}}Repository {

  {{name.pascalCase()}}RepositoryImpl(this.remoteDataSource);
  final {{name.pascalCase()}}RemoteDataSource remoteDataSource;

  // Implement your repository methods here
}

