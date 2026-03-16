import '../core.dart';
import '../failures/failures.dart';

abstract class RemoteException implements Exception {
  final String message;
  final String? codeStatus;

  const RemoteException(this.message, [this.codeStatus]);

  Failure toFailure([String? reason]) => ConnectionFailure(reason ?? message);
}

final class NotFoundException extends RemoteException {
  const NotFoundException(super.message, [super.statusCode]);

  @override
  Failure toFailure([String? reason]) => NotFoundFailure(reason ?? message);
}

final class InternetConnectionException extends RemoteException {
  const InternetConnectionException(super.message, [super.codeStatus]);

  @override
  Failure toFailure([String? reason]) => ConnectionFailure(reason ?? message);
}

final class TimeoutException extends RemoteException {
  const TimeoutException(super.message, [super.codeStatus]);

  @override
  Failure toFailure([String? reason]) => TimeoutFailure(reason ?? message);
}

final class BadRequestException extends RemoteException {
  const BadRequestException(super.message, [super.statusCode]);

  @override
  Failure toFailure([String? reason]) => BadReqFailure(reason ?? message);
}

class UnAuthorizedException extends RemoteException {
  const UnAuthorizedException(super.message, [super.statusCode]);

  @override
  Failure toFailure([String? reason]) => SessionFailure(reason ?? message);
}

final class ServerException extends RemoteException {
  const ServerException(super.message, [super.statusCode]);

  @override
  Failure toFailure([String? reason]) => ServerFailure(reason ?? message);
}

final class UnknownNetworkException extends RemoteException {
  const UnknownNetworkException(super.message, [super.statusCode]);

  @override
  Failure toFailure([String? reason]) =>
      UnknownNetworkFailure(reason ?? message);
}

final class SystemMaintenanceException extends ServerException {
  const SystemMaintenanceException(super.message, [super.statusCode]);

  @override
  Failure toFailure([String? reason]) => ServerFailure(reason ?? message);
}

final class PermissionDeniedException extends ServerException {
  const PermissionDeniedException(super.message, [super.statusCode]);

  @override
  Failure toFailure([String? reason]) => PermissionFailure(reason ?? message);
}

final class ConnectionClosedException extends ServerException {
  const ConnectionClosedException(super.message, [super.statusCode]);

  @override
  Failure toFailure([String? reason]) =>
      ConnectionClosedFailure(reason ?? message);
}
