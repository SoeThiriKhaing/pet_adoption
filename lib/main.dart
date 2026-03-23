import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'di/di.dart';
import 'presentation/presentation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  await configureDependencies();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp( EasyLocalization(supportedLocales: [
    Locale('en','US'),
    Locale('my','MM'),
    Locale('ja','JP'),
  ], path: 'assets/languages',
  fallbackLocale: const Locale('en','US'),
  child: PetAdoption()));
}

class PetAdoption extends StatelessWidget {
  const PetAdoption({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => inject<AuthenticationCubit>()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: $styles.light,
        darkTheme: $styles.light,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: "Pet Adoption",
        routerConfig: inject<NavigationRouter>().router,
      ),
    );
  }
}
