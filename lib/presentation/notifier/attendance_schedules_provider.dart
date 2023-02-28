import 'dart:collection';
import 'dart:developer';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hr_project/domain/repositery/attendance_schedules_repo.dart';
import '../../app/core/error/failures.dart';
import '../../app/core/utils/app_snack_bar.dart';
import '../../app/core/utils/color_resources.dart';
import '../../app/core/utils/extensions.dart';
import '../../data/model/attendance_schedules_model.dart';
import '../../data/model/user_model.dart';
import '../../domain/repositery/profile_repo.dart';
import '../calender/src/shared/utils.dart';

class AttendanceScheduleProvider extends ChangeNotifier {
  AttendanceSchedulesRepo attendanceSchedulesRepo;

  AttendanceScheduleProvider({
    required this.attendanceSchedulesRepo,
  });

  bool isLoading = true;
  bool isError = false;
  DateTime focusedDay = DateTime.now();
  DateTime? currentDay;
  AttendanceSchedules? attendanceSchedules;
  DateTime? startScheduleData  ;

  final ValueNotifier<List<Event>> selectedEvents = ValueNotifier([]);

  init() {
    _getAttendanceSchedules();
  }

  _getAttendanceSchedules() async {
    try {
      isError = false;
      isLoading = true;
      notifyListeners();
      Either<ServerFailure, Response> response =
          await attendanceSchedulesRepo.getAttendanceSchedules();
      response.fold((fail) {
        isLoading = false;
        isError = true;
        CustomSnackBar.showSnackBar(
            notification: AppNotification(
                message: fail.error,
                isFloating: true,
                backgroundColor: ColorResources.IN_ACTIVE,
                borderColor: ColorResources.transparentColor));
        notifyListeners();
      }, (success) {
        attendanceSchedules =
            AttendanceSchedules.fromJson(success.data["data"]);
        startScheduleData= attendanceSchedules!.schedules!.first.startDate!;
        onDaySelected(DateTime.now(), DateTime.now());

        isLoading = false;
        notifyListeners();
      });
    } catch (e) {
      isError = true;
      isLoading = false;
      CustomSnackBar.showSnackBar(
          notification: AppNotification(
              message: e.toString(),
              isFloating: true,
              backgroundColor: ColorResources.IN_ACTIVE,
              borderColor: ColorResources.transparentColor));
      notifyListeners();
    }
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(currentDay, selectedDay)) {
      currentDay = selectedDay;
      this.focusedDay = focusedDay;
      notifyListeners();

      selectedEvents.value = getEventsForDay(selectedDay);
    }
  }
  LinkedHashMap<DateTime, List<Event>>? kEvents;
  Map<DateTime, List<Event>>? attendanceSchedulesMap;

  List<Event> getEventsForDay(DateTime day) {

    final workDays = attendanceSchedules!.schedules!.first.workDays!
        .split(',')
        .map((c) => int.parse(c)).toList();
    // log("getEventsForDay$workDays");

    attendanceSchedulesMap = {
      for (var item in workDays.toList())
        DateTime(kToday.year, kToday.month, item ): [Event(title: "work", color: Colors.green)]
    };
    // log("attendanceSchedulesMap$attendanceSchedulesMap");
    kEvents = LinkedHashMap<DateTime, List<Event>>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(attendanceSchedulesMap!);

    return kEvents![day] ?? [];
  }
}



final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
final _kEventSource = {
  for (var item in List.generate(50, (index) => index))
    DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5): List.generate(
        item % 4 + 1, (index) => Event(title: "work", color: Colors.green))
};
