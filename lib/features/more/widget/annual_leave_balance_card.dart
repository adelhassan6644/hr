import 'package:flutter/material.dart';
import 'package:hr_project/app/core/extensions.dart';

import '../../../app/core/color_resources.dart';
import '../../../app/core/constant.dart';
import '../../../app/core/dimensions.dart';
import '../../../app/localization/localization/language_constant.dart';

class AnnualLeaveBalanceCard extends StatelessWidget {
  const AnnualLeaveBalanceCard({super.key, this.onTap});
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.PADDING_SIZE_DEFAULT.w,
          vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
      margin: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
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
                  onPressed: onTap,
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
                "${5.toString().convertDigits()} ${getTranslated("days", context)}",
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
  }
}
