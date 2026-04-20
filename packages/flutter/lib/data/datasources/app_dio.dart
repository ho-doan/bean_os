import 'package:dio/dio.dart';

import '../api/app_api.dart';
import 'asset_api_mocks_interceptor.dart';

/// Dio + JSON mocks: same route schema as [dio_mock_interceptor](https://pub.dev/packages/dio_mock_interceptor),
/// loaded from `assets/api_mocks/` (explicit paths; works in `flutter test`).
Dio createAppDio() {
  final dio = Dio(
    BaseOptions(
      baseUrl: '${AppApi.base}/',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );
  dio.interceptors.add(AssetApiMocksInterceptor());
  return dio;
}
