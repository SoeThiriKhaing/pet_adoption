import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart'; // For dependency injection annotations

import '../../../adopt_pet.dart'; // Adjust this path to your project root structure

part 'favorite_state.dart';
part 'favorite_cubit.freezed.dart';

@injectable
class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepository _favoriteRepository;
  StreamSubscription<List<PetEntity>>? _favoritesSubscription;

  FavoriteCubit(this._favoriteRepository) : super(const FavoriteState.initial()) {
    // Automatically start listening to favorites when this cubit is created
    _listenToFavorites();
  }

  void _listenToFavorites() {
    emit(const FavoriteState.loading());

    // Cancel any pre-existing subscription safely before starting a new one
    _favoritesSubscription?.cancel();

    // Stream automatically fires updates here whenever user adds or removes a pet
    _favoritesSubscription = _favoriteRepository.getFavoritePets().listen(
          (favoritePetsList) {
        emit(FavoriteState.ready(pets: favoritePetsList));
      },
      onError: (stackTrace) {
        emit(FavoriteState.error(error: stackTrace.toString()));
      },
    );
  }

  @override
  Future<void> close() {
    // Clean up the stream listener when switching tabs or screens
    _favoritesSubscription?.cancel();
    return super.close();
  }
}