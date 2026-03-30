import 'package:injectable/injectable.dart';

import '../../../adopt_pet.dart';

@lazySingleton
class ContactAdminUseCase {
  final PetRepository _repository;

  ContactAdminUseCase(this._repository);

  Future<void> call() => _repository.contactAdminViaCall();

  Future<void> email(String petName) =>
      _repository.contactAdminViaEmail(petName);
}
