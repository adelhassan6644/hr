import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:yusrPlus/features/profile/repo/profile_repo.dart';
import '../app/core/app_snack_bar.dart';
import '../app/core/color_resources.dart';
import '../data/error/failures.dart';
import '../data/model/user_model.dart';
import '../main_repos/user_repo.dart';

class UserProvider extends ChangeNotifier {
  UserRepo repo;
  ProfileRepo profileRepo;
  UserProvider({required this.repo,required this.profileRepo});

  bool get isLogin => repo.isLogIn();
  UserModel? user;
  getUserDate() async {
    // try {
      user = null;
      // await profileRepo.getProfile();
      // Either<ServerFailure, UserModel> response = await repo.getUser();
      Either<ServerFailure, Response> response = await profileRepo.getProfile();
      response.fold((fail) {
        CustomSnackBar.showSnackBar(
            notification: AppNotification(
                message: fail.error,
                isFloating: true,
                backgroundColor: Styles.IN_ACTIVE,
                borderColor: Styles.transparentColor));
      }, (success) {
        user = UserModel.fromJson(success.data['data']['employee']);
      });
      notifyListeners();
    // } catch (e) {
    //   CustomSnackBar.showSnackBar(
    //       notification: AppNotification(
    //           message: e.toString(),
    //           isFloating: true,
    //           backgroundColor: Styles.IN_ACTIVE,
    //           borderColor: Styles.transparentColor));
    //   notifyListeners();
    // }
  }
}
