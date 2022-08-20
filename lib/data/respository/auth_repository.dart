import '../../domain/entities/user.dart';
import '../../domain/respository/auth_repository.dart';
import '../datasources/remote/social_auth_api.dart';

class AuthRepositoryImpl extends AuthRepository {
  final SocialAuthApi _socialAuthApi;

  AuthRepositoryImpl(this._socialAuthApi);

  @override
  Future<User> signin({required String email, required String password}) async {
    final payload = {'email': email, 'password': password};
    final response = await _socialAuthApi.signin(payload: payload);

    return response.data.toEntity();
  }

  @override
  Future<User> signup(
      {required String name,
      required String email,
      required String password}) async {
    final payload = {'name': name, 'email': email, 'password': password};
    final response = await _socialAuthApi.signup(payload: payload);

    return response.data.toEntity();
  }
}
