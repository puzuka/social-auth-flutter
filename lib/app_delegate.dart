import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'application.dart';
import 'core/components/dependency_injection/di.dart';

class AppDelegate {
  Future<void> run(Map<String, dynamic> env) async {
    WidgetsFlutterBinding.ensureInitialized();

    ImageWidget.packageDefault = null;
    final sharedPreferences = await SharedPreferences.getInstance();
    final savedThemeMode = await AdaptiveTheme.getThemeMode();

    DependencyInjection(sharedPreferences).inject(env);

    runApp(Application(savedThemeMode: savedThemeMode));
  }
}
