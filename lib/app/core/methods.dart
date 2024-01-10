import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/extensions.dart';

abstract class Methods {
  static convertStringToTime(timeString, {bool withFormat = false}) {
    if (timeString != null) {
      List<String> parts = timeString.split(':');
      TimeOfDay timeOfDay = TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
      DateTime now = DateTime.now();
      DateTime dateTime = DateTime(
        now.year,
        now.month,
        now.day,
        timeOfDay.hour,
        timeOfDay.minute,
        now.second,
      );
      if (withFormat) {
        return dateTime
            .format("m : h aa")

            .replaceAll("ص", "صباحاً")
            .replaceAll("م", "مساءً");
      } else {
        return dateTime;
      }
    } else {
      return DateTime.now()
          .format("m : h aa")

          .replaceAll("ص", "صباحاً")
          .replaceAll("م", "مساءً");
    }
  }
}
