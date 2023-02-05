import 'package:flutter/material.dart';
import 'package:hr_project/app/core/utils/color_resources.dart';
import 'package:hr_project/app/core/utils/dimensions.dart';
import 'package:hr_project/app/core/utils/extensions.dart';
import 'package:hr_project/domain/localization/language_constant.dart';
import 'package:hr_project/presentation/base/custom_app_bar.dart';
import 'package:hr_project/presentation/base/custom_tab_bar.dart';
import 'package:hr_project/presentation/home/widget/money_card.dart';
import '../../navigation/custom_navigation.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({Key? key}) : super(key: key);

  @override
  State<ExpensesScreen> createState() => _ExpensesScreen();
}

class _ExpensesScreen extends State<ExpensesScreen> {

  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    _tabController = TabController(
        length:2,
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
        title: getTranslated("expenses", context),
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
                    label: "monthly"),
                tab(isSelected: _selectedIndex==1,
                    label: "yearly"),
              ],
              tabController: _tabController,
              onTap: (int index) {
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
                          MoneyCard(price:"500",isSalary: false),
                          MoneyCard(price:"120" ,isSalary: false),

                        ],
                      )),
                  Center(
                      child: Column(
                        children: const [
                          MoneyCard(price:"5500" ,isSalary: false),
                          MoneyCard(price:"4030" ,isSalary: false),
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
