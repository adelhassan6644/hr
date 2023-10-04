import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/extensions.dart';

import '../../../app/core/app_strings.dart';
import '../../../app/core/color_resources.dart';
import '../../../app/core/dimensions.dart';
import '../../../app/core/text_styles.dart';
import '../../../app/localization/language_constant.dart';
import '../../../components/custom_button.dart';

class CovenantCard extends StatelessWidget {
  const CovenantCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      margin:
          EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
      padding: EdgeInsets.symmetric(
          vertical: Dimensions.PADDING_SIZE_DEFAULT.h,
          horizontal: Dimensions.PADDING_SIZE_DEFAULT.w),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 2),
            )
          ],
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: Styles.FILL_COLOR),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  getTranslated("covenant_status", context),
                  style: AppTextStyles.w600
                      .copyWith(color: Styles.HEADER, fontSize: 14),
                ),
              ),
              CustomButton(
                text: getTranslated(AppStrings.activationStatus(1), context),
                width: 120,
                radius: 6,
                height: 30,
                textColor: Styles.activationStatus(1),
                textSize: 14,
                backgroundColor: Styles.activationStatus(1).withOpacity(0.1),
                withBorderColor: true,
                borderColor: Styles.activationStatus(1),
              )
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Expanded(
                child: Text(
                  getTranslated("covenant_type", context),
                  style: AppTextStyles.w600
                      .copyWith(color: Styles.HEADER, fontSize: 14),
                ),
              ),
              const CustomButton(
                text: "car",
                width: 90,
                radius: 6,
                height: 30,
                textColor: Styles.PRIMARY_COLOR,
                textSize: 14,
                backgroundColor: Styles.WHITE,
                withBorderColor: true,
              )
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Expanded(
                child: Text(
                  getTranslated("covenant_date", context),
                  style: AppTextStyles.w600
                      .copyWith(color: Styles.HEADER, fontSize: 14),
                ),
              ),
              Text(
                "",
                style: AppTextStyles.w400
                    .copyWith(color: Styles.SUBTITLE, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
