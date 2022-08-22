part of 'app_setting_bloc.dart';

abstract class AppSettingState {
  final int index;
  final String languageCode;
  final String countryCode;

  const AppSettingState(this.languageCode, this.countryCode, this.index);
}

class AppStateInitial extends AppSettingState {
  const AppStateInitial(super.languageCode, super.countryCode, super.index);
}

class SaveLanguageSuccess extends AppStateInitial {
  const SaveLanguageSuccess(super.languageCode, super.countryCode, super.index);
}
