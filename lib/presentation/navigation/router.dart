import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:go_router/go_router.dart';
import '../../adopt_pet.dart';
import '../admin/admin.dart'; // သင့် core imports များ

@lazySingleton
class NavigationRouter {
  final INavigationKeyProvider _navigationKeyProvider;
  final AppStorage _storage;
  final ISnackShower _snackShower;

  int? _currentIndex;
  void Function(int page) Function()? _useIndexPageNavigator;

  void Function(int page) Function() get useIndexPageNavigator =>
      _useIndexPageNavigator!;

  NavigationRouter(
      this._navigationKeyProvider,
      this._storage,
      this._snackShower,
      );

  static const mustAuthenticatedRoute = [
    IndexPage.routePath,
    AddPetHome.routePath, // Admin page အတွက်ပါ ထည့်ထားပါ
  ];

  late final router = GoRouter(
    navigatorKey: _navigationKeyProvider.globalKey,
    initialLocation: IndexPage.routePath,
    redirect: (context, state) async {
      final currentRoute = state.fullPath;
      log("Current route: $currentRoute");

      if (context.mounted && mustAuthenticatedRoute.contains(currentRoute)) {
        final authentication = context.read<AuthenticationCubit>();
        if (authentication.state is! AuthenticationAuthenticated) {
          return LoginPage.createRoute(redirectRoute: "${state.uri}");
        }
      }
      return null;
    },
    routes: [
      // ၁။ Index Page (Home) - Root Level
      GoRoute(
        onExit: _handleDoubleTapToExit,
        path: IndexPage.routePath, // "/"
        builder: (context, state) {
          final tabIndex = int.tryParse(state.uri.queryParameters['tab'] ?? '') ?? 0;
          return IndexPage(
            onIndexChanged: (index) => _currentIndex = index,
            initialTab: tabIndex,
            indexCallback: (use) => _useIndexPageNavigator = use,
          );
        },
      ),

      // ၂။ Login Page - Root Level (Nested routes ထဲက ထုတ်လိုက်ပါ)
      GoRoute(
        path: LoginPage.routePath, // "/login-home"
        builder: (context, state) {
          final redirect = state.uri.queryParameters['redirectRoute'];
          return BlocProvider(
            create: (context) => inject<LoginCubit>(),
            child: LoginPage(redirectRoute: redirect),
          );
        },
      ),

      // ၃။ Register Page - Root Level
      GoRoute(
        path: RegisterPage.routePath, // "/register"
        builder: (context, state) {
          final redirect = state.uri.queryParameters['redirectRoute'];
          return BlocProvider(
            create: (context) => inject<RegisterCubit>(),
            child: RegisterPage(redirectRoute: redirect),
          );
        },
      ),

      // ၄။ Admin Add Pet Page - Root Level
      GoRoute(
        path: AddPetHome.routePath, // "/admin-add-pet"
        builder: (context, state) => const AddPetHome(),
      ),
    ],
  );

  DateTime? currentBackPressTime;
  Future<bool> _handleDoubleTapToExit(BuildContext context, GoRouterState state) async {
    final selectIndex = _useIndexPageNavigator!();
    if (_currentIndex != null && _currentIndex != 0) {
      selectIndex(0);
      return false;
    }
    final now = DateTime.now();
    if (currentBackPressTime == null || now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      _snackShower.info(message: "Press again to exit app");
      return false;
    }
    return true;
  }
}