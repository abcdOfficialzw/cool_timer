import 'dart:io';

class AppUrls {
  static String BASE_URL = Platform.isAndroid
      ? "https://8b7b-196-41-88-4.ngrok-free.app"
      : "http://127.0.0.1:5000";
  static Auth auth = Auth();
}

class Auth {
  Auth();
  final String login = "${AppUrls.BASE_URL}/auth/login";
}
