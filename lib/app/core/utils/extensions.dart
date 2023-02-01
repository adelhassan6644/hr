import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../main.dart';
import '../../../presentation/notifier/localization_provider.dart';

//make first letter capital
extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}

extension DataExtention on DateTime {
  String dateFormat() {
    return DateFormat.yMMMd(
        Provider.of<LocalizationProvider>(MyApp.navigatorKey.currentContext!,).isLtr?'en_US':'ar_SA'
    ).format(this);
    // return DateFormat("dd-MMMM ").format(this);
  }
}
extension DayExtention on DateTime {
  String dayFormat() {
    return DateFormat("EEEEEEEEEE",
        Provider.of<LocalizationProvider>(MyApp.navigatorKey.currentContext!,listen: false).isLtr?'en_US' : 'ar_SA'
    ).format(this);
  }
}

extension DataMainExtention on DateTime {
  String dataMainFormat() {
    return DateFormat(" d  MMM  yyyy",
        Provider.of<LocalizationProvider>(MyApp.navigatorKey.currentContext!,listen: false).isLtr?'en_US' : 'ar_SA'
    ).format(this);
  }
}

extension DataExtention2 on DateTime {

  String dateFormat2() {
    return DateFormat.yMMM(
        Provider.of<LocalizationProvider>(MyApp.navigatorKey.currentContext!,).isLtr?'en_US':'ar_SA'
    ).format(this);
    // return DateFormat("dd-MMMM ").format(this);
  }
}

extension MonthExtention on DateTime {

  String monthFormat() {
    return DateFormat("MMM  yyyy",
        Provider.of<LocalizationProvider>(MyApp.navigatorKey.currentContext!,listen: false).isLtr?'en_US' : 'ar_SA'
    ).format(this);
  }
}

extension DataTimeExtention on DateTime {
  String dateTimeFormat() {
    return DateFormat("yyyy-MM-dd hh:mm",
        Provider.of<LocalizationProvider>(MyApp.navigatorKey.currentContext!,).isLtr?'en_US':'ar_SA'
    ).format(this);
  }
}

extension IsoDataTimeExtention on DateTime {

  String isoDateTimeFormat() {
    return DateFormat.yMEd(
        Provider.of<LocalizationProvider>(MyApp.navigatorKey.currentContext!,listen: false).isLtr?'en_US' : 'ar_SA'
    ).format(this,);
  }
}

extension TimeExtention on DateTime {
  String timeFormat() {
    return DateFormat("hh:mm a",
        Provider.of<LocalizationProvider>(MyApp.navigatorKey.currentContext!,listen: false).isLtr?'en_US' : 'ar_SA'
    ).format(this);
  }
}

extension TimeExtention2 on DateTime {
  String timeDateFormat() {
    return DateFormat("EE, d MMM, yyyy",
        Provider.of<LocalizationProvider>(MyApp.navigatorKey.currentContext!,listen: false).isLtr?'en_US' : 'ar_SA'
    ).format(this);
  }
}



int daysBetween(DateTime from, DateTime to) {
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);
  return (to.difference(from).inHours / 24).round();
}
