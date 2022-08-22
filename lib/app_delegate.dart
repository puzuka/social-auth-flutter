import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imagewidget/imagewidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'application.dart';
import 'core/components/dependency_injection/di.dart';
import 'domain/usercases/app_setting_usecase.dart';
import 'presenstation/shared/app_setting_bloc/app_setting_bloc.dart';

class AppDelegate {
  Future<void> run(Map<String, dynamic> env) async {
    WidgetsFlutterBinding.ensureInitialized();

    ImageWidget.packageDefault = null;
    final sharedPreferences = await SharedPreferences.getInstance();
    final savedThemeMode = await AdaptiveTheme.getThemeMode();

    DependencyInjection(sharedPreferences).inject(env);

    runApp(
      Application(
        savedThemeMode: savedThemeMode,
        initRoute: 'welcome',
        providers: [
          BlocProvider<AppSettingBloc>(
            create: (_) => AppSettingBloc(
              AppSettingUseCase(sharedPreferences),
            ),
          )
        ],
      ),
    );
  }
}
