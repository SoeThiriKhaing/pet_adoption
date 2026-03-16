import '../core.dart';

class AppFailure extends Failure {
  const AppFailure([super.reason = "App Failure"]);
}

class NoContentFailure extends AppFailure {
  const NoContentFailure([super.reason = "Not Content"]);
}

class AuthenticationRequiredFailure extends AppFailure {
  const AuthenticationRequiredFailure(
      [super.reason = "Authentication required"]);
}

class LogicFailure extends AppFailure {
  const LogicFailure([super.reason = "Logic Failure"]);
}
