import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/color_resources.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import 'package:yusrPlus/app/core/text_styles.dart';
import 'package:yusrPlus/features/requests/widgets/title_container.dart';
import '../../../app/core/dimensions.dart';
import '../../../app/core/images.dart';
import '../../../app/localization/language_constant.dart';

class RequestDetailsWidget extends StatelessWidget {
  const RequestDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24.h),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.PADDING_SIZE_DEFAULT.w),
          child: Container(
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
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
                      child: Row(
                        children: [
                          Image.asset(
                            Images.document,
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
                              style: AppTextStyles.w600
                                  .copyWith(color: Styles.HEADER, fontSize: 14),
                            ),
                          ),
                          titleContainer(
                              title:"",
                              color: Styles.PRIMARY_COLOR,
                              textColor: Colors.white),
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
                  padding: EdgeInsets.symmetric(
                      vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
                  child: Row(
                    children: [
                      Icon(Icons.access_time_rounded,
                          color: Styles.HEADER, size: 20.w),
                      SizedBox(
                        width: 8.w,
                      ),
                      Expanded(
                        child: Text(
                          getTranslated("status", context),
                          style: AppTextStyles.w600
                              .copyWith(color: Styles.HEADER, fontSize: 14),
                        ),
                      ),
                      titleContainer(
                          title:  "",
                          textColor: Colors.white),
                    ],
                  ),
                ),
                Container(
                  height: 1.h,
                  color: Styles.BORDER_COLOR,
                ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
                    child: Row(
                      children: [
                        const Icon(Icons.timelapse_outlined),
                        SizedBox(
                          width: 8.w,
                        ),
                        Expanded(
                          child: Text(
                            getTranslated("asset_items", context),
                            style: AppTextStyles.w600
                                .copyWith(color: Styles.HEADER, fontSize: 14),
                          ),
                        ),
                        titleContainer(
                            title: "",
                            color: Styles.GREEN_COLOR.withOpacity(0.2)),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
                        child: Row(
                          children: [
                            Image.asset(
                              Images.cash,
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
                                style: AppTextStyles.w600.copyWith(
                                    color: Styles.HEADER, fontSize: 14),
                              ),
                            ),
                            Text(
                              "2500.00 SAR",
                              style: AppTextStyles.w500.copyWith(
                                  color: Styles.SUB_TEXT, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 1.h,
                        color: Styles.BORDER_COLOR,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
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
                                style: AppTextStyles.w600.copyWith(
                                    color: Styles.HEADER, fontSize: 14),
                              ),
                            ),
                            Text(
                              "15",
                              style: AppTextStyles.w500.copyWith(
                                  color: Styles.SUBTITLE, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 1.h,
                        color: Styles.BORDER_COLOR,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
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
                                style: AppTextStyles.w600.copyWith(
                                    color: Styles.HEADER, fontSize: 14),
                              ),
                            ),
                            Text(
                              "170.00 SAR",
                              style: AppTextStyles.w500.copyWith(
                                  color: Styles.SUBTITLE, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 1.h,
                        color: Styles.BORDER_COLOR,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
                        child: Row(
                          children: [
                            Image.asset(
                              Images.calenderIcon,
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
                                style: AppTextStyles.w600.copyWith(
                                    color: Styles.HEADER, fontSize: 14),
                              ),
                            ),
                            Text(
                              "${DateTime.now().format("MMM yyyy")}-${DateTime.now().format("MMM yyyy")}",
                              style: AppTextStyles.w500.copyWith(
                                  color: Styles.SUBTITLE, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
