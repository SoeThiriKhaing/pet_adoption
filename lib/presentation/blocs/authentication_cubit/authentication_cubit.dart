import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../adopt_pet.dart';
part 'authentication_state.dart';

part 'authentication_cubit.freezed.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final AppStorage _storage;
  final SignOutUseCase _signOutUseCase;
  final GetUserUseCase _getUserUseCase;
  final ISnackShower _snack;

  AuthenticationCubit(
    this._storage,
    this._signOutUseCase,
    this._getUserUseCase,
    this._snack,
  ) : super(const AuthenticationState.initial());

  UserEntity? get user => switch (state) {
        AuthenticationAuthenticated(user: final user) => user,
        _ => null
      };

  Future<void> loadData() async {
    final user = await _storage.getSavedUserInfo();
    if (user != null) {
      final res = await _getUserUseCase(GetUserParam(userId: user.id));

      res
        ..onSuccess((user) {
          authenticateUser(user: user);
        })
        ..onError((failure) {
          _snack.info(message: failure.reason);
        });
    }
  }

  Future<void> authenticateUser({
    required UserEntity user,
  }) async {
    _storage.saveUserInfo(user);
    emit(AuthenticationState.authenticated(user: user));
  }

  Future<void> logOut() async {
    await _storage.torchAllLocalUserData();
    await _signOutUseCase();
    emit(const AuthenticationState.initial());
  }
}
