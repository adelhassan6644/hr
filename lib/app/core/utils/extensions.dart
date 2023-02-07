import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../navigation/custom_navigation.dart';
import '../../../presentation/notifier/localization_provider.dart';

//make first letter capital
extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

extension DataExtention on DateTime {
  String dateFormat() {
    return DateFormat.yMMMd(
        Provider.of<LocalizationProvider>(CustomNavigator.scaffoldState.currentContext!,listen: false).isLtr?'en_US':'ar_SA'
    ).format(this);
    // return DateFormat("dd-MMMM ").format(this);
  }
}
extension DayExtention on DateTime {
  String dayFormat() {
    return DateFormat("EEEEEEEEEE",
        Provider.of<LocalizationProvider>(CustomNavigator.scaffoldState.currentContext!,listen: false).isLtr?'en_US' : 'ar_SA'
    ).format(this);
  }
}

extension DataMainExtention on DateTime {
  String dataMainFormat() {
    return DateFormat(" d  MMM  yyyy",
        Provider.of<LocalizationProvider>(CustomNavigator.scaffoldState.currentContext!,listen: false).isLtr?'en_US' : 'ar_SA'
    ).format(this);
  }
}

extension DataExtention2 on DateTime {

  String dateFormat2() {
    return DateFormat.yMMM(
        Provider.of<LocalizationProvider>(CustomNavigator.scaffoldState.currentContext!,listen: false).isLtr?'en_US':'ar_SA'
    ).format(this);
    // return DateFormat("dd-MMMM ").format(this);
  }
}

extension MonthExtention on DateTime {

  String monthFormat() {
    return DateFormat("MMM  yyyy",
        Provider.of<LocalizationProvider>( CustomNavigator.scaffoldState.currentContext!,listen: false).isLtr?'en_US' : 'ar_SA'
    ).format(this);
  }
}

extension DataTimeExtention on DateTime {
  String dateTimeFormat() {
    return DateFormat("yyyy-MM-dd hh:mm",
        Provider.of<LocalizationProvider>( CustomNavigator.scaffoldState.currentContext!,listen: false).isLtr?'en_US':'ar_SA'
    ).format(this);
  }
}

extension Format on DateTime {
  String format(String format) {
    return DateFormat(format,
        Provider.of<LocalizationProvider>( CustomNavigator.scaffoldState.currentContext!,listen: false).isLtr?'en_US':'ar_SA'
    ).format(this);
  }
}

extension IsoDataTimeExtention on DateTime {

  String isoDateTimeFormat() {
    return DateFormat.yMEd(
        Provider.of<LocalizationProvider>( CustomNavigator.scaffoldState.currentContext!,listen: false).isLtr?'en_US' : 'ar_SA'
    ).format(this,);
  }
}

extension TimeExtention on DateTime {
  String timeFormat() {
    return DateFormat("hh:mm a",
        Provider.of<LocalizationProvider>( CustomNavigator.scaffoldState.currentContext!,listen: false).isLtr?'en_US' : 'ar_SA'
    ).format(this);
  }
}

extension TimeExtention3 on DateTime {
  String time1Format() {
    return DateFormat("hh:mm:ss a",
        Provider.of<LocalizationProvider>( CustomNavigator.scaffoldState.currentContext!,listen: false).isLtr?'en_US' : 'ar_SA'
    ).format(this);
  }
}

extension TimeExtention2 on DateTime {
  String timeDateFormat() {
    return DateFormat("EE, d MMM, yyyy",
        Provider.of<LocalizationProvider>( CustomNavigator.scaffoldState.currentContext!,listen: false).isLtr?'en_US' : 'ar_SA'
    ).format(this);
  }
}

extension Day1Extention on DateTime {
  String day1Format() {
    return DateFormat("EE, d MMM",
        Provider.of<LocalizationProvider>( CustomNavigator.scaffoldState.currentContext!,listen: false).isLtr?'en_US' : 'ar_SA'
    ).format(this);
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

  const Event(this.title);

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
final _kEventSource = Map.fromIterable(List.generate(50, (index) => index),
    key: (item) => DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5),
    value: (item) => List.generate(
        item % 4 + 1, (index) => Event('Event $item | ${index + 1}')))
  ..addAll({
    kToday: [
      Event('Today\'s Event 1'),
      Event('Today\'s Event 2'),
    ],
  });
extension MediaQueryValues on BuildContext {
  double get height => MediaQuery.of(this).size.height;

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


