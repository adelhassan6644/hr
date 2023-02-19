import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../../domain/repositery/auth_repo.dart';
import '../../navigation/custom_navigation.dart';
import '../../navigation/routes.dart';
import 'base_vm.dart';


class AuthProvider extends ChangeNotifier with BaseViewModel {
 final AuthRepo authRepo;
 AuthProvider({required this.authRepo,});
  final TextEditingController _emailTEC = TextEditingController(text:kDebugMode?"":'' );
  final TextEditingController _passwordTEC = TextEditingController(text:kDebugMode?"":'');
  final TextEditingController _newPasswordTEC = TextEditingController();
  final TextEditingController _confirmPasswordTEC = TextEditingController();

 TextEditingController get emailTEC => _emailTEC;
  TextEditingController get passwordTEC => _passwordTEC;
  TextEditingController get newPasswordTEC => _newPasswordTEC;
  TextEditingController get confirmPasswordTEC => _confirmPasswordTEC;

   bool _isLoading = false;
   bool isError = false;
   bool get isLoading=>_isLoading;
   bool samePassword = false;

  late String _otp;
  String get otp=>_otp;


  logIn( ) async {
   try{
    {
      isError=false;
  _isLoading = true;
  notifyListeners();

  Either response= await authRepo.logIn(email: _emailTEC.text.trim(), password: _passwordTEC.text.trim());
  response.fold((fail)  {
    isError=true;
    notifyListeners();
  }, (success) {
    CustomNavigator.push(Routes.DASHBOARD,clean: true);
  });


  _isLoading = false;
  notifyListeners();
}

   }catch(e){
     isError=true;
     _isLoading = false;
     notifyListeners();
   }
  }

  requestOTP(context){

    _isLoading = true;
    notifyListeners();
    CustomNavigator.push(Routes.VERIFICATION_CODE);
    _isLoading = false;
    notifyListeners();

  }

  getOTP({required String code}){
    code=_otp;
  }

  sendOTP({context}){

    _isLoading = true;
    notifyListeners();
    CustomNavigator.push(Routes.RESET_PASSWORD,replace: true);
    _isLoading = false;
    notifyListeners();

  }

  resetPassword({context}){

    _isLoading = true;
    notifyListeners();
    CustomNavigator.push(Routes.DASHBOARD,clean: true);
    _isLoading = false;
    notifyListeners();

  }


}
