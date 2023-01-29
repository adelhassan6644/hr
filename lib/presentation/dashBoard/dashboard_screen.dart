import 'package:flutter/material.dart';
import 'package:hr_project/app/core/utils/constant.dart';
import 'package:hr_project/domain/localization/language_constant.dart';
import 'package:hr_project/presentation/dashBoard/units/nav_bar_item.dart';
import 'package:hr_project/presentation/home/home_Screen.dart';
import 'package:hr_project/presentation/profile/profile_screen.dart';
import 'package:provider/provider.dart';
import '../../app/core/utils/color_resources.dart';
import '../../app/core/utils/images.dart';
import '../notifier/dashboard_provider.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DashProvider>(builder: (context, dashProvider, widget) {
      return Scaffold(
        backgroundColor: ColorResources.BACKGROUND_COLOR,
        bottomNavigationBar: BottomNavigationBar(
          items: [
            // navigationBarItems(
            //     icon: Images.home, title: getTranslated("request_type", context)),
            navigationBarItems(
                iconSvg: Images.home, title: getTranslated("home", context)),
            navigationBarItems(
                iconAsset: Images.attendanceIcon, title: getTranslated("attendance", context)),
            navigationBarItems(
                iconAsset: Images.requestsIcon, title: getTranslated("requests", context)),
            navigationBarItems(
                iconAsset: Images.profileIcon, title: getTranslated("profile", context)),
          ],
          elevation: 1,
          showUnselectedLabels: true,
          unselectedLabelStyle: unSelectTextStyle,
          selectedLabelStyle: selectTextStyle,
          selectedItemColor: ColorResources.primary,
          unselectedItemColor: ColorResources.disabledColor,
          type: BottomNavigationBarType.fixed,
          currentIndex: dashProvider.selectedIndex,
          onTap: (index) {
            dashProvider.selectPage(index: index);
          },
          showSelectedLabels: true,

        ),
        body: PageView(controller: dashProvider.pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
          HomeScreen(),
          HomeScreen(),
          HomeScreen(),
          ProfileScreen(),
        ]),
      );
    });
  }
}
