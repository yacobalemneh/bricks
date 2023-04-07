import 'package:flutter_test/flutter_test.dart';
import 'package:{{project_name.snakeCase()}}/presentation/app.dart';
import 'package:{{project_name.snakeCase()}}/features/home/presentation/home_screen.dart';



void main() {
  group('App', () {
    testWidgets('renders HomeScreenPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(HomeScreenPage), findsOneWidget);
    });
  });
}
