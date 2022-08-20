part of '../theme.dart';

class ThemeColorLight extends ThemeColor {
  @override
  Color get primary => const Color(0xFF6C5DD3);
  @override
  Color get accent => const Color(0xFF00c6f7);
  @override
  Color get scaffoldBackground => Colors.white;
  @override
  Color get background => Colors.white;

  // Bottom Navigation Bar
  @override
  Color get bottomBarIconSelected => const Color.fromRGBO(0, 203, 251, 1);

  @override
  Color get bottomBarIconUnSelected => Colors.white;

  @override
  Color get bottomBarSelectedItemColor => const Color.fromRGBO(0, 203, 251, 1);

  @override
  Color get bottomBarUnselectedItemColor => Colors.white;

  @override
  Color get bottomNavigationBarBackground => const Color(0xFF020202);

  @override
  Color get appbarTitleColor => Colors.black;

  @override
  Color get textColor => Colors.black;

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
