import 'package:flutter/material.dart';

class DashboardProvider extends ChangeNotifier {
  int selectedIndex = 0;

  updateDashboardIndex(v, {bool isOpen = false}) {
    isOpen = false;
    selectedIndex = v;
    notifyListeners();
  }
}
