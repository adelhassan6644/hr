import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import 'package:yusrPlus/app/core/text_styles.dart';
import 'package:yusrPlus/app/localization/language_constant.dart';

import '../../../app/core/color_resources.dart';

class SalaryDetailsCard extends StatelessWidget {
  const SalaryDetailsCard(
      {super.key, this.name, this.amount, this.isNet = false});
  final String? name, amount;
  final bool isNet;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name ?? "",
            style: AppTextStyles.w500.copyWith(
              fontSize: 14,
              color: isNet ? Styles.PRIMARY_COLOR : Styles.GOLD_COLOR,
            ),
          ),
          Text(
            "${amount ?? ".."} ${getTranslated("sar", context)}",
            style: AppTextStyles.w500.copyWith(
              fontSize: 14,
              color: isNet ? Styles.PRIMARY_COLOR : Styles.GOLD_COLOR,
            ),
          ),
        ],
      ),
    );
  }
}
