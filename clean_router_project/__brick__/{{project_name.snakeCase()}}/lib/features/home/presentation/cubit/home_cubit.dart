import 'package:bloc/bloc.dart';

class HomeScreenCubit extends Cubit<int> {
  HomeScreenCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}
