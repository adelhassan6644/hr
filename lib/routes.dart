import 'package:flutter/cupertino.dart';
import 'package:hr_project/presentation/auth/login_screen.dart';
import 'package:hr_project/presentation/home/home_Screen.dart';

Map<String, Widget Function(BuildContext)> routes  = {
  LoginScreen.route: (context) => const LoginScreen(),
  HomeScreen.route: (context) => const HomeScreen(),
};
