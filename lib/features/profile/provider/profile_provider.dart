import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/color_resources.dart';

import '../../../app/core/app_snack_bar.dart';

import '../../../data/error/failures.dart';
import '../repo/profile_repo.dart';


class ProfileProvider extends ChangeNotifier {
  final ProfileRepo repo;
  ProfileProvider({required this.repo});



  bool _isLogin = false;
  bool get isLogin => _isLogin;
  getProfile() async {
    try {
      _isLogin = true;
      notifyListeners();
      Either<ServerFailure, Response> response = await repo.getProfile(
          );
      response.fold((fail) {
        CustomSnackBar.showSnackBar(
            notification: AppNotification(
                message: fail.error,
                isFloating: true,
                backgroundColor: Styles.IN_ACTIVE,
                borderColor: Styles.transparentColor));
        notifyListeners();
      }, (success) {


      });

      notifyListeners();
    } catch (e) {

      CustomSnackBar.showSnackBar(
          notification: AppNotification(
              message: e.toString(),
              isFloating: true,
              backgroundColor: Styles.IN_ACTIVE,
              borderColor: Styles.transparentColor));
      notifyListeners();
    }
  }

}
