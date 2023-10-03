import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yusrPlus/navigation/custom_navigation.dart';
import '../../../../../app/core/app_snack_bar.dart';
import '../../../../../app/core/color_resources.dart';
import '../../../../../app/localization/language_constant.dart';
import '../../../../../data/error/failures.dart';
import '../../../../../main_models/custom_select_model.dart';
import '../repo/loan_request_repo.dart';

class LoanRequestProvider extends ChangeNotifier {
  final LoanRequestRepo repo;
  LoanRequestProvider({required this.repo}){
    getTypes();
  }

  final TextEditingController amount = TextEditingController();
  final TextEditingController reason = TextEditingController();
  final TextEditingController loanAmount = TextEditingController();
  final TextEditingController numberOfMonths = TextEditingController();

  CustomSelectModel? selectedLoanType;
  onSelectLoanType(v) {
    selectedLoanType = v;
    notifyListeners();
  }

  List<CustomSelectModel> installmentMethods = [
    CustomSelectModel(
        id: 1,
        name: getTranslated("specified_number_of_months",
            CustomNavigator.navigatorState.currentContext!)),
    CustomSelectModel(
        id: 2,
        name: getTranslated("A_specified_monthly_amount",
            CustomNavigator.navigatorState.currentContext!)),
  ];
  CustomSelectModel? selectedInstallmentMethods;
  onSelectInstallmentMethods(v) {
    selectedInstallmentMethods = v;
    notifyListeners();
  }

  DateTime? installmentStartDate;
  onSelectInstallmentStartDate(v) {
    installmentStartDate = v;
    notifyListeners();
  }

  List<File> attachments = [];
  onSelectAttachments(v) {
    attachments.add(v);
    notifyListeners();
  }

  onRemoveAttachments(v) {
    attachments = v;
    notifyListeners();
  }

  List<CustomSelectModel> loanTypes = [];
  bool isGetting = false;
  getTypes() async {
    try {
      isGetting = true;
      loanTypes.clear();
      notifyListeners();

      Either<ServerFailure, Response> response = await repo.getTypes();
      response.fold((fail) {
        CustomSnackBar.showSnackBar(
            notification: AppNotification(
                message: fail.error,
                isFloating: true,
                backgroundColor: Styles.IN_ACTIVE,
                borderColor: Colors.transparent));
      }, (success) {
        if (success.data["data"] != null) {
          loanTypes = List<CustomSelectModel>.from(
              success.data["data"].map((x) => CustomSelectModel.fromJson(x)));
        }
      });
      isGetting = false;
      notifyListeners();
    } catch (e) {
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

  bool isLoading = false;
  onSubmit() async {
    try {
      isLoading = true;
      notifyListeners();
      var body = {
        "loan_type": selectedLoanType,
        "loan_amount": loanAmount.text.trim(),
        "start_date": installmentStartDate,
        "amount_per_month": amount.text.trim(),
        "number_of_months": numberOfMonths.text.trim(),
        "reason": reason.text.trim()
      };
      for (int i = 0; i < attachments.length; i++) {
        body.addAll({
          'attachments[$i]': await MultipartFile.fromFile(attachments[i].path)
        });
      }

      Either<ServerFailure, Response> response =
          await repo.sendLoadRequest(body);
      response.fold((fail) {
        CustomSnackBar.showSnackBar(
            notification: AppNotification(
                message: fail.error,
                isFloating: true,
                backgroundColor: Styles.IN_ACTIVE,
                borderColor: Colors.transparent));
      }, (success) {});
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
