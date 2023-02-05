import 'package:flutter/material.dart';
import 'package:hr_project/app/core/utils/extensions.dart';
import '../../app/core/utils/color_resources.dart';
import '../../app/core/utils/dimensions.dart';
import '../../app/core/utils/text_styles.dart';
import '../../domain/localization/language_constant.dart';
import '../../navigation/custom_navigation.dart';

class CustomTabBar extends StatefulWidget {
  final Function(int)? onTap;
  final List<Tab> myTabs;
  final TabController tabController;
  const CustomTabBar({required this.myTabs,required this.tabController, required this.onTap,Key? key}) : super(key: key);

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 10.h,),
      child: Container(
        height: 60.h,
        width: context.width,
        decoration: BoxDecoration(
          color: ColorResources.COLOR_GAINSBORO,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: TabBar(
            onTap: widget.onTap,
            controller: widget.tabController,
            tabs:widget.myTabs,
            labelPadding:
            const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
            // indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}

Tab tab ({required bool isSelected,required String label}){
  return Tab(
    child: Center(
      child: Container(
        height: 40.h,
        decoration: BoxDecoration(
          color: isSelected
              ? ColorResources.primary.withOpacity(0.8)
              : ColorResources.transparentColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            getTranslated(
                label,
                CustomNavigator
                    .scaffoldState.currentContext!),
            style: AppTextStyles.w600.copyWith(
              fontSize: 12,
              color: isSelected
                  ? ColorResources.whiteColor
                  : ColorResources.disabledColor,
            ),
          ),
        ),
      ),
    ),
  );
}
