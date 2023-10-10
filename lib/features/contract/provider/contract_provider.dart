import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../../../app/core/app_snack_bar.dart';
import '../../../../../app/core/color_resources.dart';
import '../../../../../data/error/failures.dart';
import '../model/contract_model.dart';
import '../repo/contract_repo.dart';

class ContractProvider extends ChangeNotifier {
  final ContractRepo repo;
  ContractProvider({required this.repo});

  List<ContractModel> contracts = [];
  bool isLoading = false;
  getContracts() async {
    try {
      isLoading = true;
      contracts.clear();
      notifyListeners();

      Either<ServerFailure, Response> response = await repo.getContracts();
      response.fold((fail) {
        CustomSnackBar.showSnackBar(
            notification: AppNotification(
                message: fail.error,
                isFloating: true,
                backgroundColor: Styles.IN_ACTIVE,
                borderColor: Colors.transparent));
      }, (success) {
        if (success.data["data"] != null) {
          contracts = List<ContractModel>.from(
              success.data["data"].map((x) => ContractModel.fromJson(x)));
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
