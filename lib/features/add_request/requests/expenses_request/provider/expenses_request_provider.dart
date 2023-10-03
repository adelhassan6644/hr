import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../../../app/core/app_snack_bar.dart';
import '../../../../../app/core/color_resources.dart';
import '../../../../../data/error/failures.dart';
import '../repo/expenses_request_repo.dart';

class ExpensesRequestProvider extends ChangeNotifier {
  final ExpensesRequestRepo repo;
  ExpensesRequestProvider({required this.repo});

  final TextEditingController reason = TextEditingController();
  final TextEditingController title = TextEditingController();
  final TextEditingController amount = TextEditingController();
  final TextEditingController description = TextEditingController();

  // DateTime? date;
  // onSelectDate(v) {
  //   date = v;
  //   notifyListeners();
  // }

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
      Map<String, dynamic> body = {
        "title": title.text.trim(),
        "amount": amount.text.trim(),
        "description": description.text.trim(),
        "reason": reason.text.trim(),
      };
      for (int i = 0; i < attachments.length; i++) {
        body.addAll({
          'attachments[$i]': await MultipartFile.fromFile(attachments[i].path)
        });
      }

      Either<ServerFailure, Response> response =
          await repo.sendExpensesRequest("");
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
