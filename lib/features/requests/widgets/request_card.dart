import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/app_strings.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import 'package:yusrPlus/app/core/text_styles.dart';
import 'package:yusrPlus/app/localization/language_constant.dart';
import 'package:yusrPlus/components/custom_button.dart';
import 'package:yusrPlus/features/requests/model/request_model.dart';

import '../../../app/core/color_resources.dart';
import '../../../app/core/dimensions.dart';
import '../../../navigation/custom_navigation.dart';
import '../../../navigation/routes.dart';
import '../provider/requests_provider.dart';

class RequestCard extends StatelessWidget {
  const RequestCard({this.request, super.key});
  final RequestModel? request;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => CustomNavigator.push(Routes.REQUESTS_DETAILS, arguments: request?.id),
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        width: context.width,
        margin: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL.h),
        padding: EdgeInsets.symmetric(
            vertical: Dimensions.PADDING_SIZE_DEFAULT.h, horizontal: Dimensions.PADDING_SIZE_DEFAULT.w),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          )
        ], borderRadius: const BorderRadius.all(Radius.circular(12)), color: Styles.FILL_COLOR),
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
                  text: getTranslated(RequestType.values[(request?.type ?? 0) - 1].name, context),
                  // text: getTranslated( requestType(request?.type), context),
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
            SizedBox(height: 8.h),
            Row(
              children: [
                Expanded(
                  child: Text(
                    getTranslated("request_date", context),
                    style: AppTextStyles.w600.copyWith(color: Styles.HEADER, fontSize: 14),
                  ),
                ),
                Text(
                  request?.createdAt?.format("EEEE, d/MMM/yyy") ?? "",
                  style: AppTextStyles.w400.copyWith(color: Styles.SUBTITLE, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
