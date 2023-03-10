import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../domain/localization/language_constant.dart';
import '../../../navigation/custom_navigation.dart';
import '../../../presentation/calender/src/shared/utils.dart';
import '../../../presentation/notifier/localization_provider.dart';

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
}

extension DayExtention on DateTime {
  String dayFormat() {
    return DateFormat(
            "EEEEEEEEEE",
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

class Event {
  final String title;
  final Color color;

  const Event({required this.title, required this.color});

  @override
  String toString() => title;
}

final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
final _kEventSource = { for (var item in List.generate(50, (index) => index)) DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5) : List.generate(
        item % 4 + 1, (index) => Event(title: getTranslated("work", CustomNavigator.scaffoldState.currentContext!), color: Colors.green)) }
  ..addAll({
    kToday: [
      Event(title: getTranslated("work", CustomNavigator.scaffoldState.currentContext!), color: Colors.grey),
      Event(title: getTranslated("vacation", CustomNavigator.scaffoldState.currentContext!), color: Colors.green),
      Event(title:  getTranslated("not_attended", CustomNavigator.scaffoldState.currentContext!), color: Colors.red),
    ],
  });

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

String localeCode =  Provider.of<LocalizationProvider>(
    CustomNavigator.navigatorState.currentContext!,
    listen: false)
    .locale.languageCode ;

extension ConvertDigits on String {
  String convertDigits() {
    var sb = StringBuffer();
    if (localeCode == "en") {
      return this;
    } else {
      for (int i = 0; i < length; i++) {
        switch (this[i]) {
          case '0':
            sb.write('??');
            break;
          case '1':
            sb.write('??');
            break;
          case '2':
            sb.write('??');
            break;
          case '3':
            sb.write('??');
            break;
          case '4':
            sb.write('??');
            break;
          case '5':
            sb.write('??');
            break;
          case '6':
            sb.write('??');
            break;
          case '7':
            sb.write('??');
            break;
          case '8':
            sb.write('??');
            break;
          case '9':
            sb.write('??');
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
