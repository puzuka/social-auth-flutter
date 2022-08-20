import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

import 'core/design_system/styles/theme.dart';
import 'presenstation/routes.dart';

class Application extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;

  const Application({
    Key? key,
    this.savedThemeMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData();

    return AdaptiveTheme(
      light: theme.getTheme(Brightness.light),
      dark: theme.getTheme(Brightness.dark),
      builder: (light, dark) => MaterialApp(
        onGenerateRoute: Routes.generateRoute,
        initialRoute: 'welcome',
        darkTheme: dark,
        theme: light,
      ),
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
    );
  }
}
