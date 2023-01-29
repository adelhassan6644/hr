import 'package:flutter/cupertino.dart';

class DashProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  final PageController _pageController = PageController();
  PageController get pageController => _pageController;

  selectPage({required int index}) {
    _selectedIndex = index;
    pageController.animateToPage(index,
        curve: Curves.linear,
        duration: const Duration(milliseconds: 10));
    notifyListeners();
  }
}
