import 'package:injectable/injectable.dart';
import '../../../adopt_pet.dart';
import 'authentication_cubit.dart';

@module
abstract class AuthenticationCubitProvider {
  @preResolve
  @singleton
  Future<AuthenticationCubit> provide(
    AppStorage storage,
    SignOutUseCase signOutUsecase,
    GetUserUseCase getUserUsecase,
    ISnackShower snack,
  ) async {
    final instance = AuthenticationCubit(
      storage,
      signOutUsecase,
      getUserUsecase,
      snack,
    );
    await instance.loadData();
    return instance;
  }
}
