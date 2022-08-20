import '../entities/user.dart';
import '../respository/auth_repository.dart';

class AuthUsecase {
  final AuthRepository _repository;

  AuthUsecase(this._repository);

  Future<User> signin({required String email, required String password}) {
    return _repository.signin(email: email, password: password);
  }

  Future<User> signup(
      {required String name, required String email, required String password}) {
    return _repository.signup(name: name, email: email, password: password);
  }
}
