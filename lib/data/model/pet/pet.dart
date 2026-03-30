import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../adopt_pet.dart';

part 'pet.freezed.dart';
part 'pet.g.dart';

@freezed
abstract class PetModel with _$PetModel implements PetEntity {
  const factory PetModel({
    required String id,
    required String name,
    required String category,
    required String breed,
    required int age,
    required String imageUrl,
    required DateTime? createdAt,
    @Default(false) bool isFavorite,
  }) = _PetModel;

  factory PetModel.fromJson(Map<String, dynamic> json) =>
      _$PetModelFromJson(json);

  factory PetModel.fromFirebaseDocument(DocumentSnapshot document, {required bool isFavorite}) {
    final data = document.data() as Map<String, dynamic>?;

    return PetModel(
      id: document.id,
      name: data?['name'] ?? '',
      category: data?['category'] ?? '',
      breed: data?['breed'] ?? '',
      age: data?['age'] ?? 0,
      imageUrl: data?['imageUrl'] ?? '',
      createdAt: (data?['createdAt'] as Timestamp?)?.toDate(),
      isFavorite: data?['isFavorite'] ?? false,
    );
  }

  factory PetModel.fromEntity(PetEntity pet) {
    return PetModel(
      id: pet.id,
      name: pet.name,
      category: pet.category,
      breed: pet.breed,
      age: pet.age,
      imageUrl: pet.imageUrl,
      createdAt: pet.createdAt,
      isFavorite: pet.isFavorite,
    );
  }
}

extension PetModelX on PetModel {
  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'category': category,
      'breed': breed,
      'age': age,
      'imageUrl': imageUrl,
      'createdAt': createdAt != null ? Timestamp.fromDate(createdAt!) : FieldValue.serverTimestamp(),
      'isFavorite': isFavorite,
    };
  }
}