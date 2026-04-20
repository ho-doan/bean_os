import 'package:example/core/di/injection.dart';
import 'package:example/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('MVP shell renders with role tabs', (tester) async {
    await GetIt.instance.reset();
    configureDependencies();

    await tester.pumpWidget(const ProviderScope(child: MyApp()));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    expect(find.text('Kitchen'), findsOneWidget);
    expect(find.text('Cashier'), findsOneWidget);
    expect(find.text('Reports'), findsOneWidget);
  });
}
