import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import 'package:yusrPlus/app/core/text_styles.dart';

import '../../../app/core/color_resources.dart';
import '../model/salary_model.dart';

class SalaryDetailsCard extends StatelessWidget {
  const SalaryDetailsCard({super.key, this.salary});
  final SalaryDetailsModel? salary;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        children: [
          Text(
            salary?.name ?? "",
            style: AppTextStyles.w500.copyWith(
              fontSize: 14,
              color: Styles.grayColor,
            ),
          ),
          Text(
            salary?.amount ?? "",
            style: AppTextStyles.w500.copyWith(
              fontSize: 14,
              color: Styles.grayColor,
            ),
          ),
        ],
      ),
    );
  }
}
