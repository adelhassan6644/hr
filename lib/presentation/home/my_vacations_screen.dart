import 'package:flutter/material.dart';
import 'package:hr_project/app/core/utils/color_resources.dart';
import 'package:hr_project/app/core/utils/dimensions.dart';
import 'package:hr_project/app/core/utils/extensions.dart';
import 'package:hr_project/domain/localization/language_constant.dart';
import 'package:hr_project/presentation/base/custom_app_bar.dart';
import 'package:hr_project/presentation/base/custom_button.dart';
import 'package:hr_project/presentation/home/widget/vacation_card.dart';
import '../../navigation/custom_navigation.dart';
import '../base/custom_tab_bar.dart';

class MyVacationScreen extends StatefulWidget {
  const MyVacationScreen({Key? key}) : super(key: key);

  @override
  State<MyVacationScreen> createState() => _MyVacationScreenState();
}

class _MyVacationScreenState extends State<MyVacationScreen> {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    _tabController = TabController(
        length: 4,
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
      backgroundColor: ColorResources.BACKGROUND_COLOR,
      appBar: CustomAppBar(
        title: getTranslated("my_vacations", context),
        showLeading: true,
        titleCenter: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT.h),
        child: Column(
          children: [
            CustomTabBar(
              myTabs: [
                tab(isSelected: _selectedIndex==0,
                    label: "all"),
                tab(isSelected: _selectedIndex==1,
                    label: "accepted"),
                tab(isSelected: _selectedIndex==2,
                    label: "pending"),
                tab(isSelected: _selectedIndex==3,
                    label: "rejected"),
              ],
              tabController: _tabController,
              onTap:  (int index) {
                setState(() {_selectedIndex = index;});
              },),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Center(
                      child: Column(
                    children: const [
                      VacationCard(status: "accepted"),
                      VacationCard(status: "pending"),
                      VacationCard(status: "rejected"),
                    ],
                  )),
                  Center(
                      child: Column(
                    children: const [
                      VacationCard(status: "accepted"),
                    ],
                  )),
                  Center(
                      child: Column(
                    children: const [
                      VacationCard(status: "pending"),

                    ],
                  )),
                  Center(
                      child: Column(
                    children: const [
                      VacationCard(status: "rejected"),

                    ],
                  )),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_LARGE.h,vertical: Dimensions.PADDING_SIZE_SMALL.h ),
              child:  CustomButton(
                  textColor: ColorResources.whiteColor,
                  icon: Icons.add,
                  iconColor: ColorResources.whiteColor,
                  text: getTranslated("request_vacation", context),
                  backgroundColor: ColorResources.primary),
            )
          ],
        ),
      ),
    );
  }
}
