import 'package:flutter/material.dart';
import '../main_repos/dashboard_repo.dart';

class DashboardProvider extends ChangeNotifier {
  DashboardRepo repo;
  DashboardProvider({required this.repo});

  bool get isLogin => repo.isLoggedIn();

}
