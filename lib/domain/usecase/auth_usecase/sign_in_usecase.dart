import 'package:injectable/injectable.dart';
import '../../../core/core.dart';
import '../../entity/user.dart';
import '../../repository/authentication_repository.dart';

class SignInParams {
  final String email;
  final String password;

  SignInParams({
    required this.email,
    required this.password,
  });
}

@lazySingleton
class SignInUseCase implements UseCase<DataState<UserEntity>, SignInParams> {
  final AuthRepository _repository;

  const SignInUseCase(this._repository);

  @override
  Future<DataState<UserEntity>> call(SignInParams param) async {
    try {
      return Success(await _repository.signIn(
        email: param.email,
        password: param.password,
      ));
    } on RemoteException catch (e) {
      return Failed(e.toFailure());
    }
  }
}
