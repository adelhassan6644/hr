import 'package:flutter/material.dart';
import 'package:hr_project/app/core/color_resources.dart';
import 'package:hr_project/app/core/extensions.dart';
import 'package:hr_project/features/home/widget/money_card.dart';
import '../../app/core/dimensions.dart';
import '../../app/localization/localization/language_constant.dart';
import '../../components/custom_app_bar.dart';
import '../../components/custom_tab_bar.dart';
import '../../navigation/custom_navigation.dart';

class SalariesScreen extends StatefulWidget {
  const SalariesScreen({Key? key}) : super(key: key);

  @override
  State<SalariesScreen> createState() => _SalariesScreenState();
}

class _SalariesScreenState extends State<SalariesScreen> {

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
      backgroundColor: Styles.BACKGROUND_COLOR,
      appBar: CustomAppBar(
        title: getTranslated("salaries", context),
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
                children:  [
                  Center(
                      child: Column(
                        children: [
                          MoneyCard(price:"5000" ,),
                          MoneyCard(price:"4000" ,),

                        ],
                      )),
                  Center(
                      child: Column(
                        children: [
                          MoneyCard(price:"555000" ,),
                          MoneyCard(price:"400530" ,),
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
