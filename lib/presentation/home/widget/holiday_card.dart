import 'package:flutter/material.dart';
import 'package:hr_project/app/core/utils/color_resources.dart';
import 'package:hr_project/app/core/utils/dimensions.dart';
import 'package:hr_project/app/core/utils/extensions.dart';
import 'package:hr_project/domain/localization/language_constant.dart';
import 'package:provider/provider.dart';
import '../../../app/core/utils/text_styles.dart';
import '../../../navigation/custom_navigation.dart';
import '../../notifier/localization_provider.dart';

class HolidayCard extends StatelessWidget {
  final String reason;
  const HolidayCard({required this.reason,Key? key}) : super(key: key);

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
              color: ColorResources.fillColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateTime.now().dataMainFormat(),
                  style: AppTextStyles.w600
                      .copyWith(fontSize: 12),
                ),
                SizedBox(
                  width: 80.w,
                  child: Text(
                    reason,
                    textAlign: TextAlign.center,
                    // getTranslated(reason, context),
                    style:
                    AppTextStyles.w600.copyWith(fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 5.h,
            height: 75.h,
            decoration: BoxDecoration(
              color: ColorResources.primary,
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
