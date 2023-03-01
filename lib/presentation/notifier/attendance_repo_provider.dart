import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../app/core/error/failures.dart';
import '../../app/core/utils/app_snack_bar.dart';
import '../../app/core/utils/color_resources.dart';
import '../../navigation/custom_navigation.dart';
import '../../presentation/base/regular_location_permission.bottomsheet.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/repositery/attendance_repo.dart';
import '../base/loading_dialog.dart';

class AttendanceProvider extends ChangeNotifier {
  final AttendanceRepo attendanceRepo;
  AttendanceProvider({
    required this.attendanceRepo,
  });
  bool locationPermissinGranted = false;
  bool isError = false;
  bool isLoading = false;

  handleLocationPermission() async {
    PermissionStatus status = await Permission.location.request();
    if (status.isGranted) {
      locationPermissinGranted = status.isGranted;
      sendAttendEmployee();

    } else {
      CustomSnackBar.showSnackBar(
          notification: AppNotification(
              message: "Location Permission denied",
              isFloating: true,
              backgroundColor: ColorResources.IN_ACTIVE,
              borderColor: ColorResources.transparentColor));
    }

    if (status.isPermanentlyDenied) {
      //When the user previously rejected the permission and select never ask again
      //Open the screen of settings
      await openAppSettings();
      status = await Permission.location.request();
      locationPermissinGranted = status.isGranted;
      sendAttendEmployee();

    }
  }

  sendAttendEmployee() async {
    try {

      {
        isError = false;
        isLoading = true;
        loadingDialog();
        notifyListeners();
        Either<ServerFailure, Response> response =
            await attendanceRepo.attendEmployee();
        response.fold((fail) {
          CustomNavigator.pop();
          CustomSnackBar.showSnackBar(
              notification: AppNotification(
                  message: fail.error,
                  isFloating: true,
                  backgroundColor: ColorResources.IN_ACTIVE,
                  borderColor: ColorResources.transparentColor));
          isError = true;
          notifyListeners();
        }, (success) {
          CustomNavigator.pop();
          CustomSnackBar.showSnackBar(
              notification: AppNotification(
                  message: "Success",
                  isFloating: true,
                  backgroundColor: ColorResources.ACTIVE,
                  borderColor: ColorResources.transparentColor));
        });

        isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      CustomNavigator.pop();
      isError = true;
      isLoading = false;
      notifyListeners();
    }
  }
}
