import 'package:flutter/material.dart';

import 'sign_in/sign_in_screen.dart';

extension OnboardingCoordinator on BuildContext {
  static Future<void> startSignInScreen(BuildContext context) {
    return Navigator.of(context).pushNamed(SignInScreen.routeName);
  }
}
