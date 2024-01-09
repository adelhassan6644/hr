import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/color_resources.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import 'package:yusrPlus/app/core/text_styles.dart';
import 'package:yusrPlus/components/animated_widget.dart';
import 'package:yusrPlus/features/request_details/widget/permission_details_widget.dart';
import 'package:yusrPlus/features/request_details/widget/vacation_details_widget.dart';
import '../../../app/core/app_strings.dart';
import '../../../app/core/dimensions.dart';
import '../../../app/localization/language_constant.dart';
import '../../../components/custom_button.dart';
import '../../requests/provider/requests_provider.dart';
import '../model/request_details_model.dart';
import 'loan_details_widget.dart';
import 'reason_details_widget.dart';

class RequestDetailsWidget extends StatelessWidget {
  const RequestDetailsWidget({super.key, this.request});
  final RequestDetailsModel? request;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListAnimator(
        customPadding: EdgeInsets.symmetric(
            horizontal: Dimensions.PADDING_SIZE_DEFAULT.w,
            vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
        data: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.PADDING_SIZE_DEFAULT.w,
                vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.w),
                border: Border.all(
                    color: Styles.BORDER_COLOR,
                    width: 0.5,
                    style: BorderStyle.solid)),
            child: Column(
              children: [
                ///Request Type
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        getTranslated("request_type", context),
                        style: AppTextStyles.w600
                            .copyWith(color: Styles.HEADER, fontSize: 14),
                      ),
                    ),
                    CustomButton(
                      text: getTranslated(
                          RequestType.values[(request?.type ?? 0) - 1].name,
                          context),
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
                        style: AppTextStyles.w600
                            .copyWith(color: Styles.HEADER, fontSize: 14),
                      ),
                    ),
                    CustomButton(
                      text: getTranslated(
                          AppStrings.status(request?.status), context),
                      width: 110,
                      radius: 6,
                      height: 30,
                      textColor: Styles.requestStatus(request?.status),
                      textSize: 14,
                      backgroundColor: Styles.requestStatus(request?.status)
                          .withOpacity(0.1),
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

                ///Request Date
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        getTranslated("request_date", context),
                        style: AppTextStyles.w600
                            .copyWith(color: Styles.HEADER, fontSize: 14),
                      ),
                    ),
                    Text(
                      request?.createdAt?.format("EEEE, d/MMM/yyy") ?? "",
                      style: AppTextStyles.w500
                          .copyWith(color: Styles.PRIMARY_COLOR, fontSize: 12),
                    ),
                  ],
                ),
                Container(
                  height: 1,
                  color: Styles.BORDER_COLOR,
                  margin: EdgeInsets.symmetric(vertical: 8.h),
                ),

                ///Vacation
                VacationDetailsWidget(
                  request: request,
                ),

                ///Permission
                PermissionDetailsWidget(
                  request: request,
                ),

                ///Loan
                LoanDetailsWidget(
                  request: request,
                ),

                ///Pledge
                Visibility(
                  visible: request?.type == (RequestType.pledge.index + 1),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          getTranslated("pledge_type", context),
                          style: AppTextStyles.w600
                              .copyWith(color: Styles.HEADER, fontSize: 14),
                        ),
                      ),
                      Text(
                        "${request?.typeName}",
                        style: AppTextStyles.w500
                            .copyWith(color: Styles.HEADER, fontSize: 14),
                      ),
                    ],
                  ),
                ),

                ///Pledge Release
                Visibility(
                  visible:
                      request?.type == (RequestType.pledgeRelease.index + 1),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          getTranslated("pledge_release_request", context),
                          style: AppTextStyles.w600
                              .copyWith(color: Styles.HEADER, fontSize: 14),
                        ),
                      ),
                      Text(
                        "${request?.typeName}",
                        style: AppTextStyles.w500
                            .copyWith(color: Styles.HEADER, fontSize: 14),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          ReasonDetailsWidget(
            reason: request?.comment,
            images: request?.images,
          ),
        ],
      ),
    );
  }
}
