import 'package:go_router/go_router.dart';
import 'package:{{project_name.snakeCase()}}/features/routes.dart';
export 'package:go_router/go_router.dart';



final List<GoRoute> appRoutes = [
  ...featureRoutes,
];
