import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

const keyAuthentication = 'Authorization';
const keyApiKey = 'XApiKey';
const keyBear = 'Bearer';
const keyAcceptLanguage = 'Accept-Language';
const keySavedToken = '_keytoken';

class ApiTokenInterceptor extends Interceptor {
  final SharedPreferences _sharedPreferences;

  ApiTokenInterceptor(this._sharedPreferences);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final accessToken = _sharedPreferences.getString(keySavedToken);
    options.headers[keyAcceptLanguage] = 'en';

    if (accessToken?.isNotEmpty ?? false) {
      options.headers[keyAuthentication] = '$keyBear $accessToken';
    }
    super.onRequest(options, handler);
  }
}
