import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:pet/adopt_pet.dart';

@LazySingleton(as: PetRepository)
class PetRepoImpl implements PetRepository {
  final FirebaseFirestore _firestore;

  PetRepoImpl(this._firestore);

  @override
  Future<PetEntity> addPet(PetEntity pet) async {
    final model = PetModel.fromEntity(pet);
    final docRef = await _firestore.collection('pets').add(model.toFirestore());
    return model.copyWith(id: docRef.id);
  }

  @override
  Stream<List<PetEntity>> getPets(String? category) {
    Query query = _firestore
        .collection('pets')
        .orderBy('createdAt', descending: true);
    if (category != null && category != 'All') {
      query = query.where('category', isEqualTo: category);
    }
      return query.snapshots().map((snapshot) {
        return snapshot.docs.map((doc) => PetModel.fromFirebaseDocument(doc)).toList();
      });
    }
  }

