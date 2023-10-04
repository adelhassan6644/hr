import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import 'package:yusrPlus/navigation/custom_navigation.dart';
import '../../../../../app/core/app_snack_bar.dart';
import '../../../../../app/core/color_resources.dart';
import '../../../../../app/localization/language_constant.dart';
import '../../../../../data/error/failures.dart';
import '../../../../../main_models/custom_select_model.dart';
import '../repo/loan_request_repo.dart';

class LoanRequestProvider extends ChangeNotifier {
  final LoanRequestRepo repo;
  LoanRequestProvider({required this.repo}) {
    getTypes();
  }

  final TextEditingController amountPerMounth = TextEditingController();
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

  clear() {
    selectedLoanType = null;
    amountPerMounth.clear();
    installmentStartDate = null;
    reason.clear();
    attachments.clear();
  }

  bool isLoading = false;
  onSubmit() async {
    try {
      isLoading = true;
      notifyListeners();
      List<dynamic> files = [];
      if (attachments.isNotEmpty) {
        for (int i = 0; i < attachments.length; i++) {
          files.add(MultipartFile.fromFileSync(attachments[i].path,
              filename: attachments[i].path.split('/').last));
        }
      }

      var body = {
        "loan_type_id": selectedLoanType,
        "employee_id": repo.userId,
        "amount": loanAmount.text.trim(),
        "start_date": installmentStartDate?.postDateFormat(),
        "amount_per_month": amountPerMounth.text.trim(),
        "number_of_months": numberOfMonths.text.trim(),
        "comment": reason.text.trim(),
        "photos": files
      };

      Either<ServerFailure, Response> response =
          await repo.sendLoadRequest(body);
      response.fold((fail) {
        CustomSnackBar.showSnackBar(
            notification: AppNotification(
                message: fail.error,
                isFloating: true,
                backgroundColor: Styles.IN_ACTIVE,
                borderColor: Colors.transparent));
      }, (success) {
        clear();
        CustomSnackBar.showSnackBar(
            notification: AppNotification(
                message: getTranslated(
                    "your_request_has_been_sent_successfully",
                    CustomNavigator.navigatorState.currentContext!),
                isFloating: true,
                backgroundColor: Styles.ACTIVE,
                borderColor: Colors.transparent));
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
