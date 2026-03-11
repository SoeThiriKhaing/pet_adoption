import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../adopt_pet.dart';
import 'package:go_router/go_router.dart';

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

 static const mustAuthenticatedRoute = [IndexPage.routePath];

  late final router = GoRouter(
    navigatorKey: _navigationKeyProvider.globalKey,
    initialLocation: IndexPage.routePath,
    redirect: (context, state) async {
      final currentRoute = state.fullPath;
      log("Current route $currentRoute");


      if (context.mounted && mustAuthenticatedRoute.contains(currentRoute)) {
        final authentication = context.read<AuthenticationCubit>();
        if (authentication.state is! AuthenticationAuthenticated) {
          return LoginPage.createRoute(redirectRoute: "${state.uri}");
        }
      }

      return null;
    },
    routes: [
      GoRoute(
        onExit: _handleDoubleTapToExit,
        path: IndexPage.routePath,
        builder: (context, state) {
          final tabIndex =
              int.tryParse(state.uri.queryParameters['tab'] ?? '') ?? 0;
          return IndexPage(
            onIndexChanged: (index) => _currentIndex = index,
            initialTab: tabIndex,
            indexCallback: (useIndexPageNavigator) {
              _useIndexPageNavigator = useIndexPageNavigator;
            },
          );
        },
        routes: [

        ],
      )
    ],
  );
  DateTime? currentBackPressTime;

  Future<bool> _handleDoubleTapToExit(
    BuildContext context,
    GoRouterState state,
  ) async {
    final selectIndex = _useIndexPageNavigator!();
    if (_currentIndex != null && _currentIndex != 0) {
      selectIndex(0);
      return false;
    }

    final now = DateTime.now();
    const thresholdInterval = Duration(seconds: 2);

    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > thresholdInterval) {
      currentBackPressTime = now;

      _snackShower.info(message: "Press again to exit app");
      return false;
    }

    return true;
  }
}
