import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../adopt_pet.dart';
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
