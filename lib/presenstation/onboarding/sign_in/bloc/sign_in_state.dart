part of 'sign_in_bloc.dart';

@immutable
abstract class SignInState extends Equatable {}

class SignInInitial extends SignInState {
  @override
  List<Object?> get props => [];
}

class SignInLoading extends SignInInitial {}

class SingInSuccess extends SignInState {
  final User user;

  SingInSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

class SingInFailed extends SignInState {
  final String msg;

  SingInFailed(this.msg);

  @override
  List<Object?> get props => [msg];
}
