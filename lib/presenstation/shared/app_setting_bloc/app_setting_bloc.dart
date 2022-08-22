import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/usercases/app_setting_usecase.dart';

part 'app_setting_event.dart';
part 'app_setting_state.dart';

class AppSettingBloc extends Bloc<AppSettingEvent, AppSettingState> {
  final AppSettingUseCase _appSettingUseCase;

  AppSettingBloc(this._appSettingUseCase)
      : super(AppStateInitial(_appSettingUseCase.getLanguage(), 'US')) {
    on<SaveLanguageEvent>(mapSaveLanguageEvent);
  }

  FutureOr<void> mapSaveLanguageEvent(
      SaveLanguageEvent event, Emitter<AppSettingState> emit) async {
    final isSaved = await _appSettingUseCase.saveLanguage(event.language);

    if (isSaved) {
      emit(SaveLanguageSuccess(event.language, state.countryCode));
    }
  }
}
