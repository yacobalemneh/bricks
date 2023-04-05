import 'package:go_router/go_router.dart';
import 'package:{{project_name.snakeCase()}}/features/{{name.snakeCase()}}/{{first_screen.snakeCase()}}/presentation/route.dart';
export 'package:go_router/go_router.dart';
export '{{first_screen.snakeCase()}}/presentation/route.dart';


// INSERT_NEW_ROUTES_HERE

final List<GoRoute> {{name.camelCase()}}Routes = [
  {{first_screen.camelCase()}}ScreenRoute,
];
