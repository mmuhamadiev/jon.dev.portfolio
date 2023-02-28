import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:itsolutions.team/values/values.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

class AppTheme {
  static const _lightFillColor = Colors.black;

  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);

  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: _textTheme,
      iconTheme: IconThemeData(color: AppColors.white),
      canvasColor: colorScheme.background,
      appBarTheme: AppBarTheme(
        color: AppColors.deepBlue700,
      ),
      scrollbarTheme: ScrollbarThemeData().copyWith(
        thumbColor: MaterialStateProperty.all(AppColors.accentColor2.withOpacity(0.1)),
      ),
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      focusColor: AppColors.primaryColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  static ThemeData flexLightThemeData() {
    return FlexThemeData.light(colorScheme: flexSchemeDark,);
  }

  static const ColorScheme flexSchemeDark = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xff90a4ae),
    onPrimary: Color(0xff0f1011),
    primaryContainer: Color(0xff37474f),
    onPrimaryContainer: Color(0xffe8eaec),
    secondary: Color(0xff373d5c),
    onSecondary: Color(0xfff3f3f6),
    secondaryContainer: Color(0xff1d2449),
    onSecondaryContainer: Color(0xffe4e5eb),
    tertiary: Color(0xff815aa3),
    onTertiary: Color(0xfff9f6fb),
    tertiaryContainer: Color(0xff421f62),
    onTertiaryContainer: Color(0xffeae4ef),
    error: Color(0xffcf6679),
    onError: Color(0xff140c0d),
    errorContainer: Color(0xffb1384e),
    onErrorContainer: Color(0xfffbe8ec),
    background: Color(0xff18191a),
    onBackground: Color(0xffececed),
    surface: Color(0xff18191a),
    onSurface: Color(0xffececed),
    surfaceVariant: Color(0xff1f2223),
    onSurfaceVariant: Color(0xffdbdcdc),
    outline: Color(0xff9d9da3),
    shadow: Color(0xff000000),
    inverseSurface: Color(0xfff8f9fa),
    onInverseSurface: Color(0xff131313),
    inversePrimary: Color(0xff4d555a),
    surfaceTint: Color(0xff90a4ae),
  );


  static const ColorScheme lightColorScheme = ColorScheme(
    primary: Color(0xFF2C3541),
    primaryVariant: Color(0xFF0E1319),
    secondary: Color(0xFFEFF3F3),
    secondaryVariant: Color(0xFFFAFBFB),
    background: Color(0xFFFFFFFF),
    surface: Color(0xFFFAFBFB),
    onBackground: Colors.white,
    error: _lightFillColor,
    onError: _lightFillColor,
    onPrimary: _lightFillColor,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );

//  static const _superBold = FontWeight.w900;
  static const _bold = FontWeight.w700;
  static const _semiBold = FontWeight.w600;
  static const _medium = FontWeight.w500;
  static const _regular = FontWeight.w400;
  static const _light = FontWeight.w300;

//  bebasNeue
// sedgwickAve
//  static final TextTheme _textTheme = TextTheme(
//    headline1: GoogleFonts.raleway(
//      fontSize: Sizes.TEXT_SIZE_96,
//      color: AppColors.primaryColor,
//      fontWeight: _bold,
//      fontStyle: FontStyle.normal,
//    ),
//    headline2: GoogleFonts.raleway(
//      fontSize: Sizes.TEXT_SIZE_60,
//      color: AppColors.primaryColor,
//      fontWeight: _bold,
//      fontStyle: FontStyle.normal,
//    ),
//    headline3: GoogleFonts.raleway(
//      fontSize: Sizes.TEXT_SIZE_48,
//      color: AppColors.primaryColor,
//      fontWeight: _bold,
//      fontStyle: FontStyle.normal,
//    ),
//    headlineMedium: GoogleFonts.raleway(
//      fontSize: Sizes.TEXT_SIZE_34,
//      color: AppColors.primaryColor,
//      fontWeight: _bold,
//      fontStyle: FontStyle.normal,
//    ),
//    headline5: GoogleFonts.raleway(
//      fontSize: Sizes.TEXT_SIZE_24,
//      color: AppColors.primaryColor,
//      fontWeight: _bold,
//      fontStyle: FontStyle.normal,
//    ),
//    titleLarge: GoogleFonts.raleway(
//      fontSize: Sizes.TEXT_SIZE_20,
//      color: AppColors.primaryColor,
//      fontWeight: _bold,
//      fontStyle: FontStyle.normal,
//    ),
//    titleMedium: GoogleFonts.raleway(
//      fontSize: Sizes.TEXT_SIZE_16,
//      color: AppColors.secondaryColor,
//      fontWeight: _semiBold,
//      fontStyle: FontStyle.normal,
//    ),
//    titleSmall: GoogleFonts.raleway(
//      fontSize: Sizes.TEXT_SIZE_14,
//      color: AppColors.secondaryColor,
//      fontWeight: _semiBold,
//      fontStyle: FontStyle.normal,
//    ),
//    bodyLarge: GoogleFonts.raleway(
//      fontSize: Sizes.TEXT_SIZE_16,
//      color: AppColors.secondaryColor,
//      fontWeight: _light,
//      fontStyle: FontStyle.normal,
//      letterSpacing: 3,
//    ),
//    bodyMedium: GoogleFonts.raleway(
//      fontSize: Sizes.TEXT_SIZE_14,
//      color: AppColors.secondaryColor,
//      fontWeight: _light,
//      fontStyle: FontStyle.normal,
//      letterSpacing: 3,
//    ),
//    button: GoogleFonts.raleway(
//      fontSize: Sizes.TEXT_SIZE_14,
//      color: AppColors.secondaryColor,
//      fontStyle: FontStyle.normal,
//      fontWeight: _medium,
//    ),
//    caption: GoogleFonts.raleway(
//      fontSize: Sizes.TEXT_SIZE_12,
//      color: AppColors.white,
//      fontWeight: _regular,
//      fontStyle: FontStyle.normal,
//    ),
//  );
  static final TextTheme _textTheme = TextTheme(
    displayLarge: TextStyle(
      fontFamily: StringConst.CIRCE,
      fontSize: Sizes.TEXT_SIZE_96,
      color: AppColors.primaryColor,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    displayMedium: TextStyle(
      fontFamily: StringConst.CIRCE,
      fontSize: Sizes.TEXT_SIZE_60,
      color: AppColors.primaryColor,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    displaySmall: TextStyle(
      fontFamily: StringConst.PROXIMA_NOVA,
      fontSize: Sizes.TEXT_SIZE_48,
      color: AppColors.primaryColor,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    headlineMedium: TextStyle(
      fontFamily: StringConst.CIRCE,
      fontSize: Sizes.TEXT_SIZE_28,
      color: AppColors.primaryColor,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    headlineSmall: TextStyle(
      fontFamily: StringConst.PROXIMA_NOVA,
      fontSize: Sizes.TEXT_SIZE_24,
      color: AppColors.primaryColor,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    titleLarge: TextStyle(
      fontFamily: StringConst.CIRCE,
      fontSize: Sizes.TEXT_SIZE_20,
      color: AppColors.primaryColor,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    titleMedium: TextStyle(
      fontFamily: StringConst.CIRCE,
      fontSize: Sizes.TEXT_SIZE_16,
      color: AppColors.secondaryColor,
      fontWeight: _semiBold,
      fontStyle: FontStyle.normal,
    ),
    titleSmall: TextStyle(
      fontFamily: StringConst.PROXIMA_NOVA,
      fontSize: Sizes.TEXT_SIZE_14,
      color: AppColors.secondaryColor,
      fontWeight: _semiBold,
      fontStyle: FontStyle.normal,
    ),
    bodyLarge: TextStyle(
      fontFamily: StringConst.CIRCE,
      fontSize: Sizes.TEXT_SIZE_16,
      color: AppColors.secondaryColor,
      fontWeight: _regular,
      fontStyle: FontStyle.normal,
    ),
    bodyMedium: TextStyle(
      fontFamily: StringConst.PROXIMA_NOVA,
      fontSize: Sizes.TEXT_SIZE_14,
      color: AppColors.secondaryColor,
      fontWeight: _light,
      fontStyle: FontStyle.normal,
    ),
    labelLarge: TextStyle(
      fontFamily: StringConst.PROXIMA_NOVA,
      fontSize: Sizes.TEXT_SIZE_14,
      color: AppColors.secondaryColor,
      fontStyle: FontStyle.normal,
      fontWeight: _medium,
    ),
    bodySmall: TextStyle(
      fontFamily: StringConst.CIRCE,
      fontSize: Sizes.TEXT_SIZE_12,
      color: AppColors.white,
      fontWeight: _regular,
      fontStyle: FontStyle.normal,
    ),
  );
}
