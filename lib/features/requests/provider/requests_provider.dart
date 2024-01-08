import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../../../app/core/app_snack_bar.dart';
import '../../../../../app/core/color_resources.dart';
import '../../../../../data/error/failures.dart';
import '../model/request_model.dart';
import '../repo/requests_repo.dart';

class RequestsProvider extends ChangeNotifier {
  final RequestsRepo repo;
  RequestsProvider({required this.repo});

  List<RequestModel> requests = [];
  bool isLoading = false;
  getRequests() async {
    try {
      isLoading = true;
      notifyListeners();

      Either<ServerFailure, Response> response = await repo.getRequests();
      response.fold((fail) {
        CustomSnackBar.showSnackBar(
            notification: AppNotification(
                message: fail.error,
                isFloating: true,
                backgroundColor: Styles.IN_ACTIVE,
                borderColor: Colors.transparent));
      }, (success) {
        if (success.data["data"] != null) {
          requests = List<RequestModel>.from(success.data["data"].map((x) => RequestModel.fromJson(x)));
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

enum RequestType { vacation, loan, pledge, permission, pledgeRelease }
