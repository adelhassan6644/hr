import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../app/core/app_snack_bar.dart';
import '../../../app/core/color_resources.dart';
import '../../../data/error/failures.dart';
import '../model/salary_model.dart';
import '../repo/salary_repo.dart';

class SalaryProvider extends ChangeNotifier {
  final SalaryRepo repo;
  SalaryProvider({required this.repo});

  SalaryModel? salaryModel;
  bool isLoading = false;
  getSalaryDetails() async {
    try {
      isLoading = true;
      salaryModel = null;
      notifyListeners();
      Either<ServerFailure, Response> response = await repo.getSalaryDetails();
      response.fold((fail) {
        CustomSnackBar.showSnackBar(
            notification: AppNotification(
                message: fail.error,
                isFloating: true,
                backgroundColor: Styles.IN_ACTIVE,
                borderColor: Styles.transparentColor));
      }, (success) {
        if (success.data["data"] != null) {
          salaryModel = SalaryModel.fromJson(success.data["data"]);
        }
      });

      isLoading = false;
      notifyListeners();
    } catch (e) {
      CustomSnackBar.showSnackBar(
          notification: AppNotification(
              message: e.toString(),
              isFloating: true,
              backgroundColor: Styles.IN_ACTIVE,
              borderColor: Styles.transparentColor));
      isLoading = false;
      notifyListeners();
    }
  }
}
