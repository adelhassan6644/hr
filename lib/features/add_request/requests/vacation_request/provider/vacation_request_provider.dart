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
import '../repo/vacation_request_repo.dart';

class VacationRequestProvider extends ChangeNotifier {
  final VacationRequestRepo repo;
  VacationRequestProvider({required this.repo}) {
    getTypes();
  }

  final TextEditingController reason = TextEditingController();
  String? duration;

  CustomSelectModel? selectedVacationType;
  onSelectVacationType(v) {
    selectedVacationType = v;
    getDuration();
    notifyListeners();
  }

  DateTime? startDate;
  onSelectStartDate(v) {
    startDate = v;
    getDuration();
    notifyListeners();
  }

  getDuration() {
    if (startDate != null && endDate != null) {
      duration =
          "${getTranslated("vacation_duration", CustomNavigator.navigatorState.currentContext!)} : ${endDate!.difference(startDate!).inDays.toString()}";
    }
    notifyListeners();
  }

  DateTime? endDate;
  onSelectEndDate(v) {
    endDate = v;
    getDuration();
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

  clear() {
    selectedVacationType = null;
    startDate = null;
    endDate = null;
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

      Map<String, dynamic> body = {
        "vaction_type_id": selectedVacationType?.id,
        "employee_id": repo.userId,
        "start_at": startDate?.postDateFormat(),
        "end_at": endDate?.postDateFormat(),
        "reason": reason.text.trim(),
        "photos[]": files
      };

      Either<ServerFailure, Response> response =
          await repo.sendVacationRequest(body);
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
