import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../adopt_pet.dart';

@LazySingleton(as: FavoriteRepository)
class FavoriteRepoImpl implements FavoriteRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  FavoriteRepoImpl(this._firestore, this._auth);

  String get _uid=>_auth.currentUser!.uid;

  @override
  Stream<List<PetEntity>> getFavoritePets() {
    return _firestore
        .collection('users')
        .doc(_uid)
        .collection('favorites')
        .snapshots()
        .asyncMap((snapshot) async {
      final ids = snapshot.docs.map((doc) => doc.id).toList();
      if (ids.isEmpty) return [];

      final petsQuery = await _firestore
          .collection('pets')
          .where(FieldPath.documentId, whereIn: ids)
          .get();

      return petsQuery.docs.map((doc) => PetModel.fromFirebaseDocument(doc, isFavorite: true)).toList();
    });
  }

  @override
  Future<void> toggleFavorite(String petId, bool isFavorite) async {
    final favRef = _firestore
        .collection('users')
        .doc(_uid)
        .collection('favorites')
        .doc(petId);
    if (isFavorite) {
      await favRef.set({
        'petId': petId,
        'addedAt': FieldValue.serverTimestamp(),
      });
    } else {
      await favRef.delete();
    }
  }
}
