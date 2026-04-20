import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drift_flutter/drift_flutter.dart';

/// Native (mobile/desktop): SQLite file qua [drift_flutter].
/// Trong `flutter test`, [path_provider] không có plugin → dùng bộ nhớ in-memory.
QueryExecutor createAppDatabaseExecutor() {
  if (Platform.environment['FLUTTER_TEST'] == 'true') {
    return NativeDatabase.memory();
  }
  return driftDatabase(
    name: 'example_app',
    native: const DriftNativeOptions(),
    web: null,
  );
}
