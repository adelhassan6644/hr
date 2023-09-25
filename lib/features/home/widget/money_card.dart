import 'package:flutter/material.dart';
import 'package:hr_project/app/core/color_resources.dart';
import 'package:hr_project/app/core/extensions.dart';
import 'package:provider/provider.dart';
import '../../../app/core/dimensions.dart';
import '../../../app/core/text_styles.dart';
import '../../../app/localization/provider/localization_provider.dart';
import '../../../navigation/custom_navigation.dart';

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
              color: Styles.FILL,
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
                      color: isSalary?Colors.green: Styles.WARNING_COLOR),
                ),
              ],
            ),
          ),
          Container(
            width: 5.h,
            height: 75.h,
            decoration: BoxDecoration(
              color: Styles.PRIMARY_COLOR,
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
