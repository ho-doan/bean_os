import 'package:flutter_test/flutter_test.dart';

/// Đăng ký lắng nghe [stream] trước khi gọi [act] để bắt đủ emission từ BLoC.
Future<void> expectBlocEmissions<S>(
  Stream<S> stream,
  List<Matcher> matchers,
  Future<void> Function() act,
) async {
  final done = expectLater(stream, emitsInOrder(matchers));
  await act();
  await done;
}
