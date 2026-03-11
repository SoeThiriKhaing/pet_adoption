import 'package:injectable/injectable.dart';
import '../../../core/core.dart';
import '../../repository/authentication_repository.dart';

@lazySingleton
class SignOutUseCase implements UseCase<DataState<void>, void> {
  final AuthRepository _repository;

  const SignOutUseCase(this._repository);

  @override
  Future<DataState<void>> call([void param]) async {
    try {
      return Success(await _repository.signOut());
    } on RemoteException catch (e) {
      return Failed(e.toFailure());
    }
  }
}
