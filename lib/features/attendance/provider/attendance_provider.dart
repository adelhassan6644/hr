import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../app/core/app_snack_bar.dart';
import '../../../app/core/color_resources.dart';
import '../../../data/error/failures.dart';

import '../model/schedules_model.dart';
import '../repo/attendance_repo.dart';

class AttendanceProvider extends ChangeNotifier {
  final AttendanceRepo repo;
  AttendanceProvider({required this.repo});
  bool locationPermissionGranted = false;

  CalendarFormat calendarFormat = CalendarFormat.month;
  onChangeFormat(v) {
    calendarFormat = v;
    notifyListeners();
  }

  final kFirstDay = DateTime(
      DateTime.now().year, DateTime.now().month - 3, DateTime.now().day);
  final kLastDay = DateTime(
      DateTime.now().year, DateTime.now().month + 3, DateTime.now().day);

  DateTime day = DateTime.now();
  DateTime focusedDay = DateTime.now();
  void onDaySelected(
    DateTime selectedDay,
    DateTime fDay,
  ) {
    if (!isSameDay(day, selectedDay)) {
      day = selectedDay;
      focusedDay = fDay;
      notifyListeners();
      getDaySchedule();
    }
  }

  List<ScheduleModel>? schedules;
  bool isLoading = false;
  getEmployeeSchedule() async {
    try {
      isLoading = true;
      schedules?.clear();
      notifyListeners();
      Either<ServerFailure, Response> response =
          await repo.getEmployeeSchedules();
      response.fold((fail) {
        CustomSnackBar.showSnackBar(
            notification: AppNotification(
                message: fail.error,
                isFloating: true,
                backgroundColor: Styles.IN_ACTIVE,
                borderColor: Colors.transparent));
      }, (success) {
        if (success.data["data"]["attendances"]["data"] != null ) {
          schedules = List<ScheduleModel>.from(success.data["data"]["attendances"]["data"]
              .map((x) => ScheduleModel.fromJson(x)));
        }
      });
      isLoading = false;
      notifyListeners();
    } catch (e) {
      schedules?.clear();
      isLoading = false;
      CustomSnackBar.showSnackBar(
          notification: AppNotification(
              message: e.toString(),
              isFloating: true,
              backgroundColor: Styles.IN_ACTIVE,
              borderColor: Colors.transparent));
      notifyListeners();
    }
  }

  List<ScheduleModel> daySchedules = [];
  bool isGetting = false;
  getDaySchedule() async {
    try {
      isGetting = true;
      daySchedules.clear();
      notifyListeners();
      Either<ServerFailure, Response> response =
          await repo.getDaySchedules(day);
      response.fold((fail) {
        CustomSnackBar.showSnackBar(
            notification: AppNotification(
                message: fail.error,
                isFloating: true,
                backgroundColor: Styles.IN_ACTIVE,
                borderColor: Colors.transparent));
      }, (success) {
        if (success.data["data"] != null && success.data["data"] != []) {
          daySchedules = List<ScheduleModel>.from(
              success.data["data"].map((x) => ScheduleModel.fromJson(x)));
        }
      });
      isGetting = false;
      notifyListeners();
    } catch (e) {
      daySchedules.clear();
      isGetting = false;
      CustomSnackBar.showSnackBar(
          notification: AppNotification(
              message: e.toString(),
              isFloating: true,
              backgroundColor: Styles.IN_ACTIVE,
              borderColor: Colors.transparent));
      notifyListeners();
    }
  }

  // List loadSchedule(DateTime day) {
  //   final kEventSource = {
  //     for (var item in schedules!)
  //       item.start!: List.generate(
  //           item.startTime!.day, (index) => ('Event $item | ${index + 1}'))
  //   };
  //   final kEvents = LinkedHashMap<DateTime, List>(
  //     equals: isSameDay,
  //     hashCode: getHashCode,
  //   )..addAll(kEventSource);
  //   return kEvents[day] ?? [];
  // }
}
