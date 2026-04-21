import 'package:dio/dio.dart';
import 'package:example/core/env/env.dart';

import 'auth_interceptor.dart';

Dio createAppDio({
  String? Function()? readAccessToken,
  Future<void> Function()? onUnauthorized,
}) {
  final dio = Dio(
    BaseOptions(
      baseUrl: Env.apiUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );
  dio.interceptors.add(
    AuthInterceptor(
      readAccessToken: readAccessToken ?? () => null,
      onUnauthorized: onUnauthorized,
    ),
  );
  dio.interceptors.add(
    LogInterceptor(
      requestBody: true,
      responseBody: true,
      error: true,
      requestHeader: true,
      responseHeader: true,
    ),
  );
  return dio;
}
