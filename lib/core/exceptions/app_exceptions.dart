import '../failures/failures.dart';

abstract class AppExceptions implements Exception {
  final String message;
  final String? codeStatus;
  const AppExceptions(this.message, [this.codeStatus]);

  AppFailure toFailure([String? reason]) => AppFailure(reason ?? message);
}

class NoContentException extends AppExceptions {
  const NoContentException(super.message, [super.codeStatus]);

  @override
  AppFailure toFailure([String? reason]) => NoContentFailure(message);
}

class AuthenticationRequiredException extends AppExceptions {
  const AuthenticationRequiredException(super.message, [super.codeStatus]);
  
  @override
  AppFailure toFailure([String? reason]) => AuthenticationRequiredFailure(message);
}