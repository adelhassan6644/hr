import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/color_resources.dart';

import '../../../app/core/app_snack_bar.dart';

import '../../../data/error/failures.dart';
import '../model/request_details_model.dart';
import '../repo/request_details_repo.dart';

class RequestDetailsProvider extends ChangeNotifier {
  final RequestDetailsRepo repo;
  RequestDetailsProvider({required this.repo});

  RequestDetailsModel? model;
  bool isLoading = false;
  getRequestDetails(id) async {
    try {
      model = null;
      isLoading = true;
      notifyListeners();
      Either<ServerFailure, Response> response = await repo.getRequestDetails(id);
      response.fold((fail) {
        CustomSnackBar.showSnackBar(
            notification: AppNotification(
                message: fail.error,
                isFloating: true,
                backgroundColor: Styles.IN_ACTIVE,
                borderColor: Styles.transparentColor));
      }, (success) {
        model = RequestDetailsModel.fromJson(success.data["data"]);
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
