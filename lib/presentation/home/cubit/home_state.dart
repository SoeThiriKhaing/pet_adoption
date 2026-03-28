part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = HomeInitial;
  const factory HomeState.ready({
    required List<PetEntity> pets,
    required String selectedCategory,
}) = HomeReady;
  const factory HomeState.error({String? message}) = HomeError;

}
