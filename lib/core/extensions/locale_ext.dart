import 'package:flutter/material.dart';

import '../design_system/resources/icon_constants.dart';

extension LocaleExt on Locale {
  String get flagAsset => _flagAsset();

  String _flagAsset() {
    switch (languageCode) {
      case 'vi':
        return IconConstants.flagVi;
      case 'en':
        return IconConstants.flagEn;
      default:
        return '';
    }
  }
}
