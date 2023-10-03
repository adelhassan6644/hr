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
import '../repo/vacation_request_repo.dart';

class VacationRequestProvider extends ChangeNotifier {
  final VacationRequestRepo repo;
  VacationRequestProvider({required this.repo});

  final TextEditingController reason = TextEditingController();
  String? duration;

  List<CustomSelectModel> vacationTypes = [
    CustomSelectModel(id: 1, title: "title"),
    CustomSelectModel(id: 2, title: "title2"),
    CustomSelectModel(id: 3, title: "title3"),
  ];

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

  bool isLoading = false;
  onSubmit() async {
    try {
      isLoading = true;
      notifyListeners();
      var body = {
        "vacation_type": selectedVacationType,
        "reason": reason.text.trim()
      };
      for (int i = 0; i < attachments.length; i++) {
        body.addAll({
          'attachments[$i]': await MultipartFile.fromFile(attachments[i].path)
        });
      }

      Either<ServerFailure, Response> response =
          await repo.sendVacationRequest("");
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
