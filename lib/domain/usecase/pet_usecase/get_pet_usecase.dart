import 'package:injectable/injectable.dart';
import 'package:pet/adopt_pet.dart';

@lazySingleton
class GetPetsUseCase {
  final PetRepository _repository;

  const GetPetsUseCase(this._repository);

  Stream<List<PetEntity>> call(String? category) {

    final String? filterCategory = (category == 'All' || category == null)
        ? null
        : category;

    return _repository.getPets(filterCategory);
  }
}