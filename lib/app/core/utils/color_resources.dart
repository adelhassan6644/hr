import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../presentation/notifier/theme_provider.dart';

class ColorResources {
  static Color getGreyColor(BuildContext context) {
    return Color(0xFF6f7275);
  }

  static Color getGrayColor(BuildContext context) {
    return Color(0xFF6E6E6E);
  }

  static Color getSearchBg(BuildContext context) {
    return Color(0xFFF5F5F5);
  }

  static Color getBackgroundColor(context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Color(0xFF52575C): Color(0xffF5F5F5);

  }
  static Color getCardBackgroundColor(context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Color(0xFF52575C):Color(0xffF5F5F5);
  }
  static Color getCardChatBackgroundColor(context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Color(0xFF52575C):Color(0xffF5F5F5);
  }


  static Color getTextFeildBackgroundColor(context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Colors.black:Colors.white;
  }
  static Color getCardTextColor(context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Colors.white:primary;
  }

  static Color getHintColor(BuildContext context) {
    return Color(0xFF52575C);
  }

  static Color getGreyBunkerColor(BuildContext context) {
    return Color(0xFF25282B);
  }

  static const Color primary = Color(0xFF2c80d5);
  static const Color primaryLight = Color(0xFFA256E2);
  static const Color hintColor = Color(0xFF52575C);
  static const Color chatColor = Color(0xFF43908A);
  static const Color blackColor = Color(0xFF000000);
  static const Color neroColor = Color(0xFF1F1F1F);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color grayColor = Color(0xffA7A7A7);
  static const Color lightGrayColor = Color(0xffE4E4E4);
  static const Color COLOR_OXFORD_BLUE = Color(0xff282F39);
  static const Color COLOR_GAINSBORO = Color(0xffE8E8E8);
  static const Color COLOR_NIGHER_RIDER = Color(0xff303030);
  static const Color BACKGROUND_COLOR = Colors.white;
  static const Color COLOR_GREY_BUNKER = Color(0xff25282B);
  static const Color COLOR_GREY_CHATEAU = Color(0xffF5F5F5);
  static const Color goldColor = Color(0xffF8CA78);
  static const Color disabledColor = Color(0xFF979797);
  static const Color fillColor = Color(0xFFF9F9FA);
  static const Color transparentColor = Color(0xFF0000FFFF);
  static Color shadowColor = const Color(0xFFEEEEEE);

  static const Color redColor = Color(0xFFE24F4F);
  static const Color errorBorderColor = Color(0xFFE24F4F);
  static const Color borderColor = Color(0xffD5D5D5);
  static const Color errorHintColor = Color(0xFFE24F4F);




  static const Map<int, Color> colorMap = {
    50: Color(0x10192D6B),
    100: Color(0x20192D6B),
    200: Color(0x30192D6B),
    300: Color(0x40192D6B),
    400: Color(0x50192D6B),
    500: Color(0x60192D6B),
    600: Color(0x70192D6B),
    700: Color(0x80192D6B),
    800: Color(0x90192D6B),
    900: Color(0xff192D6B),
  };
}
