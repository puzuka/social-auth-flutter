import 'package:bot_interceptor/bot_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/networking/api_token_interceptor.dart';

class AppCoreFactory {
  static Dio createDio(
    String baseUrl,
    SharedPreferences sharedPreferences,
  ) {
    return Dio(BaseOptions(baseUrl: baseUrl, headers: {}))
      ..interceptors.add(ApiTokenInterceptor(sharedPreferences))
      ..interceptors.add(TelegramInterceptor(
        chatId: -11111111,
        token: '__',
        projectId: 'Social Auth Bot',
        willSendSuccess: true,
      ))
      ..interceptors.add(LoggerInterceptor());
  }
}
