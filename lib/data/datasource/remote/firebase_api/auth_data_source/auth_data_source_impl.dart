import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import '../../../../model/user/user.dart';
import 'auth_data_source.dart';

@LazySingleton(as: AuthDataSource)
class FirebaseUserDataSource implements AuthDataSource {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;
  final Logger _logger;
  FirebaseUserDataSource(
    this._firebaseAuth,
    this._firebaseFirestore,
    this._logger,
  );
  @override
  Future<UserModel> signUp({
    required String email,
    required String password,
    required String userName,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      final firebaseUser = _firebaseAuth.currentUser;
      if (firebaseUser == null) throw Exception('User is null after sign-up');

      final timeStamp = Timestamp.now();
      final userRef =
          _firebaseFirestore.collection('users').doc(firebaseUser.uid);
      await userRef.set({
        'id': firebaseUser.uid,
        'email': email,
        'userName': userName,
        'lastLogin': timeStamp,
        'createdAt': timeStamp,
      });

      return UserModel(
        id: firebaseUser.uid,
        userName: userName,
        email: email,
      );
    } catch (e) {
      _logger.e('Error during sign-up: $e');
      throw Exception(e.toString().contains('A network error')
          ? 'Please check your internet connection'
          : e.toString());
    }
  }

  @override
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      final documentRef =
          _firebaseFirestore.collection('users').doc(credential.user!.uid);
      final document = await documentRef.get();

      if (!document.exists) {
        throw Exception('Document does not exist on the database');
      }

      documentRef.update({
        'lastLogin': Timestamp.now(),
      });

      final user = UserModel.fromFirebaseDocument(document);

      _logger.d(user);
      return user;
    } catch (e) {
      _logger.e('Sign-in error: $e');
      if (e.toString().contains(
          'The supplied auth credential is incorrect, malformed or has expired')) {
        throw Exception('Wrong Email or Password');
      } else if (e.toString().contains('A network error')) {
        throw Exception('Please check your internet connection');
      } else {
        throw Exception(e.toString());
      }
    }
  }

  @override
  Future<UserModel> getUser(String userId) async {
    try {
      final documentRef = _firebaseFirestore.collection('users').doc(userId);

      final document = await documentRef.get();
      if (!document.exists) {
        throw Exception('Document does not exist on the database');
      }

      documentRef.update({
        'lastLogin': Timestamp.now(),
      });

      final user = UserModel.fromFirebaseDocument(document);
      _logger.d(user);
      return user;
    } catch (e) {
      _logger.e('Get user error: $e');
      throw Exception(e.toString().contains('A network error')
          ? 'Please check your internet connection'
          : e.toString());
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    _logger.d('Sign Out Success');
  }
}
