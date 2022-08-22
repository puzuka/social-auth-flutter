import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/design_system/styles/theme.dart';
import 'core/localization/generated/l10n.dart';
import 'core/localization/localization_factory.dart';
import 'presenstation/routes.dart';
import 'presenstation/shared/app_setting_bloc/app_setting_bloc.dart';

class Application extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;
  final List<BlocProvider> providers;
  final String initRoute;

  const Application({
    Key? key,
    this.savedThemeMode,
    required this.providers,
    required this.initRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData();

    return AdaptiveTheme(
      light: theme.getTheme(Brightness.light),
      dark: theme.getTheme(Brightness.dark),
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (light, dark) => MultiBlocProvider(
        providers: providers,
        child: BlocBuilder<AppSettingBloc, AppSettingState>(
          builder: (_, state) {
            return MaterialApp(
              theme: light,
              darkTheme: dark,
              initialRoute: initRoute,
              onGenerateRoute: Routes.generateRoute,
              locale: Locale(state.languageCode, state.countryCode),
              localizationsDelegates:
                  LocalizationFactory.localizationsDelegates,
              supportedLocales: S.supportedLocales,
            );
          },
        ),
      ),
    );
  }
}
