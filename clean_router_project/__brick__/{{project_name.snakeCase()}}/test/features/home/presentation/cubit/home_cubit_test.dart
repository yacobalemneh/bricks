import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:{{project_name.snakeCase()}}/features/home/presentation/cubit/home_cubit.dart';


void main() {
  group('HomeScreenCubit', () {
    test('initial state is 0', () {
      expect(HomeScreenCubit().state, equals(0));
    });

    blocTest<HomeScreenCubit, int>(
      'emits [1] when increment is called',
      build: HomeScreenCubit.new,
      act: (cubit) => cubit.increment(),
      expect: () => [equals(1)],
    );

    blocTest<HomeScreenCubit, int>(
      'emits [-1] when decrement is called',
      build: HomeScreenCubit.new,
      act: (cubit) => cubit.decrement(),
      expect: () => [equals(-1)],
    );
  });
}
