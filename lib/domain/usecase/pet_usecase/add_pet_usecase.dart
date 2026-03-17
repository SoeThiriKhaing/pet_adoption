import 'package:injectable/injectable.dart';
import 'package:pet/adopt_pet.dart';

class AddPetParam {
  final String name;
  final String category;
  final String breed;
  final int age;
  final String imageUrl;
  final DateTime? createdAt;

  AddPetParam({
    required this.name,
    required this.category,
    required this.breed,
    required this.age,
    required this.imageUrl,
    this.createdAt,
  });
}

@lazySingleton
class AddPetUseCase implements UseCase<DataState<PetEntity>, AddPetParam> {
  final PetRepository _repository;

  const AddPetUseCase(this._repository);

  @override
  Future<DataState<PetEntity>> call(AddPetParam param) async {
    try {
      final pets = PetEntity(
        id: '',
        name: param.name,
        category: param.category,
        breed: param.breed,
        age: param.age,
        imageUrl: param.imageUrl,
        createdAt: param.createdAt ?? DateTime.now(),
      );
      final petEntity = await _repository.addPet(pets);


      return Success(petEntity);

    } on RemoteException catch (e) {
      return Failed(e.toFailure());
    } catch (e) {
      rethrow;
    }
  }
}