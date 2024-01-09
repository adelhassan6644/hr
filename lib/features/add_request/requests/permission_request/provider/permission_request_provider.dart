import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import '../../../../../app/core/app_snack_bar.dart';
import '../../../../../app/core/color_resources.dart';
import '../../../../../app/localization/language_constant.dart';
import '../../../../../data/error/failures.dart';
import '../../../../../main_models/custom_select_model.dart';
import '../../../../../navigation/custom_navigation.dart';
import '../repo/permission_request_repo.dart';

class PermissionRequestProvider extends ChangeNotifier {
  final PermissionRequestRepo repo;
  PermissionRequestProvider({required this.repo}) {
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

  clear() {
    selectedPermissionType = null;
    selectedDate = null;
    startDate = null;
    endDate = null;
    reason.clear();
    attachments.clear();
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
          types = List<CustomSelectModel>.from(success.data["data"].map((x) => CustomSelectModel.fromJson(x)));
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

      List<dynamic> files = [];

      if (attachments.isNotEmpty) {
        for (int i = 0; i < attachments.length; i++) {
          files.add(MultipartFile.fromFileSync(attachments[i].path, filename: attachments[i].path.split('/').last));
        }
      }

      var body = {
        "permission_type": selectedPermissionType?.id,
        "employee_id": repo.userId,
        "day": selectedDate?.postDateFormat(),
        "come_time": startDate?.postTimeFormat(),
        "leave_time": endDate?.postTimeFormat(),
        "reason": reason.text.trim(),
        "photos[]": files
      };

      Either<ServerFailure, Response> response = await repo.sendRequest(body);
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
                    "your_request_has_been_sent_successfully", CustomNavigator.navigatorState.currentContext!),
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
