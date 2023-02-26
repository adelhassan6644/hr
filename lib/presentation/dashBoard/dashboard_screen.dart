import 'package:flutter/material.dart';
import 'package:hr_project/app/core/utils/extensions.dart';
import 'package:hr_project/domain/localization/language_constant.dart';
import 'package:hr_project/presentation/dashBoard/units/nav_bar_item.dart';
import 'package:hr_project/presentation/home/home_Screen.dart';
import 'package:hr_project/presentation/profile/profile_screen.dart';
import '../../app/core/utils/color_resources.dart';
import '../../app/core/utils/images.dart';
import '../home/attendance_leaving_screen.dart';
import '../requests/requests_screen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  late final PageController _pageController= PageController();
  late int _selectedIndex ;
  _setPage(int index) {
    setState(() {
      _selectedIndex=index;
      // _pageController.jumpToPage(index,);
    });
  }

  @override
  void initState() {
    _selectedIndex = 0;
    _pageController.initialPage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  return  Scaffold(
      backgroundColor: ColorResources.BACKGROUND_COLOR,
      bottomNavigationBar: Padding(
          padding:  EdgeInsets.only(bottom: 20.h,right: 25.w,left: 25.w),
          child: Container(
            height: 60.h,
              decoration:BoxDecoration(
            color: const Color(0xfff7f7f7),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: BottomNavItem(
                      imageIcon: Images.home,
                    isSelected: _selectedIndex ==0 ,
                    onTap: () => _setPage(0),
                    name: getTranslated("home", context),
                  ),
                ),
                Expanded(
                  child: BottomNavItem(
                      imageIcon: Images.requestsIcon,
                      isSelected: _selectedIndex ==1 ,
                      onTap: () => _setPage(1),
                    name: getTranslated("requests", context),
                  ),
                ),
                Expanded(
                  child: BottomNavItem(
                      imageIcon: Images.attendanceIcon,
                      isSelected: _selectedIndex ==2 ,
                      onTap: () => _setPage(2),
                    name: getTranslated("attendance", context),

                  ),
                ),
                Expanded(
                  child:BottomNavItem(
                      imageIcon: Images.profileIcon,
                      isSelected: _selectedIndex ==3 ,
                      onTap: () => _setPage(3),
                    name: getTranslated("profile", context),

                  ),
                ),
              ]))
    ),
      body:IndexedStack(
        index: _selectedIndex,
        children: const [
        HomeScreen(),
        RequestsScreen(),
        AttendanceLeavingScreen(),
        ProfileScreen(),
      ],)

      // PageView(
      //     controller: _pageController,
      //     physics: const NeverScrollableScrollPhysics(),
      //     children: const [
      //       HomeScreen(),
      //       RequestsScreen(),
      //       AttendanceLeavingScreen(),
      //       ProfileScreen(),
      //     ]),
    );
  }

}
