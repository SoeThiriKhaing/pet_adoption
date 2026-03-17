import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../adopt_pet.dart';

part 'add_pet_state.dart';
part 'add_pet_cubit.freezed.dart';

@injectable
class AddPetCubit extends Cubit<AddPetState> {
  final AddPetUseCase _addPetUseCase;

  AddPetCubit(this._addPetUseCase) : super(const AddPetInitial());

  Future<void> savePet({
    required String name,
    required String category,
    required String breed,
    required int age,
    required String imageUrl,
  }) async {
    final param = AddPetParam(
      name: name,
      category: category,
      breed: breed,
      age: age,
      imageUrl: imageUrl,
      createdAt: DateTime.now(),
    );

    final result = await _addPetUseCase(param);

    switch (result) {
      case Success(data: final _):
        emit(const AddPetSuccess());
      case Failed(failure: final _):
        emit(AddPetError("Something went wrong"));
    }
  }
}