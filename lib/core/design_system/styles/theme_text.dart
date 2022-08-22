part of 'theme.dart';

/// name packge design_system
const kNamePackageDesign = 'design_system';

/// font name
const kFontFamilySecondary = 'Charter ITC';
const kFontHelveticaNeueLT = 'Helvetica Neue LT';
const kFontHelveticaNeueRoman = 'Helvetica Neue LT Roman';
const _kFontHelveticaNeueMedium = 'Helvetica Neue LT Medium';
const kFontFamily = 'HelveticaNeueLT-Roman';

class ThemeText {
  final ThemeColor themeColor;
  final String fontFamily;

  ThemeText(
    this.fontFamily, {
    required this.themeColor,
    TextTheme? textTheme,
  }) {
    _initThemeText(textTheme);
  }

  late TextTheme _textTheme;
  late TextStyle _textStyleWithFont;

  /// Font secondary
  TextStyle get styleHeadline => _textStyleWithFont.copyWith(
        fontFamily: kFontFamilySecondary,
        color: themeColor.textColor,
      );

  TextTheme get getTextTheme => _textTheme.copyWith(
        displayLarge: _cloneTextStyle(styleClone: styleHeadline, fontSize: 96),
        displayMedium: _cloneTextStyle(styleClone: styleHeadline, fontSize: 60),
        displaySmall: _cloneTextStyle(styleClone: styleHeadline, fontSize: 48),
        headlineMedium:
            _cloneTextStyle(styleClone: styleHeadline, fontSize: 34),
        headlineSmall: _cloneTextStyle(styleClone: styleHeadline, fontSize: 24),
        titleLarge: _cloneTextStyle(styleClone: styleHeadline, fontSize: 20),
        labelMedium: _textStyleWithFont,
        headlineLarge: _textStyleWithFont,

        /// [In XD Design:Subtitle 1]
        titleMedium: _cloneTextStyle(
          family: kFontHelveticaNeueRoman,
          fontSize: 16,
          color: themeColor.textColor,
        ),

        /// [In XD Design:Subtitle 2]
        titleSmall: _cloneTextStyle(
          family: kFontHelveticaNeueRoman,
          fontSize: 14,
          color: themeColor.textColor,
        ),

        /// [In XD Design:body1]
        bodyLarge: _cloneTextStyle(
          color: themeColor.textColor,
          family: kFontHelveticaNeueRoman,
          fontSize: 16,
        ),

        /// [In XD Design:body2]
        bodyMedium: _cloneTextStyle(
          color: themeColor.textColor,
          family: kFontHelveticaNeueRoman,
          fontSize: 14,
        ),

        /// [In XD Design:caption]
        bodySmall: _cloneTextStyle(
          color: themeColor.textColor,
          family: kFontHelveticaNeueRoman,
          fontSize: 12,
        ),

        /// [In XD Design:button]
        labelLarge: _cloneTextStyle(
          family: _kFontHelveticaNeueMedium,
          fontSize: 14,
          color: themeColor.textColor,
        ),

        /// [In XD Design:Overline]
        labelSmall: _cloneTextStyle(
          family: _kFontHelveticaNeueMedium,
          fontSize: 10,
          color: themeColor.textColor,
        ),
      );

  TextStyle get textButtonThemeStyle => _cloneTextStyle(
        fontWeight: FontWeight.w400,
      );

  TextStyle get tabBarThemeLabelStyle => _cloneTextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
      );

  TextStyle get tabBarThemeUnselectedLabelStyle => _cloneTextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
      );

  TextStyle get appBarThemeTitleStyle => _cloneTextStyle(
      fontStyle: FontStyle.normal,
      color: themeColor.appbarTitleColor,
      fontWeight: FontWeight.w500,
      fontSize: 24.0,
      height: 1.0 // line-hieght
      );

  TextStyle get modalTitleStyle => _cloneTextStyle(
        color: themeColor.appbarTitleColor,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w300,
        fontSize: 20.0,
        height: 1.2,
      );

  void _initThemeText([TextTheme? textTheme]) {
    _textTheme = textTheme ?? const TextTheme();
    _textStyleWithFont = TextStyle(
      fontFamily: fontFamily,
      color: themeColor.textColor,
      package: kNamePackageDesign,
    );
  }

  TextStyle _cloneTextStyle({
    TextStyle? styleClone,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    String? family,
    Color? backgroundColor,
    double? height,
  }) {
    /// if styleClone is null, style will clone from design system
    final textStyle = styleClone ?? _textStyleWithFont;
    return textStyle.copyWith(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      fontFamily: family,
      backgroundColor: backgroundColor,
      package: kNamePackageDesign,
      height: height,
    );
  }
}
