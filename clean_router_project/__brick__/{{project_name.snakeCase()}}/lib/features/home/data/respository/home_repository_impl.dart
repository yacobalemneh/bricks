import 'package:{{project_name.snakeCase()}}/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:{{project_name.snakeCase()}}/features/home/domain/repositories/home_repository.dart';



class HomeRepositoryImpl implements HomeRepository {

  HomeRepositoryImpl(this.remoteDataSource);
  final HomeRemoteDataSource remoteDataSource;

  // Implement your home repository methods here
}

