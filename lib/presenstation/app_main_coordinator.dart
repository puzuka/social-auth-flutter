import 'package:flutter/material.dart';

import '../domain/entities/user.dart';
import 'home/home_screen.dart';

class AppMainCoordinator {
  static void startHomeApp(BuildContext context, {required User userInfo}) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        HomeScreen.routeName,
        arguments: {'userInfo': userInfo},
        (route) => false);
  }
}
