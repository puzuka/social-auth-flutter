// Copyright 2022 Fighttech.vn, Ltd. All rights reserved.

part of '../theme.dart';

class ThemeColorDark extends ThemeColor {
  @override
  Color get primary => const Color(0xFF6C5DD3);
  @override
  Color get accent => const Color(0xFFD04A02);
  @override
  Color get scaffoldBackground => const Color(0xFF11142D);
  @override
  Color get background => const Color(0xFF11142D);

  // Bottom Navigation Bar
  @override
  Color get bottomBarIconSelected => primary;

  @override
  Color get bottomBarIconUnSelected => const Color(0xFF9D9D9D);

  @override
  Color get bottomBarSelectedItemColor => primary;

  @override
  Color get bottomBarUnselectedItemColor => const Color(0xFF9D9D9D);

  @override
  Color get bottomNavigationBarBackground => const Color(0xFF201F1F);

  @override
  Color get appbarTitleColor => const Color(0xFFFFFFFF);

  @override
  Color get textColor => Colors.white;

  @override
  Color get bottomSheetBackgroundColor => const Color(0xFF3A3A3A);

  @override
  Color get inputBorderColor => Colors.grey;

  @override
  Color get bottomSheetBorderColor => const Color(0xFF696969);

  @override
  Color get backgroundCart => const Color(0xffF7F7F8);

  @override
  Color get borderCard => const Color(0xffE7E8EA);
}
