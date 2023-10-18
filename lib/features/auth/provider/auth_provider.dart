import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/color_resources.dart';
import 'package:yusrPlus/app/localization/language_constant.dart';
import 'package:yusrPlus/main_page/provider/dashboard_provider.dart';
import '../../../app/core/app_snack_bar.dart';
import '../../../data/config/di.dart';
import '../../../data/error/api_error_handler.dart';
import '../../../data/error/failures.dart';
import '../repo/auth_repo.dart';
import '../../../navigation/custom_navigation.dart';
import '../../../navigation/routes.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepo authRepo;
  AuthProvider({required this.authRepo});

  final TextEditingController _emailTEC =
      TextEditingController(text: kDebugMode ? "sadmin@sc2.com" : '');
  final TextEditingController _currentPasswordTEC =
      TextEditingController(text: kDebugMode ? "123456789" : '');
  final TextEditingController _newPasswordTEC = TextEditingController();
  final TextEditingController _confirmPasswordTEC = TextEditingController();
  final TextEditingController codeTEC = TextEditingController();

  TextEditingController get emailTEC => _emailTEC;
  TextEditingController get currentPasswordTEC => _currentPasswordTEC;
  TextEditingController get newPasswordTEC => _newPasswordTEC;
  TextEditingController get confirmPasswordTEC => _confirmPasswordTEC;

  clear() {
    _emailTEC.clear();
    _currentPasswordTEC.clear();
    _newPasswordTEC.clear();
    _confirmPasswordTEC.clear();
    codeTEC.clear();
  }

  bool _isLogin = false;
  bool get isLogin => _isLogin;
  logIn() async {
    try {
      _isLogin = true;
      notifyListeners();
      Either<ServerFailure, Response> response = await authRepo.logIn(
          email: _emailTEC.text.trim(),
          password: _currentPasswordTEC.text.trim());
      response.fold((fail) {
        CustomSnackBar.showSnackBar(
            notification: AppNotification(
                message: fail.error,
                isFloating: true,
                backgroundColor: Styles.IN_ACTIVE,
                borderColor: Styles.transparentColor));
        notifyListeners();
      }, (success) {
        CustomSnackBar.showSnackBar(
            notification: AppNotification(
                message: getTranslated("logged_in_successfully",
                    CustomNavigator.navigatorState.currentContext!),
                isFloating: true,
                backgroundColor: Styles.ACTIVE,
                borderColor: Styles.transparentColor));
        CustomNavigator.push(Routes.DASHBOARD, clean: true);
        clear();
      });
      _isLogin = false;
      notifyListeners();
    } catch (e) {
      _isLogin = false;
      CustomSnackBar.showSnackBar(
          notification: AppNotification(
              message: e.toString(),
              isFloating: true,
              backgroundColor: Styles.IN_ACTIVE,
              borderColor: Styles.transparentColor));
      notifyListeners();
    }
  }

  resend() async {
    await authRepo.resendCode(
      mail: _emailTEC.text.trim(),
    );
  }

  bool _isForget = false;
  bool get isForget => _isForget;
  forgetPassword() async {
    try {
      _isForget = true;
      notifyListeners();
      Either<ServerFailure, Response> response = await authRepo.forgetPassword(
        mail: _emailTEC.text.trim(),
      );
      response.fold((fail) {
        CustomSnackBar.showSnackBar(
            notification: AppNotification(
                message: fail.error,
                isFloating: true,
                backgroundColor: Styles.IN_ACTIVE,
                borderColor: Colors.transparent));
      }, (success) {
        CustomNavigator.push(Routes.VERIFICATION, replace: true);
      });
      _isForget = false;
      notifyListeners();
    } catch (e) {
      CustomSnackBar.showSnackBar(
          notification: AppNotification(
              message: ApiErrorHandler.getMessage(e),
              isFloating: true,
              backgroundColor: Styles.IN_ACTIVE,
              borderColor: Colors.transparent));
      _isForget = false;
      notifyListeners();
    }
  }

  bool _isVerify = false;
  bool get isVerify => _isVerify;
  verify() async {
    try {
      _isVerify = true;
      notifyListeners();
      Either<ServerFailure, Response> response = await authRepo.verifyMail(
        mail: _emailTEC.text.trim(),
        code: codeTEC.text.trim(),
      );
      response.fold((fail) {
        CustomSnackBar.showSnackBar(
            notification: AppNotification(
                message: fail.error,
                isFloating: true,
                backgroundColor: Styles.IN_ACTIVE,
                borderColor: Colors.transparent));
      }, (success) {
        CustomNavigator.push(Routes.RESET_PASSWORD, replace: true);
      });
      _isVerify = false;
      notifyListeners();
    } catch (e) {
      CustomSnackBar.showSnackBar(
          notification: AppNotification(
              message: ApiErrorHandler.getMessage(e),
              isFloating: true,
              backgroundColor: Styles.IN_ACTIVE,
              borderColor: Colors.transparent));
      _isVerify = false;
      notifyListeners();
    }
  }

  bool _isReset = false;
  bool get isReset => _isReset;
  resetPassword() async {
    try {
      _isReset = true;
      notifyListeners();
      Either<ServerFailure, Response> response = await authRepo.reset(
          password: _newPasswordTEC.text.trim(), email: _emailTEC.text.trim());
      response.fold((fail) {
        CustomSnackBar.showSnackBar(
            notification: AppNotification(
                message: fail.error,
                isFloating: true,
                backgroundColor: Styles.IN_ACTIVE,
                borderColor: Colors.transparent));
      }, (success) {
        CustomSnackBar.showSnackBar(
            notification: AppNotification(
                message: getTranslated("your_password_reset_successfully",
                    CustomNavigator.navigatorState.currentContext!),
                isFloating: true,
                backgroundColor: Styles.ACTIVE,
                borderColor: Colors.transparent));
        CustomNavigator.push(Routes.LOGIN, clean: true);
        clear();
      });
      _isReset = false;
      notifyListeners();
    } catch (e) {
      CustomSnackBar.showSnackBar(
          notification: AppNotification(
              message: ApiErrorHandler.getMessage(e),
              isFloating: true,
              backgroundColor: Styles.IN_ACTIVE,
              borderColor: Colors.transparent));
      _isReset = false;
      notifyListeners();
    }
  }

  bool _isChange = false;
  bool get isChange => _isChange;
  changePassword() async {
    try {
      _isChange = true;
      notifyListeners();

      Either<ServerFailure, Response> response = await authRepo.change(
          oldPassword: _currentPasswordTEC.text.trim(),
          password: _newPasswordTEC.text.trim());

      response.fold((fail) {
        CustomSnackBar.showSnackBar(
            notification: AppNotification(
                message: ApiErrorHandler.getMessage(fail.error),
                isFloating: true,
                backgroundColor: Styles.IN_ACTIVE,
                borderColor: Colors.transparent));
      }, (success) {
        CustomSnackBar.showSnackBar(
            notification: AppNotification(
                message: getTranslated("your_password_changed_successfully",
                    CustomNavigator.navigatorState.currentContext!),
                isFloating: true,
                backgroundColor: Styles.ACTIVE,
                borderColor: Colors.transparent));
        clear();
      });
      _isChange = false;
      notifyListeners();
    } catch (e) {
      CustomSnackBar.showSnackBar(
          notification: AppNotification(
              message: ApiErrorHandler.getMessage(e),
              isFloating: true,
              backgroundColor: Styles.IN_ACTIVE,
              borderColor: Colors.transparent));
      _isChange = false;
      notifyListeners();
    }
  }

  logOut() async {
    Future.delayed(Duration.zero, () async {
      sl<DashboardProvider>().updateDashboardIndex(0);
      await authRepo.clearSharedData();
      clear();
    });
    CustomSnackBar.showSnackBar(
        notification: AppNotification(
            message: getTranslated("logged_out_successfully",
                CustomNavigator.navigatorState.currentContext!),
            isFloating: true,
            backgroundColor: Styles.ACTIVE,
            borderColor: Styles.transparentColor));
    notifyListeners();
  }
}
