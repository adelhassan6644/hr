import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hr_project/app/core/color_resources.dart';
import '../../../app/core/app_snack_bar.dart';
import '../../../data/error/failures.dart';
import '../repo/auth_repo.dart';
import '../../../navigation/custom_navigation.dart';
import '../../../navigation/routes.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepo authRepo;
  AuthProvider({
    required this.authRepo,
  });
  final TextEditingController _emailTEC =
      TextEditingController(text: kDebugMode ? "mazensk8@gmail.com" : '');
  final TextEditingController _passwordTEC =
      TextEditingController(text: kDebugMode ? "123456789" : '');
  final TextEditingController _newPasswordTEC = TextEditingController();
  final TextEditingController _confirmPasswordTEC = TextEditingController();
  final TextEditingController codeTEC = TextEditingController();

  TextEditingController get emailTEC => _emailTEC;
  TextEditingController get passwordTEC => _passwordTEC;
  TextEditingController get newPasswordTEC => _newPasswordTEC;
  TextEditingController get confirmPasswordTEC => _confirmPasswordTEC;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  // bool samePassword = false;

  bool get isLogin => authRepo.isLoggedIn();

  logIn() async {
    try {
      {
        _isLoading = true;
        notifyListeners();
        Either<ServerFailure, Response> response = await authRepo.logIn(
            email: _emailTEC.text.trim(), password: _passwordTEC.text.trim());
        response.fold((fail) {
          CustomSnackBar.showSnackBar(
              notification: AppNotification(
                  message: fail.error,
                  isFloating: true,
                  backgroundColor: Styles.IN_ACTIVE,
                  borderColor: Styles.transparentColor));
          notifyListeners();
        }, (success) {
          // _passwordTEC.clear();
          CustomNavigator.push(Routes.DASHBOARD, clean: true);
        });
        _isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      _isLoading = false;
      notifyListeners();
    }
  }

  getOTP() async {
    try {
      _isLoading = true;
      notifyListeners();
      Either<ServerFailure, Response> response =
          await authRepo.getVerificationCode(
        email: _emailTEC.text.trim(),
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
        CustomNavigator.push(Routes.VERIFICATION_CODE, replace: true);
      });
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      CustomSnackBar.showSnackBar(
          notification: AppNotification(
              message: e.toString(),
              isFloating: true,
              backgroundColor: Styles.IN_ACTIVE,
              borderColor: Styles.transparentColor));

      notifyListeners();
    }
  }

  sendOTP() async {
    try {
      {
        _isLoading = true;
        notifyListeners();
        Either<ServerFailure, Response> response =
            await authRepo.sendVerificationCode(
          code: codeTEC.text.trim(),
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
          CustomNavigator.push(Routes.RESET_PASSWORD, replace: true);
        });
        _isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      _isLoading = false;
      CustomSnackBar.showSnackBar(
          notification: AppNotification(
              message: e.toString(),
              isFloating: true,
              backgroundColor: Styles.IN_ACTIVE,
              borderColor: Styles.transparentColor));
      notifyListeners();
    }
  }

  reSendOTP() async {
    await authRepo.getVerificationCode(
      email: _emailTEC.text.trim(),
    );
  }

  resetPassword() async {
    try {
      _isLoading = true;
      notifyListeners();
      Either<ServerFailure, Response> response = await authRepo.resetPassword(
        newPassword: _newPasswordTEC.text.trim(),
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
        CustomNavigator.push(Routes.LOGIN, clean: true);
        CustomSnackBar.showSnackBar(
            notification: AppNotification(
                message: "Your Password Change successfully !",
                isFloating: true,
                backgroundColor: Styles.ACTIVE,
                borderColor: Styles.transparentColor));
      });
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
    }
  }

  updatePassword() async {
    try {
      _isLoading = true;
      notifyListeners();
      Either<ServerFailure, Response> response = await authRepo.updatePassword(
        email: _emailTEC.text.trim(),
        password: _passwordTEC.text.trim(),
        newPassword: _newPasswordTEC.text.trim(),
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
        CustomNavigator.push(Routes.LOGIN, clean: true);
        CustomSnackBar.showSnackBar(
            notification: AppNotification(
                message: "Your Password updated successfully !",
                isFloating: true,
                backgroundColor: Styles.ACTIVE,
                borderColor: Styles.transparentColor));
      });
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
    }
  }

  logOut() async {
    CustomNavigator.push(Routes.LOGIN, clean: true);
    await authRepo.clearSharedData();
    CustomSnackBar.showSnackBar(
        notification: AppNotification(
            message: "You logged out successfully !",
            isFloating: true,
            backgroundColor: Styles.ACTIVE,
            borderColor: Styles.transparentColor));
    notifyListeners();
  }
}
