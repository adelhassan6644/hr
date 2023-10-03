import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../../../app/core/app_snack_bar.dart';
import '../../../../../app/core/color_resources.dart';
import '../../../../../data/error/failures.dart';
import '../../../../../main_models/custom_select_model.dart';
import '../repo/permission_request_repo.dart';

class PermissionRequestProvider extends ChangeNotifier {
  final PermissionRequestRepo repo;
  PermissionRequestProvider({required this.repo}){
    getTypes();
  }

  final TextEditingController reason = TextEditingController();

  CustomSelectModel? selectedPermissionType;
  onSelectLoanType(v) {
    selectedPermissionType = v;
    notifyListeners();
  }

  DateTime? selectedDate;
  onSelectDate(v) {
    selectedDate = v;
    notifyListeners();
  }

  DateTime? startDate;
  onSelectStartDate(v) {
    startDate = v;
    notifyListeners();
  }

  DateTime? endDate;
  onSelectEndDate(v) {
    endDate = v;
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

  List<CustomSelectModel> types = [];
  bool isGetting = false;
  getTypes() async {
    try {
      isGetting = true;
      types.clear();
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
          types = List<CustomSelectModel>.from(
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
        "permission_type": selectedPermissionType,
        "date": selectedDate,
        "reason": reason.text.trim()
      };
      for (int i = 0; i < attachments.length; i++) {
        body.addAll({
          'attachments[$i]': await MultipartFile.fromFile(attachments[i].path)
        });
      }

      Either<ServerFailure, Response> response = await repo.sendRequest("");
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
