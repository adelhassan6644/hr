import 'package:flutter/cupertino.dart';

class DashProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;



  selectPage({required int index, required PageController pageController}) {
    _selectedIndex = index;
    pageController.animateToPage(index,
        curve: Curves.linear,
        duration: const Duration(milliseconds: 10));
    notifyListeners();
  }
}
