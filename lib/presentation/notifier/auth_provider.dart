import 'package:flutter/material.dart';
import '../dashBoard/dashboard_screen.dart';

class AuthProvider extends ChangeNotifier {
  final TextEditingController _emailTEC = TextEditingController();
  final TextEditingController _passwordTEC = TextEditingController();
  TextEditingController get emailTEC => _emailTEC;
  TextEditingController get passwordTEC => _passwordTEC;

   bool _isLoading = false;
  bool get isLoading=>_isLoading;

  logIn(context){
    _isLoading = true;
    notifyListeners();
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const DashBoardScreen()));
    _isLoading = false;
    notifyListeners();
  }


}
