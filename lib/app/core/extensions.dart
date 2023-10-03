import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../navigation/custom_navigation.dart';
import '../localization/language_constant.dart';
import '../../features/language/provider/localization_provider.dart';

//make first letter capital
extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

extension DataExtention on DateTime {
  String dateFormat() {
    return DateFormat.yMMMd(Provider.of<LocalizationProvider>(
                    CustomNavigator.scaffoldState.currentContext!,
                    listen: false)
                .isLtr
            ? 'en_US'
            : 'ar_SA')
        .format(this);
    // return DateFormat("dd-MMMM ").format(this);
  }

  String defaultFormat2() {
    return DateFormat("yyyy-MM-d").format(this);
  }
}

extension DayExtention on DateTime {
  String dayFormat() {
    return DateFormat(
            "EEEE",
            Provider.of<LocalizationProvider>(
                        CustomNavigator.scaffoldState.currentContext!,
                        listen: false)
                    .isLtr
                ? 'en_US'
                : 'ar_SA')
        .format(this);
  }
}

extension DataMainExtention on DateTime {
  String dataMainFormat() {
    return DateFormat(
            " d  MMM  yyyy",
            Provider.of<LocalizationProvider>(
                        CustomNavigator.scaffoldState.currentContext!,
                        listen: false)
                    .isLtr
                ? 'en_US'
                : 'ar_SA')
        .format(this);
  }
}

extension DataExtention2 on DateTime {
  String dateFormat2() {
    return DateFormat.yMMM(Provider.of<LocalizationProvider>(
                    CustomNavigator.scaffoldState.currentContext!,
                    listen: false)
                .isLtr
            ? 'en_US'
            : 'ar_SA')
        .format(this);
    // return DateFormat("dd-MMMM ").format(this);
  }
}

extension MonthExtention on DateTime {
  String monthFormat() {
    return DateFormat(
            "MMM  yyyy",
            Provider.of<LocalizationProvider>(
                        CustomNavigator.scaffoldState.currentContext!,
                        listen: false)
                    .isLtr
                ? 'en_US'
                : 'ar_SA')
        .format(this);
  }
}

extension DataTimeExtention on DateTime {
  String dateTimeFormat() {
    return DateFormat(
            "yyyy-MM-dd hh:mm",
            Provider.of<LocalizationProvider>(
                        CustomNavigator.scaffoldState.currentContext!,
                        listen: false)
                    .isLtr
                ? 'en_US'
                : 'ar_SA')
        .format(this);
  }
}

extension Format on DateTime {
  String format(String format) {
    return DateFormat(
            format,
            Provider.of<LocalizationProvider>(
                        CustomNavigator.scaffoldState.currentContext!,
                        listen: false)
                    .isLtr
                ? 'en_US'
                : 'ar_SA')
        .format(this);
  }
}

extension PostDateExtention on DateTime {
  String postDateFormat() {
    return DateFormat("yyyy-MM-dd", 'en_US').format(this);
  }
}

extension PostTimeExtention on DateTime {
  String postTimeFormat() {
    return DateFormat("hh:mm:ss",'en_US').format(this);
  }
}


extension IsoDataTimeExtention on DateTime {
  String isoDateTimeFormat() {
    return DateFormat.yMEd(Provider.of<LocalizationProvider>(
                    CustomNavigator.scaffoldState.currentContext!,
                    listen: false)
                .isLtr
            ? 'en_US'
            : 'ar_SA')
        .format(
      this,
    );
  }
}

extension TimeExtention on DateTime {
  String timeFormat() {
    return DateFormat(
            "hh:mm a",
            Provider.of<LocalizationProvider>(
                        CustomNavigator.scaffoldState.currentContext!,
                        listen: false)
                    .isLtr
                ? 'en_US'
                : 'ar_SA')
        .format(this);
  }
}

extension TimeExtention3 on DateTime {
  String time1Format() {
    return DateFormat(
            "hh:mm:ss a",
            Provider.of<LocalizationProvider>(
                        CustomNavigator.scaffoldState.currentContext!,
                        listen: false)
                    .isLtr
                ? 'en_US'
                : 'ar_SA')
        .format(this);
  }
}

extension TimeExtention2 on DateTime {
  String timeDateFormat() {
    return DateFormat(
            "EE, d MMM, yyyy",
            Provider.of<LocalizationProvider>(
                        CustomNavigator.scaffoldState.currentContext!,
                        listen: false)
                    .isLtr
                ? 'en_US'
                : 'ar_SA')
        .format(this);
  }
}

extension Day1Extention on DateTime {
  String day1Format() {
    return DateFormat(
            "EE, d MMM",
            Provider.of<LocalizationProvider>(
                        CustomNavigator.scaffoldState.currentContext!,
                        listen: false)
                    .isLtr
                ? 'en_US'
                : 'ar_SA')
        .format(this);
  }
}

int daysBetween(DateTime from, DateTime to) {
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);
  return (to.difference(from).inHours / 24).round();
}

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

extension MediaQueryValues on BuildContext {
  double get height => MediaQuery.of(this).size.height;

  double get topPadding => MediaQuery.of(this).padding.top;

  double get width => MediaQuery.of(this).size.width;

  double get toPadding => MediaQuery.of(this).viewPadding.top;

  double get bottom => MediaQuery.of(this).viewInsets.bottom;
}

extension ScreenScale on num {
  double get w =>
      MediaQuery.of(CustomNavigator.navigatorState.currentContext!).size.width *
      (toDouble() / 390);
  double get h =>
      MediaQuery.of(CustomNavigator.navigatorState.currentContext!)
          .size
          .height *
      (toDouble() / 844);
}

///Extension to return date type
extension Difference on DateTime {
  String diff(String format) {
    if (DateTime.now().toLocal().isBefore(toLocal())) {
      return DateFormat.jm().format(toLocal()).toString();
    }
    var dur = DateTime.now().toLocal().difference(this);
    if (dur.inDays == 0) {
      return getTranslated(
          "today", CustomNavigator.navigatorState.currentContext!);
    } else if (dur.inDays == 1) {
      return getTranslated(
          "yesterday", CustomNavigator.navigatorState.currentContext!);
    }
    // else if(dur.inDays > 1){
    //   return"${dur.inDays} ${getTranslated("days",CustomNavigator.navigatorState.currentContext!)}";
    // }
    else if (dur.inHours == 1) {
      return getTranslated(
          "hour", CustomNavigator.navigatorState.currentContext!);
    }
    // else if(dur.inHours>1){
    //   return "${dur.inHours} ${getTranslated("hour",CustomNavigator.navigatorState.currentContext!)}";
    // }
    else if (dur.inMinutes == 1) {
      return "1 ${getTranslated("min", CustomNavigator.navigatorState.currentContext!)}";
    } else if (dur.inSeconds == 0) {
      return getTranslated(
          "now", CustomNavigator.navigatorState.currentContext!);
    } else {
      return DateFormat(format).format(this);
    }
  }
}

String localeCode = Provider.of<LocalizationProvider>(
        CustomNavigator.navigatorState.currentContext!,
        listen: false)
    .locale
    .languageCode;

extension ConvertDigits on String {
  String convertDigits() {
    var sb = StringBuffer();
    if (localeCode == "en") {
      return this;
    } else {
      for (int i = 0; i < length; i++) {
        switch (this[i]) {
          case '0':
            sb.write('٠');
            break;
          case '1':
            sb.write('۱');
            break;
          case '2':
            sb.write('۲');
            break;
          case '3':
            sb.write('۳');
            break;
          case '4':
            sb.write('٤');
            break;
          case '5':
            sb.write('٥');
            break;
          case '6':
            sb.write('٦');
            break;
          case '7':
            sb.write('٧');
            break;
          case '8':
            sb.write('۸');
            break;
          case '9':
            sb.write('۹');
            break;
          default:
            sb.write(this[i]);
            break;
        }
      }
    }
    return sb.toString();
  }
}
