const String kApiUrl = String.fromEnvironment('API_URL');
const String kAppName = String.fromEnvironment('APP_NAME');
const String kWsUrl = String.fromEnvironment('WS_URL');

class Env {
  const Env();

  static String get apiUrl => kApiUrl;
  static String get appName => kAppName;
  static String get wsUrl => kWsUrl;
}
