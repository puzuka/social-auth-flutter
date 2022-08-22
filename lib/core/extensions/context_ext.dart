import 'package:flutter/material.dart';

import '../design_system/styles/theme.dart';
import '../localization/generated/l10n.dart';

extension ContextTheme on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get themeText => Theme.of(this).textTheme;
  ThemeColor get themeColor => Theme.of(this).themeColor;
}

extension ContextLocalization on BuildContext {
  S get translate => S.of(this)!;
}
