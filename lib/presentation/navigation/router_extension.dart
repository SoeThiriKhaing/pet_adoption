import 'package:adopt_pet/adopt_pet.dart';
import 'package:adopt_pet/presentation/navigation/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../di/di.dart';

extension NavigationExtension on BuildContext {
  // void goIndex() => go(IndexPage.routePath);

  void goIndexAndSelectTab(int page) {
    go("/?tab=$page");
    final router = inject<NavigationRouter>();
    final selectTab = router.useIndexPageNavigator();
    selectTab(page);
  }

  void goLogin() => go(LoginPage.routePath);



}
