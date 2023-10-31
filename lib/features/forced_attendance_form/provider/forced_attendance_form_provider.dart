import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yusrPlus/features/forced_attendance_form/repo/forced_attendance_form_repo.dart';
import 'package:yusrPlus/features/home/provider/home_provider.dart';
import 'package:yusrPlus/navigation/custom_navigation.dart';
import '../../../app/core/app_snack_bar.dart';
import '../../../app/core/color_resources.dart';
import '../../../components/loading_dialog.dart';
import '../../../data/config/di.dart';
import '../../../data/error/failures.dart';
import '../../../helpers/alert_helper.dart';
import '../../../helpers/location_helper.dart';

class ForcedAttendanceFormProvider extends ChangeNotifier {
  final ForcedAttendanceFormRepo repo;
  ForcedAttendanceFormProvider({required this.repo});

  File? image;
  onSelectImage(File? file) {
    image = file;
    notifyListeners();
  }

  bool locationPermissionGranted = false;
  checkIn(id) async {
    if (await LocationHelper.checkLocation()) {
      try {
        loadingDialog();
        notifyListeners();

        Either<ServerFailure, Response> response =
            await repo.checkIn(id: id, image: image!);
        response.fold((fail) {
          CustomSnackBar.showSnackBar(
              notification: AppNotification(
                  message: fail.error,
                  isFloating: true,
                  backgroundColor: Styles.IN_ACTIVE,
                  borderColor: Styles.transparentColor));
        }, (success) {
          AlertHelper.startAlarm(isEnter: true);
          CustomNavigator.pop();
          sl<HomeProvider>().checkOnSchedule();
          CustomSnackBar.showSnackBar(
              notification: AppNotification(
                  message: success.data["message"] ?? "",
                  isFloating: true,
                  backgroundColor: Styles.ACTIVE,
                  borderColor: Styles.transparentColor));
        });

        CustomNavigator.pop();
        notifyListeners();
      } catch (e) {
        CustomNavigator.pop();
        CustomSnackBar.showSnackBar(
            notification: AppNotification(
                message: e.toString(),
                isFloating: true,
                backgroundColor: Styles.IN_ACTIVE,
                borderColor: Styles.transparentColor));
        notifyListeners();
      }
    }
  }
}
