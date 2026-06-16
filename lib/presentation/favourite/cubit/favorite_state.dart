part of 'favorite_cubit.dart';

@freezed
class FavoriteState with _$FavoriteState {
  const factory FavoriteState.initial() = FavoriteInitial;
  const factory FavoriteState.loading() = FavoriteLoading; // Added a loading phase
  const factory FavoriteState.ready({
    required List<PetEntity> pets, // Holds the live favorites array
  }) = FavoriteReady;
  const factory FavoriteState.error({String? error}) = FavoriteError;
}