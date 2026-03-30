import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:pet/adopt_pet.dart';
import 'package:url_launcher/url_launcher.dart';

@LazySingleton(as: PetRepository)
class PetRepoImpl implements PetRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  PetRepoImpl(this._firestore, this._auth);

  String get _uid => _auth.currentUser!.uid;

  @override
  Future<PetEntity> addPet(PetEntity pet) async {
    final model = PetModel.fromEntity(pet);
    final docRef = await _firestore.collection('pets').add(model.toFirestore());
    return model.copyWith(id: docRef.id);
  }

  // @override
  // Stream<List<PetEntity>> getPets(String? category) {
  //   Query query = _firestore
  //       .collection('pets')
  //       .orderBy('createdAt', descending: true);
  //   if (category != null && category != 'All') {
  //     query = query.where('category', isEqualTo: category);
  //   }
  //   return query.snapshots().map((snapshot) {
  //     return snapshot.docs.map((doc) =>
  //         PetModel.fromFirebaseDocument(doc, isFavorite:)).toList();
  //   });
  // }

  @override
  Stream<List<PetEntity>> getPets(String? category) {
    Query query = _firestore
        .collection('pets')
        .orderBy('createdAt', descending: true);

    if (category != null && category != 'All') {
      query = query.where('category', isEqualTo: category);
    }

    return query.snapshots().asyncMap((petSnapshot) async {
      final favSnapshot = await _firestore
          .collection('users')
          .doc(_uid)
          .collection('favorites')
          .get();

      final favoriteIds = favSnapshot.docs.map((doc) => doc.id).toSet();

      return petSnapshot.docs.map((doc) {
        final isFav = favoriteIds.contains(doc.id);
        return PetModel.fromFirebaseDocument(doc, isFavorite: isFav);
      }).toList();
    });
  }

  @override
  Future<void> contactAdminViaCall() async {
    final Uri url = Uri.parse('tel:09698508375');
    if (await canLaunchUrl(url)) await launchUrl(url);
  }

  @override
  Future<void> contactAdminViaEmail(String petName) async {
    final Uri url = Uri.parse(
      'mailto:soethirikhaing846@gmail.com?subject=Adoption Inquiry: $petName&body=I am interested in $petName.',
    );
    if (await canLaunchUrl(url)) await launchUrl(url);
  }
}
