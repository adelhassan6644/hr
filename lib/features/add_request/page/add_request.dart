import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/color_resources.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import 'package:yusrPlus/app/core/text_styles.dart';
import 'package:yusrPlus/navigation/custom_navigation.dart';

import '../../../app/core/dimensions.dart';
import '../../../app/core/images.dart';
import '../../../app/localization/language_constant.dart';
import '../../../components/animated_widget.dart';
import '../../../components/custom_app_bar.dart';
import '../../../navigation/routes.dart';
import '../widgets/request_action_widget.dart';

class AddRequest extends StatelessWidget {
  const AddRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: getTranslated("add_request", context)),
      body: Column(
        children: [
          Expanded(
            child: ListAnimator(
              customPadding: EdgeInsets.symmetric(
                  horizontal: Dimensions.PADDING_SIZE_DEFAULT.w,
                  vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
              data: [
                Text(
                  getTranslated("select_your_request_type", context),
                  style: AppTextStyles.w500.copyWith(
                    color: Styles.SUBTITLE,
                    fontSize: 16.0,
                  ),
                ),

                ///Attendance Request
                SizedBox(height: 16.h),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.PADDING_SIZE_DEFAULT.w,
                      vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Styles.BORDER_COLOR,
                        width: 1.0.h,
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        getTranslated("attendance", context),
                        style: AppTextStyles.w600.copyWith(
                          color: Styles.PRIMARY_COLOR,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      RequestActionWidget(
                          title: getTranslated("permission", context),
                          astIcon: Images.exit,
                          onTap: () =>
                              CustomNavigator.push(Routes.PERMISSIN_REQUEST)),
                      SizedBox(
                        height: 16.h,
                      ),
                      RequestActionWidget(
                          title: getTranslated("vacation", context),
                          astIcon: Images.vacations,
                          onTap: () =>
                              CustomNavigator.push(Routes.VACATION_REQUEST)),
                    ],
                  ),
                ),

                ///Finance Request
                SizedBox(height: 16.h),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.PADDING_SIZE_DEFAULT.w,
                      vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Styles.BORDER_COLOR,
                        width: 1.0.h,
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        getTranslated("finance", context),
                        style: AppTextStyles.w600.copyWith(
                          color: Styles.PRIMARY_COLOR,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      RequestActionWidget(
                          title: getTranslated("loan", context),
                          astIcon: Images.salaries,
                          onTap: () =>
                              CustomNavigator.push(Routes.LOAN_REQUEST)),
                      // SizedBox(
                      //   height: 8.h,
                      // ),
                      // RequestActionWidget(
                      //     title:
                      //         getTranslated("financial_compensation", context),
                      //     astIcon: Images.expenses,
                      //     onTap: () => CustomNavigator.push(
                      //         Routes.EXPENSE_CLAIM_REQUEST)),
                    ],
                  ),
                ),

                ///other Request
                SizedBox(height: 16.h),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.PADDING_SIZE_DEFAULT.w,
                      vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Styles.BORDER_COLOR,
                        width: 1.0.h,
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        getTranslated("other", context),
                        style: AppTextStyles.w600.copyWith(
                          color: Styles.PRIMARY_COLOR,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      RequestActionWidget(
                          title: getTranslated("asset", context),
                          astIcon: Images.assetsIcon,
                          onTap: () =>
                              CustomNavigator.push(Routes.ASSET_REQUEST)),
                      SizedBox(
                        height: 16.h,
                      ),
                      RequestActionWidget(
                          title: getTranslated("covenant_release", context),
                          astIcon: Images.assetsIcon,
                          onTap: () =>
                              CustomNavigator.push(Routes.CLEAR_ASSET_REQUEST)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
