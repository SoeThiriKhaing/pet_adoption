part of 'add_pet_cubit.dart';

@freezed
class AddPetState with _$AddPetState {
  const factory AddPetState.initial() = AddPetInitial;
  const factory AddPetState.loading() = AddPetLoading;

  const factory AddPetState.ready() = AddPetReady;
  const factory AddPetState.success() = AddPetSuccess;
  const factory AddPetState.error(String error) = AddPetError;



}
