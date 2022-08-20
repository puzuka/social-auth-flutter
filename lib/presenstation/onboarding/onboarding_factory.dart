import 'package:flutter/material.dart';

import 'sign_in/sign_in_screen.dart';
import 'welcome/welcome_screen.dart';

class OnboardingFactory {
  static Widget create<S>({
    Object? arguments,
  }) {
    switch (S) {
      case WelcomeScreen:
        return const WelcomeScreen();
      case SignInScreen:
        return const SignInScreen();
      default:
    }

    throw Exception('please register OrganisationFactory');
  }
}
