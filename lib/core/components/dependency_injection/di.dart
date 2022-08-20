import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app_core_factory.dart';
import '../configurations/configurations.dart';

GetIt injector = GetIt.instance;

class DependencyInjection {
  final SharedPreferences sharedPreferences;

  DependencyInjection(this.sharedPreferences);

  void inject(Map<String, dynamic> env) {
    // Local DataSource
    injector.registerSingleton<Configurations>(
        Configurations()..setConfigurationValues(env));

    injector.registerSingleton<SharedPreferences>(sharedPreferences);
    final dio = AppCoreFactory.createDio(
      Configurations.baseUrl,
      sharedPreferences,
    );

    injector.registerSingleton<Dio>(dio);
  }
}
