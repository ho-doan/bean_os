import 'package:example/core/di/injection.dart';
import 'package:example/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Chats tab loads mock data after DI', (tester) async {
    await GetIt.instance.reset();
    configureDependencies();

    await tester.pumpWidget(const MyApp());
    await tester.pump();
    await tester.pump(const Duration(seconds: 2));

    expect(find.text('Chat 0'), findsOneWidget);
  });
}
