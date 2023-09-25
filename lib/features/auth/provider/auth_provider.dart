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
import '../../notifier/base_vm.dart';

class AuthProvider extends ChangeNotifier with BaseViewModel {
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

  TextEditingController get emailTEC => _emailTEC;
  TextEditingController get passwordTEC => _passwordTEC;
  TextEditingController get newPasswordTEC => _newPasswordTEC;
  TextEditingController get confirmPasswordTEC => _confirmPasswordTEC;


  bool _isLoading = false;
  bool isError = false;
  bool get isLoading => _isLoading;
  // bool samePassword = false;

  late String _otp="";
  String get otp=>_otp;

  bool get isLogin => authRepo.isLoggedIn();

  logIn() async {
    try {
      {
        isError = false;
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
          isError = true;
          notifyListeners();
        }, (success) {
          // _passwordTEC.clear();
          CustomNavigator.push(Routes.DASHBOARD, clean: true);
        });
        _isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      isError = true;
      _isLoading = false;
      notifyListeners();
    }
  }

  getOTP() async {
    try {
      {
        isError = false;
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
          isError = true;
          notifyListeners();
        }, (success) {
          CustomNavigator.push(Routes.VERIFICATION_CODE, replace: true);
        });
        _isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      isError = true;
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

  updateOTP(String value) {
    _otp=value;
    notifyListeners();
  }

  sendOTP() async {
    try {
      {
        isError = false;
        _isLoading = true;
        notifyListeners();
        Either<ServerFailure, Response> response =
            await authRepo.sendVerificationCode(
          code: _otp,
        );
        response.fold((fail) {
          CustomSnackBar.showSnackBar(
              notification: AppNotification(
                  message: fail.error,
                  isFloating: true,
                  backgroundColor: Styles.IN_ACTIVE,
                  borderColor: Styles.transparentColor));
          isError = true;
          notifyListeners();
        }, (success) {
          // _otp.clear();
          CustomNavigator.push(Routes.RESET_PASSWORD, replace: true);
        });
        _isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      isError = true;
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
      {
        isError = false;
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
          isError = true;
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
      }
    } catch (e) {
      isError = true;
      _isLoading = false;
      notifyListeners();
    }
  }

  updatePassword() async {
    try {
      {
        isError = false;
        _isLoading = true;
        notifyListeners();
        Either<ServerFailure, Response> response =
            await authRepo.updatePassword(
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

          isError = true;
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
      }
    } catch (e) {
      isError = true;
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
