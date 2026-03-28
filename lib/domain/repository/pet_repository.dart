import 'package:pet/adopt_pet.dart';

abstract class PetRepository {
  Future<PetEntity> addPet(PetEntity pet);
  Stream<List<PetEntity>> getPets(String? category);
}