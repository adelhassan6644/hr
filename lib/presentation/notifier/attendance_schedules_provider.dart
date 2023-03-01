import 'dart:collection';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hr_project/domain/localization/language_constant.dart';
import 'package:hr_project/domain/repositery/attendance_schedules_repo.dart';
import 'package:hr_project/navigation/custom_navigation.dart';
import '../../app/core/error/failures.dart';
import '../../app/core/utils/app_snack_bar.dart';
import '../../app/core/utils/color_resources.dart';
import '../../app/core/utils/extensions.dart';
import '../../data/model/attendance_schedules_model.dart';
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

  final ValueNotifier<List<Schedule>> selectedSchedules = ValueNotifier([]);

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
        startScheduleData= attendanceSchedules!.schedules!.first.start!;
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

      selectedSchedules.value = getSchedulesForDay(selectedDay);
    }
  }
  LinkedHashMap<DateTime, List<Schedule>>? kSchedules;
  Map<DateTime, List<Schedule>>? attendanceSchedulesMap={};

  List<Schedule> getSchedulesForDay(DateTime day) {
    attendanceSchedulesMap={};
    for (var employeeSchedule in attendanceSchedules!.schedules!) {

        if (attendanceSchedulesMap!.containsKey(employeeSchedule.start!)) {
          attendanceSchedulesMap?.update(employeeSchedule.start!, (value) {
            List<Schedule> newList= value;
            if(!newList.contains(employeeSchedule)) {
              newList.add(employeeSchedule);
            }
            return newList;
          });
        } else {

          attendanceSchedulesMap?.addAll({
            employeeSchedule.start!: [
              employeeSchedule.copyWith(
                color: employeeSchedule.start!.isAfter(DateTime.now())?Colors.green:ColorResources.primaryLight
              )
            ]
          });
        }

    }


  /*  attendanceSchedulesMap = {
      for (var employeeSchedule in attendanceSchedules!.schedules!)
        employeeSchedule.start!: [Schedule(title: getTranslated("work", CustomNavigator.navigatorState.currentContext!), color: Colors.green)]
    };*/
    // log("attendanceSchedulesMap$attendanceSchedulesMap");
    kSchedules = LinkedHashMap<DateTime, List<Schedule>>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(attendanceSchedulesMap!);

    return kSchedules![day] ?? [];
  }
}



final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);


