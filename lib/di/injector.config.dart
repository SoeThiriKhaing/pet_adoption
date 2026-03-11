// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:adopt_pet/data/datasource/local/storage.dart' as _i622;
import 'package:adopt_pet/data/datasource/remote/firebase_api/auth_data_source/auth_data_source.dart'
    as _i464;
import 'package:adopt_pet/data/datasource/remote/firebase_api/auth_data_source/auth_data_source_impl.dart'
    as _i315;
import 'package:adopt_pet/data/repository_impl/authentication_repository.dart'
    as _i613;
import 'package:adopt_pet/di/modules/firebase.dart' as _i24;
import 'package:adopt_pet/di/modules/logger.dart' as _i454;
import 'package:adopt_pet/di/modules/shared_preferences_provider.dart' as _i905;
import 'package:adopt_pet/domain/repository/authentication_repository.dart'
    as _i279;
import 'package:adopt_pet/domain/services/snack_shower.dart' as _i123;
import 'package:adopt_pet/domain/usecase/auth_usecase/get_user_usecase.dart'
    as _i1051;
import 'package:adopt_pet/domain/usecase/auth_usecase/sign_in_usecase.dart'
    as _i555;
import 'package:adopt_pet/domain/usecase/auth_usecase/sign_out_usecase.dart'
    as _i706;
import 'package:adopt_pet/domain/usecase/auth_usecase/sign_up_usecase.dart'
    as _i780;
import 'package:adopt_pet/presentation/navigation/navigation_key_provider.dart'
    as _i758;
import 'package:adopt_pet/presentation/navigation/router.dart' as _i1065;
import 'package:adopt_pet/services/snack_shower.dart' as _i441;
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;
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
    gh.lazySingleton<_i59.FirebaseAuth>(() => firebaseModule.firebaseAuth);
    gh.lazySingleton<_i974.FirebaseFirestore>(
      () => firebaseModule.firebaseFireStore,
    );
    gh.lazySingleton<_i974.Logger>(() => loggerModule.logger);
    await gh.lazySingletonAsync<_i460.SharedPreferences>(
      () => sharedPreferencesProvider.provide(),
      preResolve: true,
    );
    gh.lazySingleton<_i622.AppStorage>(
      () => _i622.AppStorageImpl(
        gh<_i460.SharedPreferences>(),
        gh<_i974.Logger>(),
      ),
    );
    gh.singleton<_i758.INavigationKeyProvider>(
      () => _i758.NavigationKeyProvider(),
    );
    gh.lazySingleton<_i464.AuthDataSource>(
      () => _i315.FirebaseUserDataSource(
        gh<_i59.FirebaseAuth>(),
        gh<_i974.FirebaseFirestore>(),
        gh<_i974.Logger>(),
        gh<_i116.GoogleSignIn>(),
      ),
    );
    gh.lazySingleton<_i123.ISnackShower>(
      () => _i441.SnackShower(gh<_i758.INavigationKeyProvider>()),
    );
    gh.lazySingleton<_i1065.NavigationRouter>(
      () => _i1065.NavigationRouter(
        gh<_i758.INavigationKeyProvider>(),
        gh<_i622.AppStorage>(),
        gh<_i123.ISnackShower>(),
      ),
    );
    gh.lazySingleton<_i279.AuthRepository>(
      () => _i613.AuthRepositoryImpl(gh<_i464.AuthDataSource>()),
    );
    gh.lazySingleton<_i1051.GetUserUseCase>(
      () => _i1051.GetUserUseCase(gh<_i279.AuthRepository>()),
    );
    gh.lazySingleton<_i555.SignInUseCase>(
      () => _i555.SignInUseCase(gh<_i279.AuthRepository>()),
    );
    gh.lazySingleton<_i706.SignOutUseCase>(
      () => _i706.SignOutUseCase(gh<_i279.AuthRepository>()),
    );
    gh.lazySingleton<_i780.SignUpUseCase>(
      () => _i780.SignUpUseCase(gh<_i279.AuthRepository>()),
    );
    return this;
  }
}

class _$FirebaseModule extends _i24.FirebaseModule {}

class _$LoggerModule extends _i454.LoggerModule {}

class _$SharedPreferencesProvider extends _i905.SharedPreferencesProvider {}
