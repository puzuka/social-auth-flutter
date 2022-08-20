import 'package:flutter/material.dart';

import 'onboarding_factory.dart';
import 'sign_in/sign_in_screen.dart';
import 'welcome/welcome_screen.dart';

class OnBoardingRoutes {
  static Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        WelcomeScreen.routeName: (context) {
          return OnboardingFactory.create<WelcomeScreen>();
        },
        SignInScreen.routeName: (context) =>
            OnboardingFactory.create<SignInScreen>(),
      };
}
