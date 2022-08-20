import 'package:flutter/material.dart';

import '../design_system/styles/theme.dart';

extension ContextTheme on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get themeText => Theme.of(this).textTheme;
  ThemeColor get themeColor => Theme.of(this).themeColor;
}
