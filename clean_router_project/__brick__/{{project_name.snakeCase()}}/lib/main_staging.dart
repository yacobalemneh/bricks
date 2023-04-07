import 'package:{{project_name.snakeCase()}}/bootstrap.dart';
import 'package:{{project_name.snakeCase()}}/presentation/app.dart';


void main() {
  // You can set up envionment-speecific configuration here
  bootstrap(() => const App());
}
