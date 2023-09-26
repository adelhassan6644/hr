import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../app/core/app_snack_bar.dart';
import '../../../app/core/color_resources.dart';
import '../../../components/loading_dialog.dart';
import '../../../data/error/failures.dart';
import '../../../helpers/alert_helper.dart';
import '../../../helpers/location_helper.dart';
import '../../../navigation/custom_navigation.dart';
import '../repo/home_repo.dart';

class HomeProvider extends ChangeNotifier {
  final HomeRepo repo;
  HomeProvider({required this.repo});
  bool locationPermissionGranted = false;

  checkIn() async {
    if (await LocationHelper.checkLocation()) {
      try {
        loadingDialog();
        notifyListeners();
        Either<ServerFailure, Response> response = await repo.checkIn();
        response.fold((fail) {
          AlertHelper.startAlarm(isEnter: true);
          CustomSnackBar.showSnackBar(
              notification: AppNotification(
                  message: fail.error,
                  isFloating: true,
                  backgroundColor: Styles.IN_ACTIVE,
                  borderColor: Styles.transparentColor));
        }, (success) {
          AlertHelper.startAlarm(isEnter: true);
          CustomSnackBar.showSnackBar(
              notification: AppNotification(
                  message: success.data["message"],
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
