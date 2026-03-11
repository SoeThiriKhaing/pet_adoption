import 'package:injectable/injectable.dart';
import '../../../core/core.dart';
import '../../entity/user.dart';
import '../../repository/authentication_repository.dart';

class SignUpParams {
  final String email;
  final String password;
  final String userName;

  SignUpParams({
    required this.email,
    required this.password,
    required this.userName,
  });
}

@lazySingleton
class SignUpUseCase implements UseCase<DataState<UserEntity>, SignUpParams> {
  final AuthRepository _repository;

  const SignUpUseCase(this._repository);

  @override
  Future<DataState<UserEntity>> call(SignUpParams param) async {
    try {
      return Success(await _repository.signUp(
        email: param.email,
        password: param.password,
        userName: param.userName,
      ));

    } on RemoteException catch (e) {
      return Failed(e.toFailure());
    }
  }
}
