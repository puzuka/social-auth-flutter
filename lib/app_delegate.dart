import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

import 'application.dart';

class AppDelegate {
  Future<void> run(Map<String, dynamic> env) async {
    WidgetsFlutterBinding.ensureInitialized();

    ImageWidget.packageDefault = null;
    final savedThemeMode = await AdaptiveTheme.getThemeMode();

    runApp(Application(savedThemeMode: savedThemeMode));
  }
}
