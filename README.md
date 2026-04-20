# example

Ứng dụng Flutter mẫu theo **Clean Architecture** và **BLoC**, định tuyến **go_router** (typed routes + `go_router_builder`). Tham khảo: [Clean Code Architecture and BLoC in Flutter (DEV)](https://dev.to/princetomarappdev/clean-code-architecture-and-bloc-in-flutter-a-comprehensive-guide-for-beginners-and-experts-33k8).

**Yêu cầu:** Dart SDK `^3.8.0` (khớp `json_serializable` / codegen).

## Kiến trúc

Luồng phụ thuộc: **Presentation (BLoC)** → **Domain (use case)** → **Domain (repository)** ← **Data (remote + local + repository impl)**.

| Lớp | Đường dẫn | Vai trò |
| --- | --- | --- |
| Domain | `lib/domain/` | Entity (`equatable`), hợp đồng repository, use case — không phụ thuộc Flutter |
| Data | `lib/data/` | DTO **Freezed** (`models/`), `AppApi` Retrofit, `AssetApiMocksInterceptor`, `AppRemoteDataSource`, **Drift** (`local/app_database.dart`), **`AppLocalDataSource`** cache API → SQLite/IndexedDB, repository impl → `toEntity()` |
| Presentation | `lib/presentation/` | BLoC (event/state **Freezed**), `pages/`, `shell/` |
| Core | `lib/core/` | **get_it + injectable** (`di/injection.dart`, codegen `injection.config.dart`), `go_router` (`routers/`) |

Điều hướng: `*Page` nhận callback từ `router.dart` để tránh import vòng. File `*_bloc.dart` có thể `export` event/state để UI chỉ import bloc.

### Cache API → DB (offline nhẹ)

- **`AppLocalDataSource`** (`lib/data/datasources/app_local_data_source.dart`) ghi **profile / danh sách & chi tiết contacts / chats** sau khi API thành công.
- **Repository** (`profile`, `contacts`, `chats`): ưu tiên API; **ghi cache best-effort** (lỗi DB không chặn response); khi API lỗi thì **đọc bản cache** nếu có.
- **Drift**: bảng `cached_profiles`, `cached_contacts`, `cached_chats` (+ `app_kv_entries` cho key–value tùy chọn). **Schema version 2** — migration trong `app_database.dart`.
- **Nền tảng**: **SQLite** (file app) trên iOS/Android/desktop qua `drift_flutter`; **web** dùng SQLite WASM, persistence qua **IndexedDB** (hoặc OPFS tùy trình duyệt). File `web/sqlite3.wasm` và `web/drift_worker.js` phải khớp phiên bản package (xem [Drift web](https://drift.simonbinder.eu/web/)).

## Dependencies chính

| Nhóm | Package | Ghi chú |
| --- | --- | --- |
| UI & state | `flutter_bloc`, `bloc` | Handler dùng `event.when(...)` với event Freezed |
| DI | `get_it`, `injectable`, `injectable_generator` (dev) | `configureDependencies()` → `sl.init()`; annotate `@lazySingleton` / `@injectable` / `@factoryParam` |
| Routing | `go_router`, `go_router_builder`, `build_runner` (dev) | Sinh `router.g.dart` |
| HTTP | `dio`, `retrofit`, `retrofit_generator` (dev) | `lib/data/api/app_api.dart` → `app_api.g.dart` |
| Local DB | `drift`, `drift_flutter`, `drift_dev` (dev), `path` | Sinh `app_database.g.dart`; executor IO/web tách `app_database_executor_*.dart` |
| Mock API | `dio_mock_interceptor`, `template_expressions` | Schema route giống package; runtime: `AssetApiMocksInterceptor` + JSON trong `assets/api_mocks/` |
| Immutable / JSON | `freezed`, `freezed_annotation`, `json_serializable` (dev), `json_annotation` | DTO + BLoC event/state; file `*.freezed.dart` |
| Entity | `equatable` | Chỉ domain entities |
| Test | `mocktail` (dev) | Mock repository / datasource / use case cho unit test |

## Code generation (`build_runner`)

Chạy khi đổi bất kỳ nguồn nào dưới đây:

- `lib/core/routers/router.dart` → `router.g.dart`
- `lib/core/di/injection.dart` → `injection.config.dart` (injectable)
- `lib/data/api/app_api.dart` → `app_api.g.dart`
- `lib/data/models/*.dart` (Freezed + json) → `*.freezed.dart`, `*.g.dart`
- `lib/data/local/app_database.dart` → `app_database.g.dart` (drift)
- `lib/presentation/bloc/**/*_event.dart`, `*_state.dart` → `*.freezed.dart`

```bash
cd packages/example
dart run build_runner build --delete-conflicting-outputs
```

## Mock API (`assets/api_mocks/`)

- Khai báo thư mục trong `pubspec.yaml` → `flutter pub get`.
- Mỗi `.json` là **mảng** object: `path`, `method`, `statusCode`, `data` hoặc `template` / `templates` / `vars` ([dio_mock_interceptor](https://pub.dev/packages/dio_mock_interceptor)).
- Chi tiết theo query: `/profile?id=`, `/contact?id=`, `/chat?id=` (mock khớp `RequestOptions.path` tuyệt đối).
- `createAppDio()` (`lib/data/datasources/app_dio.dart`): `AssetApiMocksInterceptor` đọc asset cố định, `jsonDecode` body trước khi Retrofit map model.

## Chạy app

```bash
cd packages/example
flutter pub get
dart run build_runner build --delete-conflicting-outputs   # nếu chưa có hoặc vừa sửa codegen
flutter run
```

**Web:** bảo đảm `web/sqlite3.wasm` và `web/drift_worker.js` đúng phiên bản; server production gửi `Content-Type: application/wasm` cho `.wasm`.

## Test

### Unit test theo tầng (`test/`)

| Tầng | Thư mục / file | Nội dung |
| --- | --- | --- |
| Domain | `test/domain/entities_test.dart` | `Equatable` / `props` entity |
| Domain | `test/domain/usecases_test.dart` | Use case ủy quyền repository (mock) |
| Data | `test/data/models_test.dart` | `toJson` / `fromJson` + `toEntity` DTO |
| Data | `test/data/repositories/*_impl_test.dart` | Profile / contacts / chats / auth: API + cache + fallback |
| Data | `test/data/datasources/app_local_data_source_test.dart` | Drift + `AppLocalDataSourceImpl` (DB in-memory khi `FLUTTER_TEST`) |
| Presentation | `test/presentation/*_bloc_test.dart` | BLoC: `loading` → `success` / `failure` qua `bloc.stream` + `expectLater` |
| Hỗ trợ | `test/fixtures.dart`, `test/mocks.dart`, `test/helpers/bloc_harness.dart` | Dữ liệu mẫu, mock `mocktail`, helper `expectBlocEmissions` |

**Lưu ý:** không dùng `bloc_test` (xung đột phiên bản với `drift_dev` / `flutter_test`); BLoC kiểm tra bằng `emitsInOrder` từ `flutter_test`.

### Widget & smoke

- Widget: `GetIt.instance.reset()` rồi `configureDependencies()` trước `pumpWidget` (`test/widget_test.dart`).
- Drift trong `flutter test`: `FLUTTER_TEST=true` → **`NativeDatabase.memory()`** trên VM.
- Smoke Dio/mock: `test/dio_mock_smoke_test.dart`.

```bash
cd packages/example
flutter test
```

## Ghi chú

- Backend thật: gỡ hoặc điều kiện hóa `AssetApiMocksInterceptor`, trỏ `Dio` tới base URL thật; giữ `AppApi` nếu JSON khớp DTO Freezed.
- Nâng `drift` / `sqlite3`: tải lại `sqlite3.wasm` / `drift_worker.js` từ release GitHub tương ứng.
