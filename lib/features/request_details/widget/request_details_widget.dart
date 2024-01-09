import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/color_resources.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import 'package:yusrPlus/app/core/text_styles.dart';
import 'package:yusrPlus/components/animated_widget.dart';
import 'package:yusrPlus/components/custom_images.dart';
import '../../../app/core/app_strings.dart';
import '../../../app/core/dimensions.dart';
import '../../../app/core/images.dart';
import '../../../app/localization/language_constant.dart';
import '../../../components/custom_button.dart';
import '../../requests/provider/requests_provider.dart';
import '../model/request_details_model.dart';

class RequestDetailsWidget extends StatelessWidget {
  const RequestDetailsWidget({super.key, this.request});
  final RequestDetailsModel? request;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListAnimator(
        customPadding: EdgeInsets.symmetric(
            horizontal: Dimensions.PADDING_SIZE_DEFAULT.w, vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
        data: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.PADDING_SIZE_DEFAULT.w, vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.w),
                border: Border.all(color: Styles.BORDER_COLOR, width: 0.5, style: BorderStyle.solid)),
            child: Column(
              children: [
                ///Request Type
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        getTranslated("request_type", context),
                        style: AppTextStyles.w600.copyWith(color: Styles.HEADER, fontSize: 14),
                      ),
                    ),
                    CustomButton(
                      text: getTranslated(RequestType.values[(request?.type ?? 0) - 1].name, context),
                      width: 110,
                      radius: 6,
                      height: 30,
                      textColor: Styles.PRIMARY_COLOR,
                      textSize: 14,
                      backgroundColor: Styles.PRIMARY_COLOR.withOpacity(0.1),
                      withBorderColor: true,
                    )
                  ],
                ),
                Container(
                  height: 1,
                  color: Styles.BORDER_COLOR,
                  margin: EdgeInsets.symmetric(vertical: 8.h),
                ),

                ///Request Status
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        getTranslated("request_status", context),
                        style: AppTextStyles.w600.copyWith(color: Styles.HEADER, fontSize: 14),
                      ),
                    ),
                    CustomButton(
                      text: getTranslated(AppStrings.status(request?.status), context),
                      width: 110,
                      radius: 6,
                      height: 30,
                      textColor: Styles.requestStatus(request?.status),
                      textSize: 14,
                      backgroundColor: Styles.requestStatus(request?.status).withOpacity(0.1),
                      withBorderColor: true,
                      borderColor: Styles.requestStatus(request?.status),
                    )
                  ],
                ),
                Container(
                  height: 1,
                  color: Styles.BORDER_COLOR,
                  margin: EdgeInsets.symmetric(vertical: 8.h),
                ),

                ///Vacation
                Visibility(
                  visible: request?.type == (RequestType.vacation.index + 1),
                  child: Column(
                    children: [
                      ///Vacation Type
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              getTranslated("vacation_type", context),
                              style: AppTextStyles.w600.copyWith(color: Styles.TITLE, fontSize: 14),
                            ),
                          ),
                          Text(
                            "${request?.requestType}",
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
                              getTranslated("start_date", context),
                              style: AppTextStyles.w600.copyWith(color: Styles.TITLE, fontSize: 14),
                            ),
                          ),
                          Text(
                            "${request?.startAt?.format("dd / MM / yyyy")}",
                            style: AppTextStyles.w500.copyWith(color: Styles.HEADER, fontSize: 14),
                          ),
                        ],
                      ),
                      Container(
                        height: 1,
                        color: Styles.BORDER_COLOR,
                        margin: EdgeInsets.symmetric(vertical: 8.h),
                      ),

                      ///End Date
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              getTranslated("end_date", context),
                              style: AppTextStyles.w600.copyWith(color: Styles.TITLE, fontSize: 14),
                            ),
                          ),
                          Text(
                            "${request?.endAt?.format("dd / MM / yyyy")}",
                            style: AppTextStyles.w500.copyWith(color: Styles.HEADER, fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                ///Loan
                Visibility(
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
                            "${request?.requestType}",
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
