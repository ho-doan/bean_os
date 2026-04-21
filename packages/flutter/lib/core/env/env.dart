const String kApiUrl = String.fromEnvironment('API_URL');
const String kAppName = String.fromEnvironment('APP_NAME');

class Env {
  const Env();

  static String get apiUrl => kApiUrl;
  static String get appName => kAppName;
}
