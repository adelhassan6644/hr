import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/color_resources.dart';

import '../core/app_strings.dart';
import '../core/dimensions.dart';
import '../core/text_styles.dart';

ThemeData light = ThemeData(
  fontFamily: AppStrings.fontFamily,
  useMaterial3: true,
  primaryColor: Styles.PRIMARY_COLOR,
  brightness: Brightness.light,
  // accentColor: Colors.white,
  colorScheme: const ColorScheme.light(
      primary: Styles.PRIMARY_COLOR, secondary: Styles.PRIMARY_COLOR),

  scaffoldBackgroundColor: Styles.BACKGROUND_COLOR,
  focusColor: const Color(0xFFADC4C8),
  hintColor: Styles.hintColor,
  disabledColor: Styles.disabledColor,
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
    primary: Styles.PRIMARY_COLOR,
    textStyle: AppTextStyles.w400.copyWith(
      color: Styles.WHITE,
    ),
  )),

  pageTransitionsTheme: const PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
    },
  ),

  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    titleTextStyle: TextStyle(
        color: Styles.PRIMARY_COLOR,
        fontSize: 25,
        fontFamily: AppStrings.fontFamily),
  ),
  textTheme: const TextTheme(
    button: TextStyle(color: Styles.PRIMARY_COLOR),
    headline1: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: Dimensions.FONT_SIZE_DEFAULT,
      fontFamily: AppStrings.fontFamily,
    ),
    headline2: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: Dimensions.FONT_SIZE_DEFAULT,
      fontFamily: AppStrings.fontFamily,
    ),
    headline3: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: Dimensions.FONT_SIZE_DEFAULT,
      fontFamily: AppStrings.fontFamily,
    ),
    headline4: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: Dimensions.FONT_SIZE_DEFAULT,
      fontFamily: AppStrings.fontFamily,
    ),
    headline5: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: Dimensions.FONT_SIZE_DEFAULT,
      fontFamily: AppStrings.fontFamily,
    ),
    headline6: TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: Dimensions.FONT_SIZE_DEFAULT,
      fontFamily: AppStrings.fontFamily,
    ),
    caption: TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: Dimensions.FONT_SIZE_DEFAULT,
      fontFamily: AppStrings.fontFamily,
    ),
    subtitle1: TextStyle(
      fontSize: 15.0,
      fontWeight: FontWeight.w500,
      fontFamily: AppStrings.fontFamily,
    ),
    bodyText2: TextStyle(fontSize: 12.0),
    bodyText1: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      fontFamily: AppStrings.fontFamily,
    ),
  ),
);
