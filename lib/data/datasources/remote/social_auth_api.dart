import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/api_response.dart';
import '../../models/user_model.dart';

part 'social_auth_api.g.dart';

@RestApi()
abstract class SocialAuthApi {
  factory SocialAuthApi(Dio dio, {String baseUrl}) = _SocialAuthApi;

  @POST('authaccount/login')
  Future<ApiResponse<UserModel>> signin({
    @Body() required Map<String, dynamic> payload,
  });

  @POST('authaccount/registration')
  Future<ApiResponse<UserModel>> signup({
    @Body() required Map<String, dynamic> payload,
  });
}
