import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../adopt_pet.dart';

part 'register_state.dart';

part 'register_cubit.freezed.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final SignUpUseCase _signUpUseCase;
  final AuthenticationCubit _auth;

  RegisterCubit(this._signUpUseCase, this._auth)
    : super(const RegisterInitail());

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(RegisterLoading());

    final result = await _signUpUseCase(
      SignUpParams(email: email, password: password, userName: name),
    );
    result.onSuccess((user) {
      _auth.authenticateUser(user: user);
      emit(const RegisterSuccess());
    });
    result.onError((failure) {
      emit(RegisterError(failure.reason));
    });
  }
}
