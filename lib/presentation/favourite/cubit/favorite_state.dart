part of 'favorite_cubit.dart';

@freezed
class FavoriteState with _$FavoriteState {
  const factory FavoriteState.initial() = FavoriteInitial;
  const factory FavoriteState.ready() = FavoriteReady;
  const factory FavoriteState.success() = FavoriteSuccess;
  const factory FavoriteState.error({String? error}) = FavoriteError;



}
