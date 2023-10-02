import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import '../app/core/color_resources.dart';
import '../../navigation/custom_navigation.dart';
import '../app/core/dimensions.dart';
import '../app/core/text_styles.dart';
import '../app/localization/language_constant.dart';

class CustomTabBar extends StatefulWidget {
  final Function(int)? onTap;
  final List<Tab> myTabs;
  final TabController tabController;
  const CustomTabBar(
      {required this.myTabs,
      required this.tabController,
      required this.onTap,
      Key? key})
      : super(key: key);

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.h,
      ),
      child: Container(
        height: 60.h,
        width: context.width,
        decoration: BoxDecoration(
          color: Styles.COLOR_GAINSBORO,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: TabBar(
            onTap: widget.onTap,
            controller: widget.tabController,
            tabs: widget.myTabs,
            labelPadding: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
            // indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}

Tab tab({required bool isSelected, required String label}) {
  return Tab(
    child: Center(
      child: Container(
        height: 40.h,
        decoration: BoxDecoration(
          color: isSelected
              ? Styles.PRIMARY_COLOR.withOpacity(0.8)
              : Styles.transparentColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            getTranslated(label, CustomNavigator.scaffoldState.currentContext!),
            style: AppTextStyles.w600.copyWith(
              fontSize: 12,
              color: isSelected ? Styles.WHITE : Styles.disabledColor,
            ),
          ),
        ),
      ),
    ),
  );
}
