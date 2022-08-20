import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/networking/api_exception.dart';
import '../../../../domain/entities/user.dart';
import '../../../../domain/usercases/auth_usercase.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthUsecase _authUsecase;

  SignInBloc(
    this._authUsecase,
  ) : super(SignInInitial()) {
    on<SubmitSignInEvent>(_mapSubmitSignInEvent);
  }

  FutureOr<void> _mapSubmitSignInEvent(
      SubmitSignInEvent event, Emitter<SignInState> emit) async {
    try {
      emit(SignInLoading());

      final userData = await _authUsecase.signin(
          email: event.email, password: event.password);

      emit(SingInSuccess(userData));
    } on ApiException catch (e) {
      emit(SingInFailed(e.message));
    } catch (e) {
      emit(SingInFailed('Some thing went wrong'));
    }
  }
}
