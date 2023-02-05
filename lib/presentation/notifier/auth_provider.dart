import 'package:flutter/material.dart';
import 'package:hr_project/presentation/auth/verification_screen.dart';
import '../../navigation/custom_navigation.dart';
import '../../navigation/routes.dart';
import '../auth/reset_password_screen.dart';
import '../dashBoard/dashboard_screen.dart';

class AuthProvider extends ChangeNotifier {
  final TextEditingController _emailTEC = TextEditingController();
  final TextEditingController _passwordTEC = TextEditingController();
  final TextEditingController _newPasswordTEC = TextEditingController();
  final TextEditingController _confirmPasswordTEC = TextEditingController();
  TextEditingController get emailTEC => _emailTEC;
  TextEditingController get passwordTEC => _passwordTEC;
  TextEditingController get newPasswordTEC => _newPasswordTEC;
  TextEditingController get confirmPasswordTEC => _confirmPasswordTEC;

   bool _isLoading = false;
  bool get isLoading=>_isLoading;
   bool samePassword = false;

  late String _otp;
  String get otp=>_otp;


  logIn(context){
    _isLoading = true;
    notifyListeners();
    // CustomNavigator.push(Routes.DASHBOARD);
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const DashBoardScreen()));

    _isLoading = false;
    notifyListeners();
  }

  requestOTP(context){

    _isLoading = true;
    notifyListeners();
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const VerificationScreen()));
    _isLoading = false;
    notifyListeners();

  }

  getOTP({required String code}){
    code=_otp;
  }
  sendOTP({context}){

    _isLoading = true;
    notifyListeners();
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const ResetPasswordScreen()));
    _isLoading = false;
    notifyListeners();

  }

  resetPassword({context}){

    _isLoading = true;
    notifyListeners();
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const DashBoardScreen()));
    _isLoading = false;
    notifyListeners();

  }


}
