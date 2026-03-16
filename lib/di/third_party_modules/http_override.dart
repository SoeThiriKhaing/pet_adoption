import 'dart:io';

/// Bypasses SSL certificate verification (for development/testing only).
/// WARNING: Never use in production.
class UnverifiedHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = _allowAllCertificates;
  }

  static bool _allowAllCertificates(
    X509Certificate cert,
    String host,
    int port,
  ) => true;
}
