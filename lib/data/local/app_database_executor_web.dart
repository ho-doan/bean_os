import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

/// Web: SQLite WASM + IndexedDB (hoặc OPFS tùy trình duyệt).
QueryExecutor createAppDatabaseExecutor() {
  return driftDatabase(
    name: 'example_app',
    web: DriftWebOptions(
      sqlite3Wasm: Uri.parse('sqlite3.wasm'),
      driftWorker: Uri.parse('drift_worker.js'),
    ),
  );
}
