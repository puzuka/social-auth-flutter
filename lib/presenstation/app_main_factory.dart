import 'package:flutter/material.dart';

import '../domain/entities/user.dart';
import 'home/home_screen.dart';

class AppMainFactory {
  static Widget create<S>({
    Object? arguments,
  }) {
    switch (S) {
      case HomeScreen:
        final args = arguments as Map;
        final userInfo = args['userInfo'] as User;
        return HomeScreen(userInfo: userInfo);
      default:
    }

    throw Exception('please register OrganisationFactory');
  }
}
