// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;
import 'package:pet/adopt_pet.dart' as _i852;
import 'package:pet/data/datasource/local/storage.dart' as _i676;
import 'package:pet/data/datasource/remote/firebase_api/auth_data_source/auth_data_source.dart'
    as _i970;
import 'package:pet/data/datasource/remote/firebase_api/auth_data_source/auth_data_source_impl.dart'
    as _i935;
import 'package:pet/data/repository_impl/authentication_repo_impl.dart'
    as _i867;
import 'package:pet/data/repository_impl/pet_repo_impl.dart' as _i599;
import 'package:pet/di/modules/firebase.dart' as _i624;
import 'package:pet/di/modules/logger.dart' as _i473;
import 'package:pet/di/modules/shared_preferences_provider.dart' as _i922;
import 'package:pet/domain/repository/authentication_repository.dart' as _i596;
import 'package:pet/domain/services/snack_shower.dart' as _i735;
import 'package:pet/domain/usecase/auth_usecase/get_user_usecase.dart' as _i670;
import 'package:pet/domain/usecase/auth_usecase/sign_in_usecase.dart' as _i887;
import 'package:pet/domain/usecase/auth_usecase/sign_out_usecase.dart' as _i173;
import 'package:pet/domain/usecase/auth_usecase/sign_up_usecase.dart' as _i387;
import 'package:pet/domain/usecase/pet_usecase/add_pet_usecase.dart' as _i263;
import 'package:pet/domain/usecase/pet_usecase/get_pet_usecase.dart' as _i289;
import 'package:pet/notification/firebase_notification_service.dart' as _i630;
import 'package:pet/notification/local_notificaion_service.dart' as _i307;
import 'package:pet/presentation/admin/cubit/add_pet_cubit.dart' as _i307;
import 'package:pet/presentation/auth/login/cubit/login_cubit.dart' as _i160;
import 'package:pet/presentation/auth/register/cubit/register_cubit.dart'
    as _i17;
import 'package:pet/presentation/blocs/authentication_cubit/authentication_cubit_provider.dart'
    as _i609;
import 'package:pet/presentation/home/cubit/home_cubit.dart' as _i931;
import 'package:pet/presentation/navigation/navigation_key_provider.dart'
    as _i886;
import 'package:pet/presentation/navigation/router.dart' as _i601;
import 'package:pet/services/snack_shower.dart' as _i800;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final firebaseModule = _$FirebaseModule();
    final loggerModule = _$LoggerModule();
    final sharedPreferencesProvider = _$SharedPreferencesProvider();
    final authenticationCubitProvider = _$AuthenticationCubitProvider();
    gh.singleton<_i307.LocalNotificationService>(
      () => _i307.LocalNotificationService(),
    );
    gh.lazySingleton<_i59.FirebaseAuth>(() => firebaseModule.firebaseAuth);
    gh.lazySingleton<_i974.FirebaseFirestore>(
      () => firebaseModule.firebaseFireStore,
    );
    gh.lazySingleton<_i974.Logger>(() => loggerModule.logger);
    await gh.lazySingletonAsync<_i460.SharedPreferences>(
      () => sharedPreferencesProvider.provide(),
      preResolve: true,
    );
    gh.singleton<_i630.FirebaseNotificationService>(
      () => _i630.FirebaseNotificationService(
        gh<_i307.LocalNotificationService>(),
      ),
    );
    gh.singleton<_i886.INavigationKeyProvider>(
      () => _i886.NavigationKeyProvider(),
    );
    gh.lazySingleton<_i676.AppStorage>(
      () => _i676.AppStorageImpl(
        gh<_i460.SharedPreferences>(),
        gh<_i974.Logger>(),
      ),
    );
    gh.lazySingleton<_i852.PetRepository>(
      () => _i599.PetRepoImpl(gh<_i974.FirebaseFirestore>()),
    );
    gh.lazySingleton<_i970.AuthDataSource>(
      () => _i935.FirebaseUserDataSource(
        gh<_i59.FirebaseAuth>(),
        gh<_i974.FirebaseFirestore>(),
        gh<_i974.Logger>(),
      ),
    );
    gh.lazySingleton<_i735.ISnackShower>(
      () => _i800.SnackShower(gh<_i886.INavigationKeyProvider>()),
    );
    gh.lazySingleton<_i601.NavigationRouter>(
      () => _i601.NavigationRouter(
        gh<_i852.INavigationKeyProvider>(),
        gh<_i852.AppStorage>(),
        gh<_i852.ISnackShower>(),
      ),
    );
    gh.lazySingleton<_i263.AddPetUseCase>(
      () => _i263.AddPetUseCase(gh<_i852.PetRepository>()),
    );
    gh.lazySingleton<_i289.GetPetsUseCase>(
      () => _i289.GetPetsUseCase(gh<_i852.PetRepository>()),
    );
    gh.factory<_i307.AddPetCubit>(
      () => _i307.AddPetCubit(gh<_i852.AddPetUseCase>()),
    );
    gh.factory<_i931.HomeCubit>(
      () => _i931.HomeCubit(gh<_i852.GetPetsUseCase>()),
    );
    gh.lazySingleton<_i852.AuthRepository>(
      () => _i867.AuthRepositoryImpl(gh<_i852.AuthDataSource>()),
    );
    gh.lazySingleton<_i670.GetUserUseCase>(
      () => _i670.GetUserUseCase(gh<_i596.AuthRepository>()),
    );
    gh.lazySingleton<_i887.SignInUseCase>(
      () => _i887.SignInUseCase(gh<_i596.AuthRepository>()),
    );
    gh.lazySingleton<_i173.SignOutUseCase>(
      () => _i173.SignOutUseCase(gh<_i596.AuthRepository>()),
    );
    gh.lazySingleton<_i387.SignUpUseCase>(
      () => _i387.SignUpUseCase(gh<_i596.AuthRepository>()),
    );
    await gh.singletonAsync<_i852.AuthenticationCubit>(
      () => authenticationCubitProvider.provide(
        gh<_i852.AppStorage>(),
        gh<_i852.SignOutUseCase>(),
        gh<_i852.GetUserUseCase>(),
        gh<_i852.ISnackShower>(),
      ),
      preResolve: true,
    );
    gh.factory<_i160.LoginCubit>(
      () => _i160.LoginCubit(
        gh<_i852.SignInUseCase>(),
        gh<_i852.AuthenticationCubit>(),
      ),
    );
    gh.factory<_i17.RegisterCubit>(
      () => _i17.RegisterCubit(
        gh<_i852.SignUpUseCase>(),
        gh<_i852.AuthenticationCubit>(),
      ),
    );
    return this;
  }
}

class _$FirebaseModule extends _i624.FirebaseModule {}

class _$LoggerModule extends _i473.LoggerModule {}

class _$SharedPreferencesProvider extends _i922.SharedPreferencesProvider {}

class _$AuthenticationCubitProvider extends _i609.AuthenticationCubitProvider {}
