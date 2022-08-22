part of 'app_setting_bloc.dart';

@immutable
abstract class AppSettingState {
  final String languageCode;
  final String countryCode;

  const AppSettingState(this.languageCode, this.countryCode);
}

class AppStateInitial extends AppSettingState {
  const AppStateInitial(super.languageCode, super.countryCode);
}

class SaveLanguageSuccess extends AppStateInitial {
  const SaveLanguageSuccess(super.languageCode, super.countryCode);
}
