import 'package:injectable/injectable.dart';
import 'package:pet/adopt_pet.dart';

@lazySingleton
class ToggleFavoriteUseCase {
  final FavoriteRepository _repository;
  ToggleFavoriteUseCase(this._repository);

  Future<void> call(String petId, bool isFavorite) {
    return _repository.toggleFavorite(petId, isFavorite);
  }
}