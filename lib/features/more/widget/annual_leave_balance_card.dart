import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import 'package:yusrPlus/navigation/custom_navigation.dart';
import 'package:provider/provider.dart';

import '../../../app/core/color_resources.dart';
import '../../../app/core/constant.dart';
import '../../../app/core/dimensions.dart';
import '../../../app/localization/language_constant.dart';
import '../../../main_providers/user_provider.dart';
import '../../../navigation/routes.dart';

class AnnualLeaveBalanceCard extends StatelessWidget {
  const AnnualLeaveBalanceCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (_, provider, child) {
      return Container(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.PADDING_SIZE_DEFAULT.w,
            vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
        margin:
            EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
        decoration: BoxDecoration(
          color: Styles.FILL_COLOR,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  getTranslated("annual_leave_balance", context),
                  style: titleTextStyle.copyWith(
                      fontWeight: FontWeight.w600, color: Styles.disabledColor),
                ),
                TextButton(
                    onPressed: () =>
                        CustomNavigator.push(Routes.SALARIES_AND_FINANCIAL),
                    child: Text(
                      getTranslated("view_details", context),
                      style: titleTextStyle.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Styles.PRIMARY_COLOR),
                    ))
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  "${provider.user?.vacations.toString().convertDigits()} ${getTranslated("days", context)}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                      color: Styles.PRIMARY_COLOR),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  getTranslated("available_to_use", context),
                  style: titleTextStyle.copyWith(
                      fontWeight: FontWeight.w600, color: Styles.disabledColor),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      );
    });
  }
}
