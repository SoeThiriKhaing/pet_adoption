import '../core.dart';
import '../failures/failures.dart';

sealed class OtpException implements Exception {
  final String message;

  const OtpException(this.message);

  Failure toFailure([String? reason]) => OtpFailure(reason ?? message);
}

class OtpNotFoundException extends OtpException {
  OtpNotFoundException() : super("OTP record not found");

  @override
  Failure toFailure([String? reason]) => OtpNotFoundFailure();
}

class OtpExpiredException extends OtpException {
  OtpExpiredException() : super("OTP has expired");

  @override
  Failure toFailure([String? reason]) => OtpExpiredFailure();
}

class WrongOtpCodeException extends OtpException {
  WrongOtpCodeException() : super("Wrong OTP code");

  @override
  Failure toFailure([String? reason]) => WrongOtpCodeFailure();
}
