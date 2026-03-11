import 'package:injectable/injectable.dart';
import '../../../core/core.dart';
import '../../entity/user.dart';
import '../../repository/authentication_repository.dart';

class GetUserParam {
  final String userId;

  const GetUserParam({
    required this.userId,
  });
}

@lazySingleton
class GetUserUseCase implements UseCase<DataState<UserEntity>, GetUserParam> {
  final AuthRepository _repository;

  const GetUserUseCase(this._repository);

  @override
  Future<DataState<UserEntity>> call(GetUserParam param) async {
    try {
      return Success(await _repository.getUser(param.userId));
    } on RemoteException catch (e) {
      return Failed(e.toFailure());
    }
  }
}
