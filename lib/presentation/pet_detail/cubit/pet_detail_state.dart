part of 'pet_detail_cubit.dart';

@freezed
class PetDetailState with _$PetDetailState {
  const factory PetDetailState.initial() = PetDetailInitial;
  const factory PetDetailState.ready({
    required PetEntity pet,
}) = PetDetailReady;
const factory PetDetailState.error({String? message}) = PetDetailError;


}
