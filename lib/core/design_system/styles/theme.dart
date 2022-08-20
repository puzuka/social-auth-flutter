import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

part 'colors/dark.dart';
part 'colors/light.dart';
part 'theme_color.dart';
part 'theme_decoration.dart';
part 'theme_display_metric.dart';
part 'theme_text.dart';

extension BrightnessExt on Brightness {
  ThemeColor getThemeColor() {
    return this == Brightness.light ? ThemeColorLight() : ThemeColorDark();
  }
}

extension ThemeDataExt on ThemeData {
  ThemeColor get themeColor => brightness.getThemeColor();

  ThemeDecoration get themeDecoration => ThemeDecoration(this, themeColor);

  ThemeDisplayMetric get themeDisplayMetric => const ThemeDisplayMetric();

  ThemeData getTheme(Brightness theme) {
    final dataThemeColor = theme.getThemeColor();
    final themeText = ThemeText(
      kFontFamily,
      textTheme: textTheme,
      themeColor: dataThemeColor,
    );

    return ThemeData(
      brightness: theme,
      fontFamily: kFontFamily,
      textTheme: themeText.getTextTheme,
      primaryTextTheme: themeText.getTextTheme,
      colorScheme: colorScheme.copyWith(
        primary: dataThemeColor.primary,
        brightness: theme,
        secondary: dataThemeColor.accent,
        onBackground: dataThemeColor.textColor,
      ),
      backgroundColor: dataThemeColor.background,
      primaryColor: dataThemeColor.primary,
      scaffoldBackgroundColor: dataThemeColor.scaffoldBackground,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
          padding: EdgeInsets.zero,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          onSurface: themeColor.textColor,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor:
              MaterialStateProperty.all<Color>(dataThemeColor.textColor),
          textStyle: MaterialStateProperty.all<TextStyle>(
            themeText.textButtonThemeStyle,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          primary: themeColor.textColor,
          padding: const EdgeInsets.symmetric(vertical: 17),
          minimumSize: const Size.fromHeight(40),
          side: const BorderSide(
            color: Colors.white,
            width: 1,
            style: BorderStyle.solid,
          ),
          maximumSize: const Size.fromHeight(100),
        ),
      ),
      appBarTheme: AppBarTheme(
          titleTextStyle: themeText.appBarThemeTitleStyle,
          backgroundColor: dataThemeColor.scaffoldBackground,
          elevation: 0,
          centerTitle: false,
          iconTheme: const IconThemeData(color: Colors.black)),
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 16,
        ),
        filled: true,
        fillColor: const Color(0xffF7F7F8),
        hintStyle: themeText.getTextTheme.bodyText2!.copyWith(
          color: themeColor.textColor.withOpacity(0.3),
          fontWeight: FontWeight.normal,
        ),
        labelStyle: themeText.getTextTheme.bodyMedium!
            .copyWith(color: themeColor.textColor.withOpacity(0.5)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: themeColor.primary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
              color: Color(0xffE7E8EA), width: 1, style: BorderStyle.solid),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
              color: Color(0xffE7E8EA), width: 5, style: BorderStyle.solid),
        ),
      ),
      cupertinoOverrideTheme:
          const CupertinoThemeData(brightness: Brightness.dark),
    );
  }
}
