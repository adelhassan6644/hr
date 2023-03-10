import 'package:flutter/material.dart';
import 'package:hr_project/app/core/utils/color_resources.dart';
import 'package:hr_project/app/core/utils/dimensions.dart';
import 'package:hr_project/app/core/utils/extensions.dart';
import 'package:provider/provider.dart';
import '../../../app/core/utils/text_styles.dart';
import '../../../navigation/custom_navigation.dart';
import '../../notifier/localization_provider.dart';

class MoneyCard extends StatelessWidget {
  final String price;
  final bool isSalary;
  const MoneyCard({required this.price, this.isSalary=true ,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(vertical: 10.h,),
      child: Stack(
        children: [
          Container(
            width: context.width,
            height: 75.h,
            padding: const EdgeInsets.all(
                Dimensions.PADDING_SIZE_DEFAULT),
            decoration: BoxDecoration(
              color: ColorResources.FILL,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateTime.now().dataMainFormat(),
                      style: AppTextStyles.w600
                          .copyWith(fontSize: 12),
                    ),
                    Text(
                      "-",
                      style: AppTextStyles.w600
                          .copyWith(fontSize: 12),
                    ),
                    Text(
                      DateTime.now().dataMainFormat(),
                      style: AppTextStyles.w600
                          .copyWith(fontSize: 12),
                    ),
                  ],
                ),
                Text(
                  "$price \$",
                  style: AppTextStyles.w600.copyWith(
                      fontSize: 12,
                      color: isSalary?Colors.green: ColorResources.WARNING_COLOR),
                ),
              ],
            ),
          ),
          Container(
            width: 5.h,
            height: 75.h,
            decoration: BoxDecoration(
              color: ColorResources.PRIMARY,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                      Provider.of<LocalizationProvider>(
                          CustomNavigator.scaffoldState
                              .currentContext!,
                          listen: false)
                          .isLtr
                          ? Dimensions.PADDING_SIZE_DEFAULT
                          : 0),
                  topRight:Radius.circular(
                      !Provider.of<LocalizationProvider>(
                          CustomNavigator.scaffoldState
                              .currentContext!,
                          listen: false)
                          .isLtr
                          ? Dimensions.PADDING_SIZE_DEFAULT
                          : 0),
                  bottomRight:Radius.circular(
                      !Provider.of<LocalizationProvider>(
                          CustomNavigator.scaffoldState
                              .currentContext!,
                          listen: false)
                          .isLtr
                          ? Dimensions.PADDING_SIZE_DEFAULT
                          : 0),
                  bottomLeft: Radius.circular(
                      Provider.of<LocalizationProvider>(
                          CustomNavigator.scaffoldState
                              .currentContext!,
                          listen: false)
                          .isLtr
                          ? Dimensions.PADDING_SIZE_DEFAULT
                          : 0)),
            ),
          ),
        ],
      ),
    );
  }
}
