import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/color_resources.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import 'package:yusrPlus/app/core/text_styles.dart';
import 'package:yusrPlus/components/animated_widget.dart';
import 'package:yusrPlus/components/custom_images.dart';
import 'package:yusrPlus/features/requests/widgets/title_container.dart';
import '../../../app/core/app_strings.dart';
import '../../../app/core/dimensions.dart';
import '../../../app/core/images.dart';
import '../../../app/localization/language_constant.dart';
import '../../../components/custom_button.dart';
import '../../requests/model/request_model.dart';
import '../../requests/provider/requests_provider.dart';

class RequestDetailsWidget extends StatelessWidget {
  const RequestDetailsWidget({super.key, this.request});
  final RequestModel? request;

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
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        getTranslated("request_type", context),
                        style: AppTextStyles.w600.copyWith(color: Styles.HEADER, fontSize: 14),
                      ),
                    ),
                    CustomButton(
                      text: getTranslated(RequestType.values[request?.type ?? 0].name, context),
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
                SizedBox(height: 8.h),
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
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
                      child: Row(
                        children: [
                          customImageIcon(
                            imageName: Images.document,
                            height: 20.h,
                            width: 20.w,
                            color: Styles.HEADER,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Expanded(
                            child: Text(
                              getTranslated("request_type", context),
                              style: AppTextStyles.w600.copyWith(color: Styles.HEADER, fontSize: 14),
                            ),
                          ),
                          titleContainer(title: "", color: Styles.PRIMARY_COLOR, textColor: Colors.white),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 1.h,
                  color: Styles.BORDER_COLOR,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
                  child: Row(
                    children: [
                      Icon(Icons.access_time_rounded, color: Styles.HEADER, size: 20.w),
                      SizedBox(
                        width: 8.w,
                      ),
                      Expanded(
                        child: Text(
                          getTranslated("status", context),
                          style: AppTextStyles.w600.copyWith(color: Styles.HEADER, fontSize: 14),
                        ),
                      ),
                      titleContainer(title: "", textColor: Colors.white),
                    ],
                  ),
                ),
                Container(
                  height: 1.h,
                  color: Styles.BORDER_COLOR,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
                  child: Row(
                    children: [
                      const Icon(Icons.timelapse_outlined),
                      SizedBox(
                        width: 8.w,
                      ),
                      Expanded(
                        child: Text(
                          getTranslated("asset_items", context),
                          style: AppTextStyles.w600.copyWith(color: Styles.HEADER, fontSize: 14),
                        ),
                      ),
                      titleContainer(title: "", color: Styles.GREEN_COLOR.withOpacity(0.2)),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
                      child: Row(
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
                              style: AppTextStyles.w600.copyWith(color: Styles.HEADER, fontSize: 14),
                            ),
                          ),
                          Text(
                            "2500.00 SAR",
                            style: AppTextStyles.w500.copyWith(color: Styles.SUB_TEXT, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 1.h,
                      color: Styles.BORDER_COLOR,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
                      child: Row(
                        children: [
                          Icon(
                            Icons.numbers_rounded,
                            size: 20.w,
                            color: Styles.HEADER,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Expanded(
                            child: Text(
                              getTranslated("num_of_installment", context),
                              style: AppTextStyles.w600.copyWith(color: Styles.HEADER, fontSize: 14),
                            ),
                          ),
                          Text(
                            "15",
                            style: AppTextStyles.w500.copyWith(color: Styles.SUBTITLE, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 1.h,
                      color: Styles.BORDER_COLOR,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
                      child: Row(
                        children: [
                          Icon(
                            Icons.money_off,
                            size: 20.h,
                            color: Styles.HEADER,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Expanded(
                            child: Text(
                              getTranslated("monthly_installment", context),
                              style: AppTextStyles.w600.copyWith(color: Styles.HEADER, fontSize: 14),
                            ),
                          ),
                          Text(
                            "170.00 SAR",
                            style: AppTextStyles.w500.copyWith(color: Styles.SUBTITLE, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 1.h,
                      color: Styles.BORDER_COLOR,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
                      child: Row(
                        children: [
                          customImageIcon(
                            imageName: Images.calenderIcon,
                            height: 20.h,
                            width: 20.w,
                            color: Styles.HEADER,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Expanded(
                            child: Text(
                              getTranslated("period_of_installment", context),
                              style: AppTextStyles.w600.copyWith(color: Styles.HEADER, fontSize: 14),
                            ),
                          ),
                          Text(
                            "${DateTime.now().format("MMM yyyy")}-${DateTime.now().format("MMM yyyy")}",
                            style: AppTextStyles.w500.copyWith(color: Styles.SUBTITLE, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
