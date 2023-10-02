import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import 'package:yusrPlus/main_page/provider/dashboard_provider.dart';
import 'package:provider/provider.dart';

import '../../app/core/images.dart';
import '../../app/localization/language_constant.dart';
import 'nav_bar_item.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<DashboardProvider>(builder: (_, provider, child) {
        return Container(
          height: 60.h,
          decoration: BoxDecoration(
            color: const Color(0xfff3f3f3),
            borderRadius: BorderRadius.circular(100),
          ),
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          margin: EdgeInsets.only(bottom: 16.h, right: 24.w, left: 24.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: BottomNavItem(
                  imageIcon: Images.home,
                  isSelected: provider.selectedIndex == 0,
                  onTap: () => provider.updateDashboardIndex(0),
                  name: getTranslated("home", context),
                ),
              ),
              Expanded(
                child: BottomNavItem(
                  imageIcon: Images.requestsIcon,
                  isSelected: provider.selectedIndex == 1,
                  onTap: () => provider.updateDashboardIndex(1),
                  name: getTranslated("requests", context),
                ),
              ),
              Expanded(
                child: BottomNavItem(
                  imageIcon: Images.attendanceIcon,
                  isSelected: provider.selectedIndex == 2,
                  onTap: () => provider.updateDashboardIndex(2),
                  name: getTranslated("attendance", context),
                ),
              ),
              Expanded(
                child: BottomNavItem(
                  imageIcon: Images.profileIcon,
                  isSelected: provider.selectedIndex == 3,
                  onTap: () => provider.updateDashboardIndex(3),
                  name: getTranslated("profile", context),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
