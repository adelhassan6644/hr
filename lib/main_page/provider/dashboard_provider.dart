import 'package:flutter/material.dart';

import '../../data/config/di.dart';
import '../../main_providers/user_provider.dart';

class DashboardProvider extends ChangeNotifier {
  int selectedIndex = 0;

  updateDashboardIndex(v, {bool isOpen = false}) {
    isOpen = false;
    selectedIndex = v;
    notifyListeners();
  }

  init() {
    sl<UserProvider>().getUserDate();
  }
}
