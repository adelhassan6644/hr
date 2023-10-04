import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import '../../../app/core/color_resources.dart';
import '../../../app/core/dimensions.dart';
import '../../../app/core/text_styles.dart';
import '../../../app/localization/language_constant.dart';
import '../../../components/custom_button.dart';
import '../model/pledge_model.dart';

class PledgeCard extends StatelessWidget {
  const PledgeCard({Key? key, this.pledgeModel}) : super(key: key);
  final PledgeModel? pledgeModel;
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
      child: Row(
        children: [
          Expanded(
            child: Text(
              getTranslated("pledge_type", context),
              style: AppTextStyles.w600
                  .copyWith(color: Styles.HEADER, fontSize: 14),
            ),
          ),
          CustomButton(
            text: pledgeModel?.name ?? "rf",
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
      // Column(
      //   children: [
      //     // Row(
      //     //   children: [
      //     //     Expanded(
      //     //       child: Text(
      //     //         getTranslated("pledge_status", context),
      //     //         style: AppTextStyles.w600
      //     //             .copyWith(color: Styles.HEADER, fontSize: 14),
      //     //       ),
      //     //     ),
      //     //     CustomButton(
      //     //       text: getTranslated(AppStrings.activationStatus(1), context),
      //     //       width: 120,
      //     //       radius: 6,
      //     //       height: 30,
      //     //       textColor: Styles.activationStatus(1),
      //     //       textSize: 14,
      //     //       backgroundColor: Styles.activationStatus(1).withOpacity(0.1),
      //     //       withBorderColor: true,
      //     //       borderColor: Styles.activationStatus(1),
      //     //     )
      //     //   ],
      //     // ),
      //     // SizedBox(height: 8.h),
      //     Row(
      //       children: [
      //         Expanded(
      //           child: Text(
      //             getTranslated("pledge_type", context),
      //             style: AppTextStyles.w600
      //                 .copyWith(color: Styles.HEADER, fontSize: 14),
      //           ),
      //         ),
      //         CustomButton(
      //           text: pledgeModel?.name ?? "",
      //           width: 90,
      //           radius: 6,
      //           height: 30,
      //           textColor: Styles.PRIMARY_COLOR,
      //           textSize: 14,
      //           backgroundColor: Styles.WHITE,
      //           withBorderColor: true,
      //         )
      //       ],
      //     ),
      //     // SizedBox(height: 8.h),
      //     // Row(
      //     //   children: [
      //     //     Expanded(
      //     //       child: Text(
      //     //         getTranslated("pledge_date", context),
      //     //         style: AppTextStyles.w600
      //     //             .copyWith(color: Styles.HEADER, fontSize: 14),
      //     //       ),
      //     //     ),
      //     //     Text(
      //     //       "dns",
      //     //       style: AppTextStyles.w400
      //     //           .copyWith(color: Styles.SUBTITLE, fontSize: 12),
      //     //     ),
      //     //   ],
      //     // ),
      //   ],
      // ),
    );
  }
}
