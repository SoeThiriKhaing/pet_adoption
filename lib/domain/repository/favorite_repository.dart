import 'package:pet/adopt_pet.dart';

abstract class FavoriteRepository {
  Future<void> toggleFavorite(String petId, bool isFavorite);
  Stream<List<PetEntity>> getFavoritePets();

}