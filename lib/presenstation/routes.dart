import 'package:flutter/material.dart';

import 'app_main_factory.dart';
import 'home/home_screen.dart';
import 'onboarding/onboarding_routes.dart';

class Routes {
  static Map<String, WidgetBuilder> _getAll(RouteSettings settings) => {
        ...OnBoardingRoutes.getAll(settings),
        HomeScreen.routeName: (context) =>
            AppMainFactory.create<HomeScreen>(arguments: settings.arguments)
      };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final routeName = settings.name;
    if (routeName == null) {
      throw Exception('please check route name: $routeName');
    }

    final builder = _getAll(settings)[routeName];

    if (builder == null) {
      throw Exception('please check route builder');
    }

    if (['/register', '/login'].contains(settings.name)) {
      return pageRouteBuilder(builder);
    }

    return MaterialPageRoute(
      builder: builder,
      settings: settings,
      fullscreenDialog: false,
    );
  }

  static PageRouteBuilder pageRouteBuilder(WidgetBuilder? builder) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return builder!(context);
      },
      transitionDuration: const Duration(milliseconds: 500),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final tween =
            Tween(begin: const Offset(0.0, 1.0), end: Offset.zero).chain(
          CurveTween(curve: Curves.easeInOutSine),
        );

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
