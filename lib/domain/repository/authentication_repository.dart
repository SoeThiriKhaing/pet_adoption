
import '../entity/user.dart';

abstract class AuthRepository {
  Future<UserEntity> getUser(String userId);

  Future<UserEntity> signUp({
    required String email,
    required String password,
    required String role,
    String? organization,
    required String userName,
  });

  Future<UserEntity> signIn({
    required String email,
    required String password,
  });


  Future<void> signOut();
}
