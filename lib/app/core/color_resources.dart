import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/theme_provider/theme_provider.dart';

abstract class Styles {
  static Color getGreyColor(BuildContext context) {
    return const Color(0xFF6f7275);
  }

  static Color getGrayColor(BuildContext context) {
    return const Color(0xFF6E6E6E);
  }

  static Color getSearchBg(BuildContext context) {
    return const Color(0xFFF5F5F5);
  }

  static Color getStatusColor(String status) {
    switch (status) {
      case "approved":
        return ACTIVE;
      case "pending":
        return PENDING;
      case "rejected":
        return WARNING_COLOR;
      default:
        return ACTIVE;
    }
  }

  static Color getStatusColorOfVacation(String status) {
    switch (status) {
      case "accepted":
        return ACTIVE;
      case "pending":
        return PENDING;
      case "rejected":
        return IN_ACTIVE;
      default:
        return ACTIVE;
    }
  }

  static Color getBackgroundColor(context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? Color(0xFF52575C)
        : Color(0xffF5F5F5);
  }

  static Color getCardBackgroundColor(context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? Color(0xFF52575C)
        : Color(0xffF5F5F5);
  }

  static Color getCardChatBackgroundColor(context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? Color(0xFF52575C)
        : Color(0xffF5F5F5);
  }

  static Color getTextFeildBackgroundColor(context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? Colors.black
        : Colors.white;
  }

  static Color getCardTextColor(context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? Colors.white
        : PRIMARY_COLOR;
  }

  static Color getHintColor(BuildContext context) {
    return Color(0xFF52575C);
  }

  static Color getGreyBunkerColor(BuildContext context) {
    return Color(0xFF25282B);
  }

  static const Color PRIMARY_COLOR = Color(0xFF4a42aa);
  static const Color SACOUNDRY = Color(0xFFf4b309);
  static const Color ACTIVE = Color(0xFF5F9B56);
  static const Color IN_ACTIVE = Color(0xFFBE3725);
  static const Color PENDING = Color(0xFFf3b309);
  static const Color LOGOUT_COLOR = Color(0xffF16063);
  static const Color primaryLight = Color(0xFFA256E2);
  static const Color hintColor = Color(0xFF52575C);
  static const Color chatColor = Color(0xFF43908A);
  static const Color blackColor = Color(0xFF000000);
  static const Color neroColor = Color(0xFF1F1F1F);
  static const Color WHITE = Color(0xFFFFFFFF);
  static const Color grayColor = Color(0xffA7A7A7);
  static const Color lightGrayColor = Color(0xffE4E4E4);
  static const Color LIGHT_BORDER_COLOR = Color(0xffE4E4E4);
  static const Color COLOR_OXFORD_BLUE = Color(0xff282F39);
  static const Color COLOR_GAINSBORO = Color(0xffE8E8E8);
  static const Color COLOR_NIGHER_RIDER = Color(0xff303030);
  static const Color BACKGROUND_COLOR = Color(0xfffcfdfe);
  static const Color COLOR_GREY_BUNKER = Color(0xff25282B);
  static const Color COLOR_GREY_CHATEAU = Color(0xffF5F5F5);
  static const Color GOLD_COLOR = Color(0xfff3b309);
  static const Color GREEN_COLOR = Colors.green;
  static const Color disabledColor = Color(0xFF979797);
  static const Color FILL = Color(0xfffcfdfe);
  static const Color FILL_COLOR = Color(0xfff7f7f7);
  static const Color transparentColor = Color(0xFF0000FFFF);
  static Color shadowColor = const Color(0xFFEEEEEE);

  static const Color WARNING_COLOR = Color(0xFFE24F4F);
  static const Color errorBorderColor = Color(0xFFE24F4F);
  static const Color BORDER_COLOR = Color(0xffD5D5D5);
  static const Color errorHintColor = Color(0xFFE24F4F);

  static const Color HEADER = Color(0xFF1F1F1F);
  static const Color SUB_HEADER = Color(0xFF616161);
  static const Color TITLE = Color(0xff737373);
  static const Color SUBTITLE = Color(0xff737373);
  static const Color SUB_TEXT1 = Color(0xFFBFBFBF);
  static const Color SUB_TEXT = Color(0xFF8C8C8C);

  static requestStatus(int? status) {
    if (status == 2) {
      return WARNING_COLOR;
    } else if (status == 1) {
      return GREEN_COLOR;
    } else {
      return PENDING;
    }
  }

  static activationStatus(int? status) {
    if (status == 0) {
      return WARNING_COLOR;
    } else {
      return GREEN_COLOR;
    }
  }

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
