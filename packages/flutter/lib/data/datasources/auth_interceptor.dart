import 'package:dio/dio.dart';

/// Interceptor gắn JWT Bearer cho request API.
///
/// - [readAccessToken]: hàm lấy access token hiện tại (nullable).
/// - [onUnauthorized]: callback khi server trả 401.
class AuthInterceptor extends QueuedInterceptorsWrapper {
  AuthInterceptor({
    required String? Function() readAccessToken,
    Future<void> Function()? onUnauthorized,
  }) : _readAccessToken = readAccessToken,
       _onUnauthorized = onUnauthorized;

  final String? Function() _readAccessToken;
  final Future<void> Function()? _onUnauthorized;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = _readAccessToken();
    final hasAuthorization = options.headers.containsKey('Authorization');

    if (!hasAuthorization && token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 && _onUnauthorized != null) {
      await _onUnauthorized.call();
    }
    handler.next(err);
  }
}
