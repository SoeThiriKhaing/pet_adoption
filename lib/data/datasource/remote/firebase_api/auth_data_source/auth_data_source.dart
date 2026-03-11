import '../../../../model/user/user.dart';

abstract interface class AuthDataSource {
  Future<UserModel> getUser(String userId);
  Future<UserModel> signUp({
    required String email,
    required String password,
    required String userName,
  });

  Future<UserModel> signIn({
    required String email,
    required String password,
  });



  Future<void> signOut();
}


