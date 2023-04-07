import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:{{project_name.snakeCase()}}/features/home/presentation/cubit/home_cubit.dart';
import 'package:{{project_name.snakeCase()}}/features/home/presentation/home_screen.dart';
import '../../../helpers/helpers.dart';


class MockHomeScreenCubit extends MockCubit<int> implements HomeScreenCubit {}

void main() {
  group('HomeScreenPage', () {
    testWidgets('renders HomeScreenView', (tester) async {
      await tester.pumpApp(const HomeScreenPage());
      expect(find.byType(HomeScreen), findsOneWidget);
    });
  });

  group('CounterView', () {
    late HomeScreenCubit homeScreenCubit;

    setUp(() {
      homeScreenCubit = MockHomeScreenCubit();
    });

    testWidgets('renders current count', (tester) async {
      const state = 42;
      when(() => homeScreenCubit.state).thenReturn(state);
      await tester.pumpApp(
        BlocProvider.value(
          value: homeScreenCubit,
          child: const HomeScreen(),
        ),
      );
      expect(find.text('$state'), findsOneWidget);
    });

    testWidgets('calls increment when increment button is tapped',
        (tester) async {
      when(() => homeScreenCubit.state).thenReturn(0);
      when(() => homeScreenCubit.increment()).thenReturn(null);
      await tester.pumpApp(
        BlocProvider.value(
          value: homeScreenCubit,
          child: const HomeScreen(),
        ),
      );
      await tester.tap(find.byIcon(Icons.add));
      verify(() => homeScreenCubit.increment()).called(1);
    });

    testWidgets('calls decrement when decrement button is tapped',
        (tester) async {
      when(() => homeScreenCubit.state).thenReturn(0);
      when(() => homeScreenCubit.decrement()).thenReturn(null);
      await tester.pumpApp(
        BlocProvider.value(
          value: homeScreenCubit,
          child: const HomeScreen(),
        ),
      );
      await tester.tap(find.byIcon(Icons.remove));
      verify(() => homeScreenCubit.decrement()).called(1);
    });
  });
}
