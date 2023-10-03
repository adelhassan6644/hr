import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../../../app/core/app_snack_bar.dart';
import '../../../../../app/core/color_resources.dart';
import '../../../../../data/error/failures.dart';
import '../../../../../main_models/custom_select_model.dart';
import '../repo/covenant_repo.dart';

class CovenantProvider extends ChangeNotifier {
  final CovenantRepo repo;
  CovenantProvider({required this.repo});
  List<CustomSelectModel> covenants = [];
  bool isLoading = false;
  getCovenant() async {
    try {
      isLoading = true;
      covenants.clear();
      notifyListeners();

      Either<ServerFailure, Response> response = await repo.getCovenant();
      response.fold((fail) {
        CustomSnackBar.showSnackBar(
            notification: AppNotification(
                message: fail.error,
                isFloating: true,
                backgroundColor: Styles.IN_ACTIVE,
                borderColor: Colors.transparent));
      }, (success) {
        if (success.data["data"] != null) {
          covenants = List<CustomSelectModel>.from(
              success.data["data"].map((x) => CustomSelectModel.fromJson(x)));
        }
      });
      isLoading = false;
      notifyListeners();
    } catch (e) {
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
}
