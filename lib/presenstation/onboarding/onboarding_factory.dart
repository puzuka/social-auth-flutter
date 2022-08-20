import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/datasources/remote/social_auth_api.dart';
import '../../data/respository/auth_repository.dart';
import '../../domain/respository/auth_repository.dart';
import '../../domain/usercases/auth_usercase.dart';
import 'sign_in/bloc/sign_in_bloc.dart';
import 'sign_in/sign_in_screen.dart';
import 'welcome/welcome_screen.dart';

class OnboardingFactory {
  static Widget create<S>({
    required SharedPreferences sharedPreferences,
    required Dio dio,
    Object? arguments,
  }) {
    switch (S) {
      case WelcomeScreen:
        return const WelcomeScreen();
      case SignInScreen:
        return BlocProvider<SignInBloc>(
          create: (_) => SignInBloc(
              OnboardingFactory.createUsecase(dio, sharedPreferences)),
          child: const SignInScreen(),
        );
      default:
    }

    throw Exception('please register OrganisationFactory');
  }

  static T createRepository<T>(Dio dio) {
    switch (T) {
      case AuthRepository:
        return AuthRepositoryImpl(SocialAuthApi(dio)) as T;
      default:
    }
    throw Exception('please register factory class');
  }

  static T createUsecase<T>(
    Dio dio,
    SharedPreferences sharedPreferences,
  ) {
    switch (T) {
      case AuthUsecase:
        return AuthUsecase(OnboardingFactory.createRepository(dio)) as T;

      default:
    }
    throw Exception('please register factory class');
  }
}
