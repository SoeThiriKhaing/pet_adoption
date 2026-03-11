part of 'authentication_cubit.dart';

@freezed
sealed class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.initial() = AuthenticationInitial;
  const factory AuthenticationState.authenticated({
    required UserEntity user,
  }) = AuthenticationAuthenticated;
}
