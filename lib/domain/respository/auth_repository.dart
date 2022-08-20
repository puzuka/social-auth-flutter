import '../entities/user.dart';

abstract class AuthRepository {
  Future<User> signin({required String email, required String password});
  Future<User> signup(
      {required String name, required String email, required String password});
}
