import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import '../app/core/app_snack_bar.dart';
import '../app/core/color_resources.dart';
import '../data/error/failures.dart';
import '../data/model/user_model.dart';
import '../main_repos/user_repo.dart';

class UserProvider extends ChangeNotifier {
  UserRepo repo;
  UserProvider({required this.repo});

  bool isLoading = false;

  UserModel? user;
  getUserDate() async {
    try {
      isLoading = true;
      user = null;
      Either<ServerFailure, UserModel> response = await repo.getUser();
      response.fold((fail) {
        CustomSnackBar.showSnackBar(
            notification: AppNotification(
                message: fail.error,
                isFloating: true,
                backgroundColor: Styles.IN_ACTIVE,
                borderColor: Styles.transparentColor));
      }, (success) {
        user = success;
      });
      isLoading = false;
      notifyListeners();
    } catch (e) {
      CustomSnackBar.showSnackBar(
          notification: AppNotification(
              message: e.toString(),
              isFloating: true,
              backgroundColor: Styles.IN_ACTIVE,
              borderColor: Styles.transparentColor));
      isLoading = false;
      notifyListeners();
    }
  }
}
