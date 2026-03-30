import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pet/adopt_pet.dart';

part 'pet_detail_state.dart';
part 'pet_detail_cubit.freezed.dart';

@injectable
class PetDetailCubit extends Cubit<PetDetailState> {
  final ContactAdminUseCase _contactAdminUseCase;
  PetDetailCubit(this._contactAdminUseCase) : super(const PetDetailInitial());

  void makeCall() => _contactAdminUseCase.call();
  void sendEmail(String name) => _contactAdminUseCase.email(name);
}
