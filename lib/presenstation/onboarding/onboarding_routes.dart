import 'package:flutter/material.dart';

import '../../core/components/dependency_injection/di.dart';
import 'onboarding_factory.dart';
import 'sign_in/sign_in_screen.dart';
import 'welcome/welcome_screen.dart';

class OnBoardingRoutes {
  static Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        WelcomeScreen.routeName: (context) {
          return OnboardingFactory.create<WelcomeScreen>(
              dio: injector.get(),
              sharedPreferences: injector.get(),
              arguments: settings.arguments);
        },
        SignInScreen.routeName: (context) =>
            OnboardingFactory.create<SignInScreen>(
                dio: injector.get(),
                sharedPreferences: injector.get(),
                arguments: settings.arguments),
      };
}
