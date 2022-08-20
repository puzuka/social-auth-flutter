part of 'theme.dart';

class ThemeDecoration {
  final ThemeData _theme;
  final ThemeColor _themeColor;
  const ThemeDecoration(this._theme, this._themeColor);

  BoxDecoration get appBarGradient => const BoxDecoration();

  BoxDecoration get textShadow => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [
            _theme.backgroundColor,
            Colors.white.withOpacity(0.2),
          ],
        ),
      );

  BoxDecoration get panelBottomShadow => BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        color: _theme.scaffoldBackgroundColor,
      );

  BoxDecoration get card => BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(color: Colors.grey),
      );

  InputDecoration get inputDecorationAppSetting => InputDecoration(
        hintStyle: _theme.inputDecorationTheme.hintStyle,
        filled: true,
        fillColor: _themeColor.background,
        contentPadding: const EdgeInsets.only(bottom: 15),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: _themeColor.inputBorderColor),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: _themeColor.inputBorderColor),
        ),
      );
}
