import 'dart:developer';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import '../../app/core/error/failures.dart';
import '../../app/core/utils/app_snack_bar.dart';
import '../../app/core/utils/color_resources.dart';
import '../../data/model/user_model.dart';
import '../../domain/repositery/profile_repo.dart';

class ProfileProvider extends ChangeNotifier {
  ProfileRepo profileRepo;
  UserModel user;
  ProfileProvider({required this.profileRepo, required this.user});

  bool isLoading = false;

  File? profileImage;

  getUserDate() async {
    try {
      isLoading = true;
      Either<ServerFailure, UserModel> response =await profileRepo.getUser();
      response.fold((fail) {
        isLoading = false;
        CustomSnackBar.showSnackBar(
            notification: AppNotification(
                message: fail.error,
                isFloating: true,
                backgroundColor: ColorResources.IN_ACTIVE,
                borderColor: ColorResources.transparentColor));
        notifyListeners();
      }, (success) {
        isLoading = false;
        log(success.id.toString());
        user = success;
        notifyListeners();
      });
    } catch (e) {
      isLoading = false;
      CustomSnackBar.showSnackBar(
          notification: AppNotification(
              message: e.toString(),
              isFloating: true,
              backgroundColor: ColorResources.IN_ACTIVE,
              borderColor: ColorResources.transparentColor));
      notifyListeners();
    }
  }
}
