import 'package:example/data/datasources/app_dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('Dio GET /chats returns list from assets', () async {
    final dio = createAppDio();
    final response = await dio.get<List<dynamic>>('/chats');
    expect(response.data, isNotNull);
    expect(response.data!.length, 5);
    expect(response.data!.first as Map<String, dynamic>, containsPair('title', 'Chat 0'));
  });
}
