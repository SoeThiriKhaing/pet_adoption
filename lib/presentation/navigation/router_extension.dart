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

  // void goLogin() => go(LoginPage.routePath);
  //
  // void pushInterViewerLogin() => push(InterviewLoginPage.routePath);
  //
  // void pushRespondentLogin() => push(RespondentLoginPage.routePath);
  //
  // void pushCreateForm() => push(CreateFormPage.routePath);
  //
  // void goSignUp() => go(SignUpPage.routePath);
  //
  // void goEditForm(SurveyInfoEntity surveyInfo) => go(
  //       EditFormPage.routePath,
  //       extra: surveyInfo,
  //     );
  //
  // void pushEditForm(SurveyInfoEntity surveyInfo) => push(
  //       EditFormPage.routePath,
  //       extra: surveyInfo,
  //     );


}
