import 'package:flutter_bloc/flutter_bloc.dart';


class {{name.pascalCase()}}ScreenCubit extends Cubit<int> {
  {{name.pascalCase()}}ScreenCubit() : super(0);

// Todo: implement event handler
  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}
