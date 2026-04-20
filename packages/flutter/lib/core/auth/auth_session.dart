class AuthSession {
  AuthSession._();

  static String? _accessToken;

  static String? get accessToken => _accessToken;

  static bool get isAuthenticated =>
      _accessToken != null && _accessToken!.isNotEmpty;

  static void setAccessToken(String? token) {
    if (token == null || token.isEmpty) {
      _accessToken = null;
      return;
    }
    _accessToken = token;
  }

  static void clear() {
    _accessToken = null;
  }
}
