import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/extensions.dart';

import '../../../app/core/color_resources.dart';
import '../../../app/core/images.dart';
import '../../../app/core/text_styles.dart';
import '../../../app/localization/language_constant.dart';
import '../../../components/custom_images.dart';
import '../../requests/provider/requests_provider.dart';
import '../model/request_details_model.dart';

class LoanDetailsWidget extends StatelessWidget {
  const LoanDetailsWidget({super.key, this.request});
  final RequestDetailsModel? request;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: request?.type == (RequestType.loan.index + 1),
      child: Column(
        children: [
          ///Loan Type
          Row(
            children: [
              customImageIcon(
                imageName: Images.salaryIcon,
                height: 20.h,
                width: 20.w,
                color: Styles.HEADER,
              ),
              SizedBox(
                width: 8.w,
              ),
              Expanded(
                child: Text(
                  getTranslated("loan_type", context),
                  style: AppTextStyles.w600.copyWith(color: Styles.TITLE, fontSize: 14),
                ),
              ),
              Text(
                "${request?.typeName}",
                style: AppTextStyles.w500.copyWith(color: Styles.HEADER, fontSize: 14),
              ),
            ],
          ),
          Container(
            height: 1,
            color: Styles.BORDER_COLOR,
            margin: EdgeInsets.symmetric(vertical: 8.h),
          ),

          ///Loan Amount
          Row(
            children: [
              customImageIcon(
                imageName: Images.cash,
                height: 20.h,
                width: 20.w,
                color: Styles.HEADER,
              ),
              SizedBox(
                width: 8.w,
              ),
              Expanded(
                child: Text(
                  getTranslated("loan_amount", context),
                  style: AppTextStyles.w600.copyWith(color: Styles.TITLE, fontSize: 14),
                ),
              ),
              Text(
                "${request?.loanAmount} ${getTranslated("sar", context)}",
                style: AppTextStyles.w500.copyWith(color: Styles.HEADER, fontSize: 14),
              ),
            ],
          ),
          Container(
            height: 1,
            color: Styles.BORDER_COLOR,
            margin: EdgeInsets.symmetric(vertical: 8.h),
          ),

          ///Start Date
          Row(
            children: [
              Expanded(
                child: Text(
                  getTranslated("installment_start_date", context),
                  style: AppTextStyles.w600.copyWith(color: Styles.TITLE, fontSize: 14),
                ),
              ),
              Text(
                "${request?.startDate?.format("dd / MM / yyyy")}",
                style: AppTextStyles.w500.copyWith(color: Styles.HEADER, fontSize: 14),
              ),
            ],
          ),
          Container(
            height: 1,
            color: Styles.BORDER_COLOR,
            margin: EdgeInsets.symmetric(vertical: 8.h),
          ),

          ///Number Per Months
          Row(
            children: [
              Expanded(
                child: Text(
                  getTranslated("number_of_months", context),
                  style: AppTextStyles.w600.copyWith(color: Styles.TITLE, fontSize: 14),
                ),
              ),
              Text(
                "${request?.numberOfMonths}",
                style: AppTextStyles.w500.copyWith(color: Styles.HEADER, fontSize: 14),
              ),
            ],
          ),
          Container(
            height: 1,
            color: Styles.BORDER_COLOR,
            margin: EdgeInsets.symmetric(vertical: 8.h),
          ),

          ///Amount Per Months
          Row(
            children: [
              Expanded(
                child: Text(
                  getTranslated("amount_per_month", context),
                  style: AppTextStyles.w600.copyWith(color: Styles.TITLE, fontSize: 14),
                ),
              ),
              Text(
                "${request?.amountPerMonth} ${getTranslated("sar", context)}",
                style: AppTextStyles.w500.copyWith(color: Styles.HEADER, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
