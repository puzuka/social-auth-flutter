import 'package:flutter/material.dart';

import 'sign_in/sign_in_screen.dart';
import 'welcome/welcome_screen.dart';

extension OnboardingCoordinator on BuildContext {
  static Future<void> startSignInScreen(BuildContext context) {
    return Navigator.of(context).pushNamed(SignInScreen.routeName);
  }

  static Future<void> startWelcomeScreen(BuildContext context) {
    return Navigator.of(context).pushNamedAndRemoveUntil(
      WelcomeScreen.routeName,
      (route) => false,
    );
  }
}
