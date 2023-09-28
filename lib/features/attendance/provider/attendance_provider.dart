import 'dart:collection';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../app/core/app_snack_bar.dart';
import '../../../app/core/color_resources.dart';
import '../../../app/core/extensions.dart';
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
  ) {
    day = selectedDay;

    notifyListeners();
    getDaySchedule();
  }

  Map<DateTime, List<Event>> eventsMAP = {};
  EventList<Event>? eventList;
  Widget _iconStyle(color) => Container(
        decoration: BoxDecoration(
          color: color.withOpacity(.4),
          borderRadius: BorderRadius.circular(1000),
        ),
      );
  List<ScheduleModel> schedules = [];

  bool isLoading = false;
  getEmployeeSchedule() async {
    try {
      isLoading = true;
      schedules.clear();
      eventList = null;
      eventsMAP = {};
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
        if (success.data["data"]["schedules"] != null) {
          schedules = List<ScheduleModel>.from(success.data["data"]["schedules"]
              .map((x) => ScheduleModel.fromJson(x)));
          for (var element in schedules) {
            {
              eventsMAP[DateTime(element.start!.year, element.start!.month,
                  element.start!.day)] = [
                Event(date: element.start!, icon: _iconStyle(element.color))
              ];
            }
          }
          onDaySelected(
            DateTime.now(),
          );
        }
      });
      eventList = EventList<Event>(events: eventsMAP);
      isLoading = false;
      notifyListeners();
    } catch (e) {
      schedules.clear();
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

  LinkedHashMap<DateTime, List<ScheduleModel>>? kSchedules;
  Map<DateTime, List<ScheduleModel>>? attendanceSchedulesMap = {};
  List loadSchedule(DateTime day) {
    {
      attendanceSchedulesMap = {};
      for (var item in schedules) {
        if (attendanceSchedulesMap!.containsKey(item.start!)) {
          attendanceSchedulesMap?.update(item.start!, (value) {
            List<ScheduleModel> newList = value;
            if (!newList.contains(item)) {
              newList.add(item);
            }
            return newList;
          });
        } else {
          attendanceSchedulesMap?.addAll({
            item.start!: [item]
          });
        }
      }

      kSchedules = LinkedHashMap<DateTime, List<ScheduleModel>>(
        equals: isSameDay,
        hashCode: getHashCode,
      )..addAll(attendanceSchedulesMap!);

      return kSchedules![day] ?? [];
    }
  }

  // List loadSchedule(DateTime day) {
  //   final kEventSource = {
  //     for (var item in schedules!) {
  //         item.start!: [item.color]
  //       }
  //   };
  //   final kEvents = LinkedHashMap<DateTime, List>(
  //     equals: isSameDay,
  //     hashCode: getHashCode,
  //   )..addAll(kEventSource);
  //   return kEvents[day] ?? [];
  // }
}
