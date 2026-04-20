# Flutter Team Clean Code Rules

> **Bắt buộc áp dụng cho toàn bộ thành viên trong team.**  
> Mọi PR không tuân thủ sẽ bị **reject** cho đến khi được fix.  
> Mọi đề xuất thay đổi rule cần tạo PR riêng và được team approve.

**Tham chiếu cấu trúc:** phần cây thư mục và ví dụ đường dẫn dưới đây bám theo app mẫu trong repo này tại `packages/example` (package name: `example`). Các rule chung (naming, format, test, v.v.) vẫn áp dụng; khi thêm layer mới (constants, theme, failures chuẩn), đặt dưới `lib/core/` hoặc `lib/domain/` cho thống nhất.

---

## Mục lục

- [Cấu trúc Thư mục](#cấu-trúc-thư-mục)
- [Naming — Đặt tên](#naming--đặt-tên)
- [Imports](#imports)
- [Formatting — Định dạng code](#formatting--định-dạng-code)
- [Comments — Chú thích](#comments--chú-thích)
- [Variables & Types](#variables--types)
- [Functions & Methods](#functions--methods)
- [Classes](#classes)
- [Dart Language](#dart-language)
- [Async / Await](#async--await)
- [Error Handling](#error-handling)
- [Widgets](#widgets)
- [State Management — BLoC](#state-management--bloc)
- [Clean Architecture](#clean-architecture)
- [Dependency Injection](#dependency-injection)
- [Assets & Theming](#assets--theming)
- [Performance](#performance)
- [Testing](#testing)
- [Git & PR](#git--pr)
- [Tooling](#tooling)

---

## Cấu trúc Thư mục

### Tên thư mục dùng `snake_case`, chữ thường, không dấu cách

Ref: [Effective Dart — Naming](https://dart.dev/effective-dart/style#do-name-libraries-and-source-files-using-lowercase_with_underscores)

```text
// ✓ ok
lib/presentation/bloc/chat_detail/
lib/data/datasources/
lib/core/di/

// ✗ avoid
lib/presentation/bloc/ChatDetail/
lib/data/DataSources/
lib/core/DI/
```

### Tuân thủ cấu trúc Clean Architecture (theo `packages/example`)

```txt
lib/
├── core/
│   ├── di/                 # injection.dart, register_module.dart, injection.config.dart (generated)
│   └── routers/            # router.dart (+ router.g.dart generated), định nghĩa route
│
├── data/
│   ├── api/                # Retrofit / REST client (vd. app_api.dart + *.g.dart)
│   ├── datasources/        # Dio, remote/local API, interceptor mock asset
│   ├── local/              # SQLite / executor theo platform (io, web)
│   ├── models/             # Freezed + json_serializable, map sang Entity
│   └── repositories/       # *RepositoryImpl implements interface domain
│
├── domain/
│   ├── entities/           # pure Dart (Equatable), không import flutter
│   ├── repositories/       # abstract interfaces
│   └── usecases/           # một file một use case, @lazySingleton / injectable
│
├── presentation/
│   ├── bloc/
│   │   └── <feature>/      # <feature>_bloc|_event|_state.dart + *.freezed.dart (generated)
│   ├── pages/              # *_page.dart phẳng theo màn (login_page, contacts_page, …)
│   └── shell/              # layout dùng chung (vd. main_layout.dart)
│
├── main.dart
└── (generated) *.g.dart, *.freezed.dart cạnh file nguồn — không chỉnh tay
```

**Mở rộng sau này (khuyến nghị khi app lớn):** `core/constants/`, `core/theme/`, `core/errors/`, `presentation/pages/<feature>/widgets/` cho widget private theo màn.

### Quy ước feature trong app mẫu

- **BLoC:** mỗi feature một thư mục con của `presentation/bloc/` (vd. `contacts/`, `auth/` dùng `login_bloc.dart` chứ không bắt buộc tên `auth_bloc.dart`).
- **Pages:** file phẳng trong `presentation/pages/` với suffix `_page.dart` (vd. `login_page.dart`, `contacts_page.dart`). Có thể tách thư mục con + `widgets/` khi màn phình to.

```text
// ✓ ok (theo example)
presentation/pages/login_page.dart
presentation/pages/contacts_page.dart
presentation/bloc/auth/login_bloc.dart
presentation/bloc/contacts/contacts_bloc.dart

// ✗ avoid — khó điều hướng khi số màn tăng
lib/login.dart
lib/screens/home.dart
```

---

## Naming — Đặt tên

### Tên file dùng `snake_case`

```dart
// ✓ ok
user_repository.dart
home_page.dart
get_user_usecase.dart
app_colors.dart

// ✗ avoid
UserRepository.dart
HomePage.dart
GetUserUseCase.dart
AppColors.dart
```

### Tên class, enum, typedef, extension dùng `UpperCamelCase`

```dart
// ✓ ok
class UserRepository {}
enum AuthStatus { authenticated, unauthenticated }
typedef OnTapCallback = void Function(int index);
extension StringExtension on String {}

// ✗ avoid
class user_repository {}
class userRepository {}
enum auth_status { authenticated, unauthenticated }
```

### Tên variable, function, parameter dùng `lowerCamelCase`

```dart
// ✓ ok
final String userName;
void fetchUserData() {}
int calculateTotal(int price, int quantity) {}

// ✗ avoid
final String UserName;
void FetchUserData() {}
void fetch_user_data() {}
```

### Tên constant dùng `lowerCamelCase` với `const`. Không dùng `SCREAMING_SNAKE_CASE`

Ref: [Effective Dart — PREFER lowerCamelCase for constants](https://dart.dev/effective-dart/style#prefer-using-lowercamelcase-for-constant-names)

```dart
// ✓ ok
const int maxRetryCount = 3;
const double defaultPadding = 16.0;
static const String baseUrl = 'https://api.example.com';

// ✗ avoid
const int MAX_RETRY_COUNT = 3;
const double DEFAULT_PADDING = 16.0;
static const String BASE_URL = 'https://api.example.com';
```

### Thành viên private của class dùng prefix `_`

```dart
// ✓ ok
class UserBloc {
  final UserRepository _repository;
  int _retryCount = 0;
  void _handleError() {}
}

// ✗ avoid
class UserBloc {
  final UserRepository repository;   // lộ ra ngoài không cần thiết
  int retryCount = 0;
}
```

### Tên boolean bắt đầu bằng động từ `is`, `has`, `can`, `should`

```dart
// ✓ ok
bool isLoading = false;
bool hasPermission = true;
bool canSubmit = false;
bool shouldRefresh = true;

// ✗ avoid
bool loading = false;
bool permission = true;
bool submit = false;
```

### Tên UseCase dùng động từ + danh từ, đuôi `UseCase`

```dart
// ✓ ok
class GetUserUseCase {}
class CreateOrderUseCase {}
class DeleteAccountUseCase {}

// ✗ avoid
class UserUseCase {}       // không rõ hành động
class FetchData {}         // không có đuôi UseCase
class UserService {}       // nhầm với Service layer
```

### Tên BLoC event dùng động từ ở thì quá khứ

```dart
// ✓ ok
final class UserFetched extends UserEvent {}
final class OrderSubmitted extends OrderEvent {}
final class AuthLogoutRequested extends AuthEvent {}

// ✗ avoid
final class FetchUser extends UserEvent {}     // dùng infinitive
final class GetUser extends UserEvent {}
```

### Tên BLoC state mô tả trạng thái hiện tại của UI

```dart
// ✓ ok
final class UserInitial extends UserState {}
final class UserLoading extends UserState {}
final class UserLoaded extends UserState { final User user; }
final class UserError extends UserState { final String message; }

// ✗ avoid
final class UserSuccess extends UserState {}   // không rõ "success" là gì
final class UserData extends UserState {}      // không mô tả trạng thái
```

### Tên Widget không cần đuôi `Widget`

```dart
// ✓ ok
class UserCard extends StatelessWidget {}
class LoadingOverlay extends StatelessWidget {}

// ✗ avoid
class UserCardWidget extends StatelessWidget {}   // thừa chữ Widget
class LoadingOverlayWidget extends StatelessWidget {}
```

---

## Imports

### Thứ tự import: `dart:` → `package:flutter/` → `package:` third-party → internal → relative

Ref: [Effective Dart — Ordering](https://dart.dev/effective-dart/style#do-place-dart-imports-before-other-imports)

```dart
// ✓ ok
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:example/core/routers/router.dart';
import 'package:example/domain/entities/contact_entity.dart';

import '../widgets/contact_tile.dart';

// ✗ avoid — trộn lẫn thứ tự
import '../widgets/contact_tile.dart';
import 'package:flutter/material.dart';
import 'dart:async';
```

### Ưu tiên `package:<app>/` cho import chéo layer; relative hợp lệ trong cùng layer

```dart
// ✓ ok — import chéo layer rõ ràng
import 'package:example/domain/entities/contact_entity.dart';
import 'package:example/presentation/bloc/contacts/contacts_bloc.dart';

// ✓ ok — nội bộ domain (như trong app mẫu)
import '../entities/contact_entity.dart';
import '../repositories/contacts_repository.dart';

// ✗ avoid — relative lủng củng qua nhiều layer khi đã có package name
import '../../../domain/entities/contact_entity.dart';  // khó đọc, dễ vỡ khi di chuyển file
```

### Không import thứ không được dùng

Lint: `unused_import`

```dart
// ✗ avoid
import 'dart:convert';                    // không dùng ở đâu
import 'package:flutter/cupertino.dart'; // không dùng ở đâu
import 'package:flutter/material.dart';
```

### Không import trùng lặp cùng một package

```dart
// ✗ avoid
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';  // duplicate
```

---

## Formatting — Định dạng code

### Dùng `dart format` để format tất cả code. Không format thủ công

```bash
# ✓ ok — chạy trước mỗi commit
dart format .
```

### Độ dài dòng tối đa 80 ký tự (mặc định của `dart format`)

```dart
// ✓ ok
final result = await repository.fetchUser(
  userId: userId,
  includeDetails: true,
);

// ✗ avoid
final result = await repository.fetchUser(userId: userId, includeDetails: true, refresh: false);
```

### Dùng trailing comma cho mọi argument list / parameter list xuống dòng

Trailing comma giúp `dart format` tự động xuống dòng từng item.

```dart
// ✓ ok
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    const Text('Hello'),
    const SizedBox(height: 8),
  ],    // ← trailing comma
)

// ✗ avoid
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    const Text('Hello'),
    const SizedBox(height: 8)   // thiếu trailing comma
  ]
)
```

### Không để trailing whitespace cuối dòng

```dart
// ✓ ok
void doSomething() {
  print('done');
}

// ✗ avoid — có spaces thừa sau dấu {
void doSomething() {   
  print('done');   
}
```

### Không để quá 1 dòng trắng liên tiếp

```dart
// ✓ ok
void methodA() {}

void methodB() {}

// ✗ avoid
void methodA() {}



void methodB() {}   // 3 dòng trắng
```

### Dùng 1 dòng trắng để phân tách các method trong class

```dart
// ✓ ok
class UserRepository {
  Future<User> getUser(String id) async { ... }

  Future<void> updateUser(User user) async { ... }
}

// ✗ avoid
class UserRepository {
  Future<User> getUser(String id) async { ... }
  Future<void> updateUser(User user) async { ... }
}
```

### Opening brace cùng dòng với declaration, không xuống dòng mới

```dart
// ✓ ok
class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const CircularProgressIndicator();
    }
    return Container();
  }
}

// ✗ avoid
class UserPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    ...
  }
}
```

### Mỗi file kết thúc bằng 1 dòng trắng (newline)

---

## Comments — Chú thích

### Dùng `///` cho doc comment (public API), dùng `//` cho inline comment

```dart
// ✓ ok

/// Repository cung cấp dữ liệu User từ remote và local sources.
abstract class UserRepository {
  /// Trả về [User] theo [id]. Throws [ServerFailure] nếu thất bại.
  Future<Either<Failure, User>> getUser(String id);
}

// Kiểm tra token trước khi gọi API
if (token.isNotEmpty) {
  await apiClient.setToken(token);
}

// ✗ avoid
// Repository cung cấp dữ liệu   ← dùng // thay vì /// cho public API
abstract class UserRepository {
  Future<Either<Failure, User>> getUser(String id);
}
```

### Không comment những gì code đã nói rõ

```dart
// ✓ ok
final sortedUsers = users.sortedBy((u) => u.createdAt);

// ✗ avoid
// Sắp xếp danh sách user theo ngày tạo
final sortedUsers = users.sortedBy((u) => u.createdAt);
```

### TODO phải có tên người phụ trách và mô tả rõ ràng

```dart
// ✓ ok
// TODO(nguyenvana): Implement pagination when API v2 is ready.

// ✗ avoid
// TODO: fix this
// TODO — handle later
// FIXME
```

### Không commit code bị comment out

```dart
// ✓ ok — xóa hẳn, dùng git để lấy lại nếu cần

// ✗ avoid
// final oldResult = await oldRepository.fetch();
// if (oldResult != null) { ... }
```

### Comment phải có dấu cách sau `//`

```dart
// ✓ ok
// Validate trước khi submit

// ✗ avoid
//Validate trước khi submit
```

---

## Variables & Types

### Luôn dùng `final` cho variable không bị reassign

Lint: `prefer_final_locals`, `prefer_final_fields`

```dart
// ✓ ok
final String name = 'Flutter';
final user = await repository.getUser(id);

// ✗ avoid
var name = 'Flutter';        // var khi không cần reassign
String userName = 'Flutter'; // mutable khi nên là final
```

### Dùng `const` khi giá trị biết tại compile time

```dart
// ✓ ok
const double pi = 3.14159;
const Duration timeout = Duration(seconds: 30);

// ✗ avoid
final double pi = 3.14159;    // nên là const
```

### Không dùng `dynamic` trừ khi bắt buộc (JSON parsing)

Lint: `avoid_dynamic_calls`

```dart
// ✓ ok
Map<String, dynamic> json = {};    // JSON parsing — bắt buộc

// ✗ avoid
dynamic result = fetchData();      // mất type safety
List<dynamic> items = [];          // nên là List<Item>
```

### Không khai báo type khi Dart có thể tự infer từ right-hand side

```dart
// ✓ ok
final user = User(id: '1', name: 'Alice');
final items = <String>[];

// ✗ avoid
final User user = User(id: '1', name: 'Alice');  // thừa type annotation
final List<String> items = <String>[];
```

### Khai báo type rõ ràng cho fields và return type của function

```dart
// ✓ ok
class UserBloc {
  final UserRepository _repository;
}

Future<Either<Failure, User>> getUser(String id) { ... }

// ✗ avoid
class UserBloc {
  final _repository;   // thiếu type
}

getUser(id) { ... }    // thiếu return type
```

### Không khởi tạo variable với `null` tường minh nếu đã nullable

Lint: `avoid_init_to_null`

```dart
// ✓ ok
String? name;

// ✗ avoid
String? name = null;     // thừa = null
```

---

## Functions & Methods

### Mỗi function chỉ làm 1 việc

```dart
// ✓ ok
Future<void> _validateForm() { ... }
Future<void> _submitForm() { ... }
void _showSuccessMessage() { ... }

// ✗ avoid
Future<void> _validateAndSubmitFormAndShowResult() {
  // validate + submit + snackbar + navigate — quá nhiều việc
}
```

### Function không quá 40 dòng. Tách nếu dài hơn

```dart
// ✓ ok
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: _buildAppBar(context),
    body: _buildBody(context),
    floatingActionButton: _buildFab(context),
  );
}

// ✗ avoid — build method 100+ dòng với widget lồng nhau sâu
```

### Function không quá 5 tham số. Dùng object nếu cần nhiều hơn

```dart
// ✓ ok
Future<void> createOrder(CreateOrderParams params) { ... }

class CreateOrderParams {
  const CreateOrderParams({
    required this.userId,
    required this.items,
    required this.address,
    required this.paymentMethod,
    this.note,
  });
  final String userId;
  final List<OrderItem> items;
  final Address address;
  final PaymentMethod paymentMethod;
  final String? note;
}

// ✗ avoid
Future<void> createOrder(
  String userId,
  List<OrderItem> items,
  Address address,
  PaymentMethod paymentMethod,
  String? note,
  bool isExpress,   // 6 tham số — quá nhiều
) { ... }
```

### Dùng arrow `=>` cho function single expression

```dart
// ✓ ok
int doubled(int x) => x * 2;
String get fullName => '$firstName $lastName';
Widget build(BuildContext context) => const Text('Hello');

// ✗ avoid
int doubled(int x) {
  return x * 2;    // block không cần thiết
}
```

### Luôn khai báo return type cho function

Lint: `always_declare_return_types`

```dart
// ✓ ok
void handleTap() {}
Future<User> fetchUser(String id) async { ... }

// ✗ avoid
handleTap() {}
fetchUser(String id) async { ... }
```

### Named parameters cho function có từ 2 tham số trở lên

```dart
// ✓ ok
void showSnackBar({
  required String message,
  SnackBarType type = SnackBarType.info,
}) { ... }

showSnackBar(message: 'Thành công!', type: SnackBarType.success);

// ✗ avoid
void showSnackBar(String message, SnackBarType type) { ... }
showSnackBar('Thành công!', SnackBarType.success);   // không rõ nghĩa
```

### Không dùng positional optional parameters `[param]` cho public API

```dart
// ✓ ok
void navigate({String? returnPath}) { ... }

// ✗ avoid
void navigate([String? returnPath]) { ... }   // dễ nhầm thứ tự
```

---

## Classes

### Thứ tự khai báo trong class

```dart
class UserPage extends StatelessWidget {
  // 1. Static constants
  static const String routeName = '/user';

  // 2. Final fields
  final String userId;

  // 3. Constructor
  const UserPage({super.key, required this.userId});

  // 4. Named constructors / factory

  // 5. Getters / Setters

  // 6. Lifecycle overrides (initState → didChangeDependencies → build → dispose)
  @override
  Widget build(BuildContext context) { ... }

  // 7. Public methods

  // 8. Private methods
  void _handleSubmit() {}
}
```

### Class không quá 200 dòng. File không quá 300 dòng

### Class chỉ chịu trách nhiệm 1 việc (Single Responsibility)

```dart
// ✓ ok
class UserRemoteDataSource { /* chỉ giao tiếp với API */ }
class UserLocalDataSource  { /* chỉ đọc/ghi local storage */ }
class UserRepositoryImpl   { /* chỉ phối hợp 2 source */ }

// ✗ avoid
class UserRepository {
  // gọi API + đọc ghi Hive + format date + validate — quá nhiều việc
}
```

### Dùng `abstract class` cho interface

```dart
// ✓ ok
abstract class UserRepository {
  Future<Either<Failure, User>> getUser(String id);
}

class UserRepositoryImpl implements UserRepository { ... }
```

### Dùng `sealed class` cho BLoC state và event (Dart 3+)

```dart
// ✓ ok
sealed class UserState extends Equatable { ... }
final class UserLoading extends UserState { ... }
final class UserLoaded extends UserState { ... }
final class UserError extends UserState { ... }

// ✗ avoid — abstract class không ép exhaustive switch
abstract class UserState {}
```

### Extend `Equatable` cho mọi entity, state, event

```dart
// ✓ ok
class User extends Equatable {
  const User({required this.id, required this.name});
  final String id;
  final String name;

  @override
  List<Object?> get props => [id, name];
}

// ✗ avoid
class User {
  User({required this.id, required this.name});
  final String id;
  final String name;
  // user1 == user2 luôn false dù cùng id/name
}
```

### Không để constructor body rỗng

Lint: `empty_constructor_bodies`

```dart
// ✓ ok
class AppConfig {
  const AppConfig({required this.baseUrl});
  final String baseUrl;
}

// ✗ avoid
class AppConfig {
  const AppConfig({required this.baseUrl}) {}  // body rỗng
  final String baseUrl;
}
```

---

## Dart Language

### Dùng string interpolation, không dùng concatenation

```dart
// ✓ ok
final message = 'Xin chào, $name! Bạn có $count tin nhắn.';
final url = '${baseUrl}/users/$userId';

// ✗ avoid
final message = 'Xin chào, ' + name + '! Bạn có ' + count.toString() + ' tin nhắn.';
```

### Dùng collection if / for trong collection literals

```dart
// ✓ ok
final children = [
  const Text('Luôn hiển thị'),
  if (isLoggedIn) const UserAvatar(),
  if (isAdmin) const AdminBadge(),
  for (final item in notifications) NotificationCard(item: item),
];

// ✗ avoid
final children = <Widget>[];
children.add(const Text('Luôn hiển thị'));
if (isLoggedIn) children.add(const UserAvatar());
```

### Dùng spread operator `...` thay vì `addAll`

```dart
// ✓ ok
final allItems = [...fixedItems, ...dynamicItems];

// ✗ avoid
final allItems = <Widget>[];
allItems.addAll(fixedItems);
allItems.addAll(dynamicItems);
```

### Dùng `switch expression` thay vì if-else chain (Dart 3+)

```dart
// ✓ ok
final label = switch (status) {
  AuthStatus.authenticated   => 'Đã đăng nhập',
  AuthStatus.unauthenticated => 'Chưa đăng nhập',
  AuthStatus.loading         => 'Đang tải...',
};

// ✗ avoid
String label;
if (status == AuthStatus.authenticated) {
  label = 'Đã đăng nhập';
} else if (status == AuthStatus.unauthenticated) {
  label = 'Chưa đăng nhập';
} else {
  label = 'Đang tải...';
}
```

### Dùng pattern matching với `switch` trên sealed class

```dart
// ✓ ok — exhaustive, compiler báo lỗi nếu thiếu case
return switch (state) {
  UserInitial()             => const SizedBox.shrink(),
  UserLoading()             => const CircularProgressIndicator(),
  UserLoaded(:final user)   => UserCard(user: user),
  UserError(:final message) => ErrorView(message: message),
};

// ✗ avoid — không exhaustive
if (state is UserLoading) { ... }
else if (state is UserLoaded) { ... }
// bỏ sót UserError và UserInitial
```

### Dùng null-aware operators. Hạn chế tối đa `!` null assertion

```dart
// ✓ ok
final name = user?.name ?? 'Unknown';
final length = list?.length ?? 0;
user?.save();

// ✗ avoid — có thể crash
print(user!.name);
final len = list!.length;
```

### Dùng `??=` để gán giá trị mặc định cho nullable

```dart
// ✓ ok
cache ??= <String, User>{};

// ✗ avoid
if (cache == null) {
  cache = <String, User>{};
}
```

### Không dùng `as` cast trừ khi chắc chắn type. Dùng `is` kiểm tra trước

```dart
// ✓ ok
if (animal is Dog) {
  animal.bark();
}

// ✗ avoid
(animal as Dog).bark();   // throws nếu không phải Dog
```

### Dùng `single quotes` cho string literal

```dart
// ✓ ok
final name = 'Flutter';

// ✗ avoid
final name = "Flutter";
```

### Không dùng `print()`. Dùng `log()` hoặc logger package

Lint: `avoid_print`

```dart
// ✓ ok
import 'dart:developer';
log('User fetched: ${user.id}', name: 'UserBloc');

// ✗ avoid
print('User fetched: ${user.id}');
```

### Không có unused variable, import, parameter

```dart
// ✓ ok
void fetchUser(String userId) async {
  final user = await repository.getUser(userId);
  emit(UserLoaded(user: user));
}

// ✗ avoid
void fetchUser(String userId) async {
  final user = await repository.getUser(userId);
  final timestamp = DateTime.now();   // khai báo mà không dùng
  emit(UserLoaded(user: user));
}
```

---

## Async / Await

### Dùng `async/await`, không dùng `.then()` callback chain

```dart
// ✓ ok
Future<void> loadUser() async {
  final user = await repository.getUser(userId);
  emit(UserLoaded(user: user));
}

// ✗ avoid
Future<void> loadUser() {
  return repository.getUser(userId).then((user) {
    emit(UserLoaded(user: user));
  });
}
```

### Không bỏ qua `Future` chưa được await. Dùng `unawaited()` nếu có chủ ý

Lint: `unawaited_futures`

```dart
// ✓ ok
await sendAnalyticsEvent('user_login');

// ✓ ok — có chủ ý không await
unawaited(sendAnalyticsEvent('user_login'));

// ✗ avoid
sendAnalyticsEvent('user_login');   // Future bị bỏ qua, lỗi không được catch
```

### Không gọi `async` function trong `initState` trực tiếp

```dart
// ✓ ok
@override
void initState() {
  super.initState();
  _loadData();
}

Future<void> _loadData() async {
  await repository.fetch();
}

// ✗ avoid
@override
void initState() {
  super.initState();
  await repository.fetch();   // không hợp lệ
}
```

### Kiểm tra `mounted` trước khi dùng `BuildContext` sau `await`

```dart
// ✓ ok
Future<void> _submit() async {
  await repository.submit(data);
  if (!mounted) return;
  Navigator.of(context).pop();
}

// ✗ avoid
Future<void> _submit() async {
  await repository.submit(data);
  Navigator.of(context).pop();   // context có thể không còn hợp lệ
}
```

### Không dùng `async` nếu không có `await` bên trong

Lint: `unnecessary_async`

```dart
// ✓ ok
Future<User> getUser(String id) {
  return repository.getUser(id);
}

// ✗ avoid
Future<User> getUser(String id) async {   // async thừa
  return repository.getUser(id);
}
```

### Wrap async calls trong try/catch ở tầng repository, không để exception bubble lên presentation

```dart
// ✓ ok
Future<Either<Failure, User>> getUser(String id) async {
  try {
    final model = await remoteDataSource.getUser(id);
    return Right(model);
  } on ServerException catch (e) {
    return Left(ServerFailure(message: e.message));
  } on SocketException {
    return const Left(NetworkFailure(message: 'Không có kết nối mạng'));
  }
}

// ✗ avoid
Future<User> getUser(String id) async {
  return await remoteDataSource.getUser(id);  // exception bay lên UI
}
```

---

## Error Handling

### Dùng `Either<Failure, T>` làm return type cho mọi repository và use case

```dart
// ✓ ok
abstract class UserRepository {
  Future<Either<Failure, User>> getUser(String id);
  Future<Either<Failure, List<User>>> getUsers();
  Future<Either<Failure, void>> updateUser(User user);
}

// ✗ avoid
abstract class UserRepository {
  Future<User> getUser(String id);    // throw exception khi lỗi
  Future<List<User>?> getUsers();     // nullable không rõ nghĩa
}
```

### Định nghĩa `Failure` riêng cho mỗi loại lỗi

```dart
// ✓ ok
abstract class Failure extends Equatable {
  const Failure({required this.message});
  final String message;
  @override
  List<Object?> get props => [message];
}

final class ServerFailure extends Failure {
  const ServerFailure({required super.message, this.statusCode});
  final int? statusCode;
}

final class NetworkFailure extends Failure {
  const NetworkFailure({required super.message});
}

final class CacheFailure extends Failure {
  const CacheFailure({required super.message});
}
```

### Định nghĩa `Exception` riêng. Không throw `String` hay generic `Exception`

Lint: `only_throw_errors`

```dart
// ✓ ok
class ServerException implements Exception {
  const ServerException({required this.message, this.statusCode});
  final String message;
  final int? statusCode;
}

throw ServerException(message: 'Not found', statusCode: 404);

// ✗ avoid
throw 'Không tìm thấy user';
throw Exception('Server error');
```

### Không bắt lỗi im lặng (silent catch)

```dart
// ✓ ok
try {
  await repository.submit(data);
} catch (e, stackTrace) {
  log('Submit failed: $e', stackTrace: stackTrace, name: 'OrderBloc');
  emit(OrderError(message: 'Có lỗi xảy ra, vui lòng thử lại'));
}

// ✗ avoid
try {
  await repository.submit(data);
} catch (e) {
  // im lặng — bug ẩn
}
```

### Xử lý lỗi từ `Either` bằng `fold`, không bỏ qua nhánh Left

```dart
// ✓ ok
final result = await getUserUseCase(userId);
result.fold(
  (failure) => emit(UserError(message: failure.message)),
  (user)    => emit(UserLoaded(user: user)),
);

// ✗ avoid
final result = await getUserUseCase(userId);
if (result.isRight()) {
  emit(UserLoaded(user: result.getOrElse(() => throw Error())));
  // bỏ qua trường hợp Left
}
```

---

## Widgets

### Luôn dùng `const` constructor cho widget khi có thể

Lint: `prefer_const_constructors`

```dart
// ✓ ok
const Text('Hello World')
const SizedBox(height: 16)
const Icon(Icons.home)

// ✗ avoid
Text('Hello World')      // thiếu const
SizedBox(height: 16)
```

### Ưu tiên `StatelessWidget`. Chỉ dùng `StatefulWidget` khi cần local state thực sự

```dart
// ✓ ok — StatefulWidget khi cần AnimationController, TextEditingController
class SearchInput extends StatefulWidget { ... }

// ✓ ok — StatelessWidget khi state quản lý bởi BLoC
class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.user});
  final User user;
}

// ✗ avoid — StatefulWidget chỉ để setState cho 1 boolean
class MyWidget extends StatefulWidget { ... }
class _MyWidgetState extends State<MyWidget> {
  bool _isExpanded = false;    // nên dùng BLoC hoặc ValueNotifier
}
```

### Tách widget lớn thành class riêng thay vì private method

Private method không được rebuild độc lập, class riêng thì được.

```dart
// ✓ ok — class riêng, Flutter có thể tối ưu rebuild
class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _UserAppBar(),
      body: const _UserBody(),
    );
  }
}

class _UserAppBar extends StatelessWidget implements PreferredSizeWidget { ... }
class _UserBody extends StatelessWidget { ... }

// ✗ avoid — method rebuild cùng với parent
class UserPage extends StatelessWidget {
  Widget _buildAppBar() => AppBar(...);
  Widget _buildBody() => Column(...);
}
```

### Dùng `ValueKey` cho item trong list, không dùng index

```dart
// ✓ ok
ListView.builder(
  itemBuilder: (context, index) => UserCard(
    key: ValueKey(users[index].id),
    user: users[index],
  ),
)

// ✗ avoid
ListView.builder(
  itemBuilder: (context, index) => UserCard(
    key: ValueKey(index),   // index thay đổi khi list thay đổi
    user: users[index],
  ),
)
```

### Không dùng `Key` khi không cần thiết

```dart
// ✓ ok
Column(
  children: [const Text('Hello'), const SizedBox(height: 8)],
)

// ✗ avoid
Column(
  key: const Key('main_column'),   // không cần thiết
  children: [...],
)
```

### Không hardcode màu, font size, spacing trong widget

```dart
// ✓ ok
Text('Hello', style: context.textTheme.bodyLarge)
Container(color: AppColors.primary)
const SizedBox(height: AppSpacing.md)

// ✗ avoid
Text('Hello', style: const TextStyle(fontSize: 14, color: Color(0xFF212121)))
Container(color: const Color(0xFF2196F3))
const SizedBox(height: 16)    // magic number
```

### Dùng `BlocBuilder` chỉ cho rebuild UI. Dùng `BlocListener` cho side effects

```dart
// ✓ ok
BlocConsumer<UserBloc, UserState>(
  listener: (context, state) {
    if (state is UserError) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(state.message)));
    }
  },
  builder: (context, state) {
    return switch (state) {
      UserLoading() => const CircularProgressIndicator(),
      UserLoaded(:final user) => UserCard(user: user),
      _ => const SizedBox.shrink(),
    };
  },
)

// ✗ avoid — side effect trong BlocBuilder
BlocBuilder<UserBloc, UserState>(
  builder: (context, state) {
    if (state is UserError) {
      Navigator.of(context).pop();   // side effect — sai
    }
    return Container();
  },
)
```

### Dùng `buildWhen` / `listenWhen` để giảm rebuild không cần thiết

```dart
// ✓ ok
BlocBuilder<UserBloc, UserState>(
  buildWhen: (previous, current) =>
      previous.runtimeType != current.runtimeType,
  builder: (context, state) { ... },
)
```

### Không nest nhiều `BlocProvider` lồng nhau. Dùng `MultiBlocProvider`

```dart
// ✓ ok
MultiBlocProvider(
  providers: [
    BlocProvider<AuthBloc>(create: (_) => sl<AuthBloc>()),
    BlocProvider<UserBloc>(create: (_) => sl<UserBloc>()),
    BlocProvider<CartBloc>(create: (_) => sl<CartBloc>()),
  ],
  child: const MyApp(),
)

// ✗ avoid
BlocProvider<AuthBloc>(
  create: (_) => sl<AuthBloc>(),
  child: BlocProvider<UserBloc>(
    create: (_) => sl<UserBloc>(),
    child: BlocProvider<CartBloc>(
      create: (_) => sl<CartBloc>(),
      child: const MyApp(),
    ),
  ),
)
```

### Không dùng `Scaffold` lồng bên trong `Scaffold`

```dart
// ✓ ok
class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UserDetailSection(),  // không có Scaffold bên trong
    );
  }
}

// ✗ avoid
Scaffold(
  body: Scaffold(    // lồng Scaffold — gây lỗi UI
    body: Container(),
  ),
)
```

### Không dùng `Expanded` / `Flexible` bên ngoài `Row`, `Column`, `Flex`

```dart
// ✓ ok
Row(
  children: [
    Expanded(child: TextField()),
    ElevatedButton(onPressed: () {}, child: const Text('Submit')),
  ],
)

// ✗ avoid
Stack(
  children: [
    Expanded(child: Container()),  // Stack không phải Flex
  ],
)
```

---

## State Management — BLoC

### Mỗi feature BLoC có đúng 3 file nguồn: `_bloc.dart`, `_event.dart`, `_state.dart` (+ generated)

```text
// ✓ ok (theo example — Freezed)
presentation/bloc/contacts/
├── contacts_bloc.dart
├── contacts_bloc.freezed.dart   # generated — chạy build_runner
├── contacts_event.dart
└── contacts_state.dart

// ✗ avoid
presentation/bloc/contacts_bloc.dart   // gộp event + state vào 1 file
```

### Event và state dùng `part of` + Freezed (union event / immutable state)

```dart
// contacts_bloc.dart
part 'contacts_bloc.freezed.dart';
part 'contacts_event.dart';
part 'contacts_state.dart';

// contacts_event.dart
part of 'contacts_bloc.dart';

@freezed
sealed class ContactsEvent with _$ContactsEvent {
  const factory ContactsEvent.started() = _Started;
}

// contacts_state.dart
part of 'contacts_bloc.dart';

enum ContactsStatus { initial, loading, success, failure }

@freezed
abstract class ContactsState with _$ContactsState {
  const factory ContactsState({
    @Default(ContactsStatus.initial) ContactsStatus status,
    @Default(<ContactEntity>[]) List<ContactEntity> contacts,
    String? errorMessage,
  }) = _ContactsState;
}
```

**Lưu ý:** sau khi đổi event/state, chạy `dart run build_runner build --delete-conflicting-outputs`.

### BLoC nhận dependency qua constructor, không tự khởi tạo bên trong

```dart
// ✓ ok
class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({required GetUserUseCase getUserUseCase})
      : _getUserUseCase = getUserUseCase,
        super(const UserInitial()) {
    on<UserFetched>(_onUserFetched);
  }
  final GetUserUseCase _getUserUseCase;
}

// ✗ avoid
class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitial()) {
    _getUserUseCase = GetUserUseCase(UserRepositoryImpl(...));
  }
}
```

### Đăng ký mỗi event handler trong constructor bằng `on<EventType>`

```dart
// ✓ ok
UserBloc({...}) : super(const UserInitial()) {
  on<UserFetched>(_onUserFetched);
  on<UserRefreshed>(_onUserRefreshed);
}
```

### Không emit state trong constructor

```dart
// ✗ avoid
UserBloc({...}) : super(const UserInitial()) {
  emit(const UserLoading());   // không được emit trong constructor
}
```

### Luôn `close()` BLoC khi không dùng nữa. Với `BlocProvider`, Flutter tự close

```dart
// ✓ ok — BlocProvider tự close
BlocProvider<UserBloc>(
  create: (_) => sl<UserBloc>(),
  child: const UserPage(),
)

// ✓ ok — manual close khi tạo thủ công
@override
void dispose() {
  _bloc.close();
  super.dispose();
}
```

---

## Clean Architecture

### Domain layer không import bất cứ thứ gì từ `data/` hay `presentation/`

```dart
// ✓ ok — domain/entities/contact_entity.dart
import 'package:equatable/equatable.dart';  // chỉ pure Dart packages

// ✗ avoid
import 'package:example/data/models/contact_model.dart';  // sai dependency
import 'package:flutter/material.dart';                   // domain không biết Flutter
```

### Entity là pure Dart object, không có JSON logic

```dart
// ✓ ok — domain/entities/user.dart
class User extends Equatable {
  const User({required this.id, required this.name, required this.email});
  final String id;
  final String name;
  final String email;
  @override
  List<Object?> get props => [id, name, email];
}

// ✗ avoid — entity có fromJson
class User extends Equatable {
  factory User.fromJson(Map<String, dynamic> json) { ... }  // thuộc về Model
}
```

### Model: Freezed + JSON, chuyển sang Entity bằng `toEntity()` (theo app mẫu)

```dart
// ✓ ok — data/models/contact_model.dart (pattern trong example)
@freezed
abstract class ContactModel with _$ContactModel {
  const ContactModel._();

  const factory ContactModel({
    required String id,
    required String name,
  }) = _ContactModel;

  factory ContactModel.fromJson(Map<String, dynamic> json) =>
      _$ContactModelFromJson(json);

  ContactEntity toEntity() => ContactEntity(id: id, name: name);
}
```

**Tuỳ chọn:** `class UserModel extends User` với `fromJson`/`toJson` vẫn hợp lệ nếu team thống nhất; app mẫu hiện dùng Freezed + `toEntity()`.

### Mỗi UseCase một file, implement `call()` operator

```dart
// ✓ ok — domain/usecases/get_user_usecase.dart
class GetUserUseCase {
  const GetUserUseCase(this._repository);
  final UserRepository _repository;

  Future<Either<Failure, User>> call(String userId) =>
      _repository.getUser(userId);
}

// ✗ avoid — gộp nhiều use case vào 1 class
class UserUseCases {
  Future<Either<Failure, User>> getUser(String id) { ... }
  Future<Either<Failure, void>> updateUser(User user) { ... }
}
```

### Repository implementation xử lý cả remote và local, quyết định nguồn dữ liệu

```dart
// ✓ ok
class UserRepositoryImpl implements UserRepository {
  @override
  Future<Either<Failure, User>> getUser(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final model = await remoteDataSource.getUser(id);
        await localDataSource.cacheUser(model);
        return Right(model);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      try {
        final model = await localDataSource.getCachedUser(id);
        return Right(model);
      } on CacheException catch (e) {
        return Left(CacheFailure(message: e.message));
      }
    }
  }
}
```

---

## Dependency Injection

### Dùng `get_it` + `injectable` như trong `packages/example`

Đăng ký qua annotation (`@injectable`, `@lazySingleton`, module `@module`) và file generate `injection.config.dart`. Entry point: `lib/core/di/injection.dart`.

```dart
// core/di/injection.dart
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final sl = GetIt.instance;

@InjectableInit(
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() => sl.init();
```

```dart
// main.dart — sau khi WidgetsFlutterBinding đảm bảo sẵn sàng
configureDependencies();
```

Sau khi thêm/sửa class có annotation DI, chạy:

```bash
dart run build_runner build --delete-conflicting-outputs
```

**Đăng ký thủ công (mô hình cổ điển):** vẫn có thể dùng `sl.registerLazySingleton` / `registerFactory` trong một file `injection_container.dart` nếu project không dùng injectable — nhưng **app mẫu chuẩn hoá injectable + codegen**.

### BLoC dùng `registerFactory`. Singleton dùng `registerLazySingleton`

```dart
// ✓ ok
sl.registerFactory(() => UserBloc(...));          // mới mỗi route
sl.registerLazySingleton(() => Dio());            // dùng chung toàn app

// ✗ avoid
sl.registerLazySingleton(() => UserBloc(...));    // giữ state cũ
sl.registerFactory(() => Dio());                  // tạo Dio mới mỗi lần
```

### Không khởi tạo dependency trực tiếp bên trong widget hay BLoC

```dart
// ✓ ok
BlocProvider<UserBloc>(
  create: (_) => sl<UserBloc>()..add(const UserFetched(userId: 'abc')),
  child: const UserPage(),
)

// ✗ avoid
BlocProvider<UserBloc>(
  create: (_) => UserBloc(
    getUserUseCase: GetUserUseCase(UserRepositoryImpl(
      remoteDataSource: UserRemoteDataSourceImpl(dio: Dio()),
    )),
  ),
  child: const UserPage(),
)
```

---

## Assets & Theming

### Tên asset file dùng `snake_case`

```text
// ✓ ok
assets/images/ic_arrow_back.png
assets/images/img_onboarding_1.png
assets/animations/lottie_loading.json
assets/api_mocks/chats.json          # mock JSON cho dev — như trong example

// ✗ avoid
assets/images/icArrowBack.png
assets/images/arrow back.png
```

### Không hardcode đường dẫn asset. Dùng class constants

```dart
// core/constants/app_assets.dart
abstract class AppAssets {
  static const String logo         = 'assets/images/logo.png';
  static const String icHome       = 'assets/icons/ic_home.svg';
  static const String animLoading  = 'assets/animations/loading.json';
}

// ✓ ok
Image.asset(AppAssets.logo)

// ✗ avoid
Image.asset('assets/images/logo.png')   // hardcode — dễ typo, khó refactor
```

### Không hardcode màu. Dùng `AppColors`

```dart
// ✓ ok
Container(color: AppColors.primary)
Text('Hello', style: TextStyle(color: AppColors.textSecondary))

// ✗ avoid
Container(color: const Color(0xFF2196F3))
Container(color: Colors.blue)            // không theo design system
```

### Không hardcode `TextStyle`. Dùng `Theme` hoặc `AppTextStyles`

```dart
// ✓ ok
Text('Title', style: context.textTheme.headlineMedium)
Text('Body', style: AppTextStyles.body)

// ✗ avoid
Text('Title', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold))
```

### Không hardcode spacing bằng magic number. Dùng constants

```dart
// core/constants/app_spacing.dart
abstract class AppSpacing {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
}

// ✓ ok
const SizedBox(height: AppSpacing.md)
const EdgeInsets.all(AppSpacing.lg)

// ✗ avoid
const SizedBox(height: 16)
const EdgeInsets.all(24)
```

### Không override theme bằng hardcode tại widget level

```dart
// ✓ ok — định nghĩa 1 lần trong ThemeData
final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
);

// ✗ avoid
AppBar(
  backgroundColor: const Color(0xFF2196F3),  // bỏ qua theme
  titleTextStyle: const TextStyle(fontSize: 18, color: Colors.white),
)
```

---

## Performance

### Không tạo object trong `build()` method

```dart
// ✓ ok
class MyWidget extends StatelessWidget {
  static const _textStyle = TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Text('Hello', style: _textStyle);
  }
}

// ✗ avoid
@override
Widget build(BuildContext context) {
  final style = TextStyle(fontSize: 16);  // tạo mới mỗi rebuild
  return Text('Hello', style: style);
}
```

### Dùng `ListView.builder` thay vì `ListView` với list dài

```dart
// ✓ ok — lazy load
ListView.builder(
  itemCount: users.length,
  itemBuilder: (context, index) => UserCard(user: users[index]),
)

// ✗ avoid — build toàn bộ list cùng lúc
ListView(
  children: users.map((u) => UserCard(user: u)).toList(),
)
```

### Dùng `Visibility` hoặc `Offstage` thay vì `Opacity(opacity: 0)`

```dart
// ✓ ok
Visibility(visible: isVisible, child: MyExpensiveWidget())

// ✓ ok — giữ layout
Offstage(offstage: !isVisible, child: MyExpensiveWidget())

// ✗ avoid — vẫn build và paint
Opacity(opacity: isVisible ? 1.0 : 0.0, child: MyExpensiveWidget())
```

### Dùng `RepaintBoundary` cho widget animation phức tạp

```dart
// ✓ ok
RepaintBoundary(child: AnimatedLoadingSpinner())
```

### Không tính toán nặng trong `build()`. Thực hiện ở BLoC hoặc UseCase

```dart
// ✓ ok — filter và sort ở BLoC, build() nhận kết quả đã tính
@override
Widget build(BuildContext context) {
  return BlocBuilder<UserBloc, UserState>(
    builder: (context, state) {
      if (state is UserLoaded) {
        return ListView.builder(
          itemCount: state.filteredUsers.length,  // đã tính sẵn
          itemBuilder: (_, i) => UserCard(user: state.filteredUsers[i]),
        );
      }
      return const SizedBox.shrink();
    },
  );
}

// ✗ avoid — tính toán trong build()
@override
Widget build(BuildContext context) {
  final activeUsers = allUsers
      .where((u) => u.isActive)
      .sortedBy((u) => u.createdAt)
      .toList();  // tính lại mỗi rebuild
  return ListView.builder(...);
}
```

---

## Testing

### Cấu trúc thư mục test mirror `lib/` theo layer (theo `packages/example`)

```txt
test/
├── data/
│   ├── datasources/app_local_data_source_test.dart
│   ├── models_test.dart
│   └── repositories/
│       ├── auth_repository_impl_test.dart
│       ├── chats_repository_impl_test.dart
│       ├── contacts_repository_impl_test.dart
│       └── profile_repository_impl_test.dart
├── domain/
│   ├── entities_test.dart
│   └── usecases_test.dart
├── presentation/
│   ├── chats_bloc_test.dart
│   ├── contacts_bloc_test.dart
│   ├── login_bloc_test.dart
│   └── …
├── helpers/
│   └── bloc_harness.dart
├── fixtures.dart
├── mocks.dart
├── dio_mock_smoke_test.dart
└── widget_test.dart
```

**Quy ước:** test BLoC có thể đặt phẳng trong `test/presentation/` với tên `*_bloc_test.dart` (như example) hoặc mirror sâu `test/presentation/bloc/<feature>/` nếu team muốn đường dẫn trùng `lib/`.

### Mọi BLoC phải có unit test. Dùng `bloc_test` package

```dart
void main() {
  late UserBloc bloc;
  late MockGetUserUseCase mockGetUserUseCase;

  setUp(() {
    mockGetUserUseCase = MockGetUserUseCase();
    bloc = UserBloc(getUserUseCase: mockGetUserUseCase);
  });

  tearDown(() => bloc.close());

  group('UserFetched', () {
    const tUserId = '1';
    final tUser = User(id: tUserId, name: 'Alice', email: 'alice@test.com');

    blocTest<UserBloc, UserState>(
      'emits [UserLoading, UserLoaded] khi fetch thành công',
      build: () {
        when(() => mockGetUserUseCase(tUserId))
            .thenAnswer((_) async => Right(tUser));
        return bloc;
      },
      act: (bloc) => bloc.add(const UserFetched(userId: tUserId)),
      expect: () => [const UserLoading(), UserLoaded(user: tUser)],
    );

    blocTest<UserBloc, UserState>(
      'emits [UserLoading, UserError] khi server trả về lỗi',
      build: () {
        when(() => mockGetUserUseCase(tUserId))
            .thenAnswer((_) async => Left(ServerFailure(message: 'Server error')));
        return bloc;
      },
      act: (bloc) => bloc.add(const UserFetched(userId: tUserId)),
      expect: () => [const UserLoading(), const UserError(message: 'Server error')],
    );
  });
}
```

### Mọi UseCase phải có unit test

```dart
void main() {
  late GetUserUseCase useCase;
  late MockUserRepository mockRepository;

  setUp(() {
    mockRepository = MockUserRepository();
    useCase = GetUserUseCase(mockRepository);
  });

  test('gọi repository.getUser với đúng id', () async {
    when(() => mockRepository.getUser('1'))
        .thenAnswer((_) async => Right(tUser));
    await useCase('1');
    verify(() => mockRepository.getUser('1')).called(1);
  });
}
```

### Dùng `mocktail` để mock dependency

```dart
// ✓ ok
import 'package:mocktail/mocktail.dart';

class MockUserRepository extends Mock implements UserRepository {}
class MockGetUserUseCase extends Mock implements GetUserUseCase {}
```

### Tên test mô tả rõ hành vi, không chỉ tên method

```dart
// ✓ ok
test('trả về UserLoaded khi fetch user thành công', () { ... });
test('trả về UserError với message phù hợp khi server error', () { ... });
test('không gọi API khi không có kết nối mạng', () { ... });

// ✗ avoid
test('getUser', () { ... });
test('test 1', () { ... });
test('success case', () { ... });
```

### Coverage tối thiểu theo layer

| Layer | Coverage tối thiểu |
| --- | --- |
| Domain — Entities, UseCases | 90% |
| Data — Repositories, Models | 80% |
| Presentation — BLoC | 80% |
| Core — Utils, Extensions | 70% |
| Widgets | 50% |

---

## Git & PR

### Tên branch theo format: `type/TICKET-short-description`

```text
// ✓ ok
feature/USR-123-add-user-profile
bugfix/USR-456-fix-login-crash
hotfix/USR-789-null-pointer-home
refactor/USR-012-clean-auth-bloc
chore/update-flutter-3-24

// ✗ avoid
fix-login
my-feature
USR-123
update
```

### Commit message theo format: `type(scope): mô tả ngắn`

Không viết hoa chữ đầu. Không có dấu chấm cuối. Tối đa 72 ký tự.

```text
// ✓ ok
feat(auth): add biometric login support
fix(user): resolve null pointer on profile page
refactor(bloc): simplify state management in chat
test(order): add unit tests for create order use case
chore(deps): upgrade flutter to 3.24.0
docs: update clean code rules
style: apply dart format to auth module
perf(list): replace ListView with ListView.builder

// ✗ avoid
Fix login bug                    // không có type/scope
feat: Added new feature.         // viết hoa + dấu chấm cuối
update stuff                     // không mô tả gì
WIP                              // không commit WIP lên main/develop
```

| Type | Khi nào dùng |
| --- | --- |
| `feat` | Tính năng mới |
| `fix` | Bug fix |
| `refactor` | Refactor — không thêm feature, không fix bug |
| `test` | Thêm hoặc sửa test |
| `chore` | Update deps, config, tooling |
| `docs` | Chỉ cập nhật documentation |
| `style` | Format code, không đổi logic |
| `perf` | Cải thiện performance |
| `revert` | Revert commit trước |

### Mỗi commit chứa 1 thay đổi logic. Không commit nhiều feature cùng lúc

```text
// ✓ ok — 3 commit riêng biệt, rõ ràng
feat(auth): add login API integration
test(auth): add unit tests for login use case
chore: add mocktail dependency

// ✗ avoid — 1 commit làm quá nhiều
feat: add login, fix profile bug, update deps, refactor home
```

### PR không được merge nếu chưa pass checklist

- [ ] `dart analyze` — 0 error, 0 warning
- [ ] `dart format .` — không có diff
- [ ] `flutter test` — tất cả pass
- [ ] Coverage không giảm so với base branch
- [ ] Không có `print()` statement
- [ ] Không có hardcode string, màu, magic number
- [ ] Không có `TODO` mới chưa có ticket
- [ ] Không có code bị comment out
- [ ] Đã self-review toàn bộ diff
- [ ] Đã thêm/cập nhật test cho code mới
- [ ] PR description giải thích **tại sao** thay đổi, không chỉ **cái gì**

### PR phải có ít nhất 1 reviewer approve trước khi merge

### Không squash commit khi merge vào `develop`. Squash khi merge vào `main`

---

## Tooling

### `analysis_options.yaml`

App mẫu hiện chỉ `include: package:flutter_lints/flutter.yaml`. Dưới đây là **bộ rule gợi ý** khi team muốn thắt chặt (merge từng mục, tránh bật `always_use_package_imports` nếu vẫn dùng relative nội bộ layer như trong example).

```yaml
include: package:flutter_lints/flutter.yaml

analyzer:
  language:
    strict-casts: true
    strict-raw-types: true
    strict-inference: true
  errors:
    missing_required_param: error
    missing_return: error
    dead_code: warning
    todo: ignore
  exclude:
    - "**/*.g.dart"
    - "**/*.freezed.dart"
    - "**/*.gr.dart"

linter:
  rules:
    always_declare_return_types: true
    always_use_package_imports: true
    avoid_dynamic_calls: true
    avoid_print: true
    avoid_redundant_argument_values: true
    avoid_unused_constructor_parameters: true
    cancel_subscriptions: true
    close_sinks: true
    directives_ordering: true
    prefer_const_constructors: true
    prefer_const_constructors_in_immutables: true
    prefer_const_declarations: true
    prefer_const_literals_to_create_immutables: true
    prefer_final_fields: true
    prefer_final_in_for_each: true
    prefer_final_locals: true
    prefer_single_quotes: true
    sort_pub_dependencies: true
    unawaited_futures: true
    unnecessary_lambdas: true
    unnecessary_async: true
    use_super_parameters: true
```

### Chạy các lệnh sau trước mỗi commit

```bash
dart format .        # format code
dart analyze         # kiểm tra lỗi
flutter test         # chạy tests
```

### Makefile — thêm vào root project

```makefile
.PHONY: check format analyze test build-runner clean

check: format analyze test

format:
 dart format .

analyze:
 dart analyze --fatal-infos

test:
 flutter test --coverage

build-runner:
 dart run build_runner build --delete-conflicting-outputs

watch:
 dart run build_runner watch --delete-conflicting-outputs

clean:
 flutter clean && flutter pub get
```

### Recommended packages cho mọi project

| Mục đích | Package |
| --- | --- |
| State management | `flutter_bloc`, `equatable` |
| DI | `get_it`, `injectable` |
| Functional error handling | `fpdart` |
| HTTP client | `dio` |
| Local storage | `hive_flutter` |
| Routing | `go_router` |
| Code generation | `freezed`, `json_serializable` |
| Testing | `bloc_test`, `mocktail` |
| Logging | `logger` |
| Linting | `flutter_lints`, `very_good_analysis` |

---

## Quick Reference

| Rule | Quy tắc |
| --- | --- |
| Folder / File | `snake_case` |
| Class / Enum / Extension | `UpperCamelCase` |
| Variable / Function / Param | `lowerCamelCase` |
| Constant | `lowerCamelCase` + `const` |
| Private member | prefix `_` |
| Import order | `dart:` → `flutter/` → 3rd-party → internal → relative |
| Max file | 300 dòng |
| Max class | 200 dòng |
| Max function | 40 dòng |
| Max params | 5 — dùng object nếu hơn |
| Const widget | Bắt buộc khi có thể |
| `dynamic` | Chỉ dùng cho JSON parsing |
| `print()` | Cấm — dùng `log()` |
| Hardcode color / string / spacing | Cấm — dùng constants |
| Null assertion `!` | Hạn chế tối đa |
| `async` không có `await` | Cấm |
| Silent catch | Cấm |
| Comment code out | Cấm commit |
| Commit WIP | Cấm lên main/develop |
| Test BLoC | Bắt buộc |
| Test UseCase | Bắt buộc |
| Coverage BLoC / UseCase | ≥ 80% |

---

> *"Clean code is not written by following a set of rules. You don't become a software craftsman by learning a list of heuristics. Professionalism and craftsmanship come from values that drive disciplines."*  
> — Robert C. Martin

*Document này được review và cập nhật theo từng major Flutter version. Mọi đề xuất thay đổi rule phải tạo PR riêng, mô tả lý do, và được ít nhất 2 thành viên senior approve.*
