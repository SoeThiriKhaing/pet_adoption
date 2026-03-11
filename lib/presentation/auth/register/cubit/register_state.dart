part of 'register_cubit.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = RegisterInitail;
  const factory RegisterState.loading() = RegisterLoading;
  const factory RegisterState.success() = RegisterSuccess;
  const factory RegisterState.error(String message) = RegisterError;




}
