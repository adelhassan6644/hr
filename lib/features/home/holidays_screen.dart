import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/color_resources.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import 'package:yusrPlus/features/home/widget/holiday_card.dart';
import '../../app/core/dimensions.dart';
import '../../app/localization/language_constant.dart';
import '../../components/custom_app_bar.dart';
import '../../components/custom_tab_bar.dart';
import '../../navigation/custom_navigation.dart';

class HolidaysScreen extends StatefulWidget {
  const HolidaysScreen({Key? key}) : super(key: key);

  @override
  State<HolidaysScreen> createState() => _HolidaysScreen();
}

class _HolidaysScreen extends State<HolidaysScreen> {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    _tabController = TabController(
        length: 3,
        initialIndex: _selectedIndex,
        vsync: CustomNavigator.scaffoldState.currentState!);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.BACKGROUND_COLOR,
      appBar: CustomAppBar(
        title: getTranslated("holidays", context),
      ),
      body: Padding(
        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT.h),
        child: Column(
          children: [
            CustomTabBar(
              myTabs: [
                tab(isSelected: _selectedIndex == 0, label: "weekly"),
                tab(isSelected: _selectedIndex == 1, label: "monthly"),
                tab(isSelected: _selectedIndex == 2, label: "yearly"),
              ],
              tabController: _tabController,
              onTap: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Center(
                      child: Column(
                    children: const [
                      HolidayCard(
                        reason: "national day",
                      ),
                      HolidayCard(
                        reason: "اليوم القومي",
                      ),
                      HolidayCard(
                        reason: "Christmas Day",
                      ),
                    ],
                  )),
                  Center(
                      child: Column(
                    children: const [
                      HolidayCard(
                        reason: "national day",
                      ),
                      HolidayCard(
                        reason: "اليوم القومي",
                      ),
                      HolidayCard(
                        reason: "Christmas Day",
                      ),
                    ],
                  )),
                  Center(
                      child: Column(
                    children: const [
                      HolidayCard(
                        reason: "national day",
                      ),
                      HolidayCard(
                        reason: "اليوم القومي",
                      ),
                      HolidayCard(
                        reason: "Christmas Day",
                      ),
                    ],
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
