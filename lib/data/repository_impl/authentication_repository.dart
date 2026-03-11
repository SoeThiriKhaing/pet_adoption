import 'package:injectable/injectable.dart';

import '../../core/exceptions/firebase_exception.dart';
import '../../domain/entity/user.dart';
import '../../domain/repository/authentication_repository.dart';
import '../datasource/remote/firebase_api/auth_data_source/auth_data_source.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _userDataSource;

  AuthRepositoryImpl(this._userDataSource);

  @override
  Future<UserEntity> signUp({
    required String email,
    required String password,
    required String userName,
  }) async {
    try {
      return await _userDataSource.signUp(
        email: email,
        password: password,
        userName: userName,
      );
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<UserEntity> signIn({
    required String email,
    required String password,
  }) async {
    try {
      return await _userDataSource.signIn(
        email: email,
        password: password,
      );
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }


  @override
  Future<void> signOut() async {
    try {
      await _userDataSource.signOut();
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<UserEntity> getUser(String userId) async {
    try {
      return await _userDataSource.getUser(userId);
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }
}
