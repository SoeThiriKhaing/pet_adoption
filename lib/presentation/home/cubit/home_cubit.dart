import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../adopt_pet.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetPetsUseCase _getPetsUseCase;
  final ToggleFavoriteUseCase _toggleFavoriteUseCase;
  StreamSubscription? _subscription;
  HomeCubit(this._getPetsUseCase,this._toggleFavoriteUseCase) : super(const HomeInitial());
  void fetchPets(String category) {
    emit(HomeInitial());

    _subscription?.cancel();

    _subscription = _getPetsUseCase(category).listen(
          (pets) {
        emit(HomeReady(pets: pets, selectedCategory: category));
      },
      onError: (error) {
        emit(HomeState.error(message: error.toString()));
      },
    );
  }

  Future<void> toggleFavorite(String petId, bool isFavorite) async {
    try {
      await _toggleFavoriteUseCase(petId, isFavorite);

    } catch (e) {
      emit(HomeState.error(message: "Error in Cubit"));
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
