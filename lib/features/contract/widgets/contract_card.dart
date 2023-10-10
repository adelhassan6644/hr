import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import 'package:yusrPlus/components/custom_button.dart';
import 'package:yusrPlus/features/contract/model/contract_model.dart';

import '../../../app/core/app_strings.dart';
import '../../../app/core/color_resources.dart';
import '../../../app/core/dimensions.dart';
import '../../../app/core/text_styles.dart';
import '../../../app/localization/language_constant.dart';

class ContractCard extends StatelessWidget {
  const ContractCard({super.key, this.contractModel});
  final ContractModel? contractModel;
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  contractModel?.contractTitle ?? "",
                  style: AppTextStyles.w600
                      .copyWith(fontSize: 14, color: Styles.HEADER),
                  overflow: TextOverflow.fade,
                ),
              ),
              CustomButton(
                text: getTranslated(
                    AppStrings.activationStatus(contractModel?.isActive),
                    context),
                width: 120,
                radius: 6,
                height: 30,
                textColor: Styles.activationStatus(contractModel?.isActive),
                textSize: 14,
                backgroundColor:
                    Styles.activationStatus(contractModel?.isActive)
                        .withOpacity(0.1),
                withBorderColor: true,
                borderColor: Styles.activationStatus(contractModel?.isActive),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "${getTranslated("contract_starting_date", context)} : ",
                    style: AppTextStyles.w600
                        .copyWith(fontSize: 14, color: Styles.HEADER),
                    overflow: TextOverflow.fade,
                  ),
                ),
                Text(
                  contractModel?.startDate?.dateFormat() ?? "",
                  style: AppTextStyles.w500
                      .copyWith(fontSize: 12, color: Styles.PRIMARY_COLOR),
                  overflow: TextOverflow.fade,
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  "${getTranslated("contract_type", context)} : ",
                  style: AppTextStyles.w600
                      .copyWith(fontSize: 14, color: Styles.HEADER),
                  overflow: TextOverflow.fade,
                ),
              ),
              Text(
                contractModel?.contractType ?? "",
                style: AppTextStyles.w500
                    .copyWith(fontSize: 12, color: Styles.PRIMARY_COLOR),
                overflow: TextOverflow.fade,
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Expanded(
                child: Text(
                  "${getTranslated("contract_duration", context)} : ",
                  style: AppTextStyles.w600
                      .copyWith(fontSize: 14, color: Styles.HEADER),
                  overflow: TextOverflow.fade,
                ),
              ),
              Text(
                contractModel?.contractDuration ?? "",
                style: AppTextStyles.w500
                    .copyWith(fontSize: 12, color: Styles.PRIMARY_COLOR),
                overflow: TextOverflow.fade,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
