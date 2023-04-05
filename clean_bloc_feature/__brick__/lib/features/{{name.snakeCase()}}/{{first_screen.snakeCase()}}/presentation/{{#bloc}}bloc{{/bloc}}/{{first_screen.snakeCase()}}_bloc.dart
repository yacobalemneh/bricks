import 'package:flutter_bloc/flutter_bloc.dart';

part '{{first_screen.snakeCase()}}_event.dart';
part '{{first_screen.snakeCase()}}_state.dart';

class {{first_screen.pascalCase()}}Bloc extends Bloc<{{first_screen.pascalCase()}}Event, {{first_screen.pascalCase()}}State> {
  {{first_screen.pascalCase()}}Bloc() : super(const {{first_screen.pascalCase()}}State()) {
    on<{{first_screen.pascalCase()}}Event>((event, emit) {
      // TODO: implement event handler
    });
  }
}
