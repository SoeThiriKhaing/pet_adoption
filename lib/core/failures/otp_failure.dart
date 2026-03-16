import '../../core/core.dart';

class OtpFailure extends Failure {
  OtpFailure(super.reason);
}

class OtpNotFoundFailure extends Failure {
  OtpNotFoundFailure() : super("OTP record not found");
}

class OtpExpiredFailure extends Failure {
  OtpExpiredFailure() : super("OTP has expired");
}

class WrongOtpCodeFailure extends Failure {
  WrongOtpCodeFailure() : super("Wrong OTP code");
}
