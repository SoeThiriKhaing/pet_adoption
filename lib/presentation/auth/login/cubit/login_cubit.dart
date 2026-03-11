import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../adopt_pet.dart';

part 'login_state.dart';

part 'login_cubit.freezed.dart';
@injectable
class LoginCubit extends Cubit<LoginState> {
  final SignInUseCase _signInUseCase;
  final AuthenticationCubit _auth;

  LoginCubit(this._signInUseCase, this._auth) : super(const LoginInitial());

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    final result = await _signInUseCase(
      SignInParams(email: email, password: password),
    );
    result.onSuccess((user) {
      _auth.authenticateUser(user: user);
      emit(LoginSuccess());
      result.onError((failure) {
        emit(LoginError(failure.reason));
      });
    });
  }
}
