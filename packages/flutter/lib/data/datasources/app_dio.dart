import 'package:dio/dio.dart';
import 'package:example/core/env/env.dart';

/// Dio + JSON mocks: same route schema as [dio_mock_interceptor](https://pub.dev/packages/dio_mock_interceptor),
/// loaded from `assets/api_mocks/` (explicit paths; works in `flutter test`).
Dio createAppDio() {
  final dio = Dio(
    BaseOptions(
      baseUrl: Env.apiUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );
  // dio.interceptors.add(AssetApiMocksInterceptor());
  return dio;
}
