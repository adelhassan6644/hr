import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/extensions.dart';

import '../../../app/core/color_resources.dart';
import '../../../app/core/methods.dart';
import '../../../app/core/text_styles.dart';
import '../../../app/localization/language_constant.dart';
import '../../requests/provider/requests_provider.dart';
import '../model/request_details_model.dart';

class PermissionDetailsWidget extends StatelessWidget {
  const PermissionDetailsWidget({super.key, this.request});
  final RequestDetailsModel? request;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: request?.type == (RequestType.permission.index + 1),
      child: Column(
        children: [
          ///Permission Type
          Row(
            children: [
              Expanded(
                child: Text(
                  getTranslated("permission_type", context),
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
          Container(
            height: 1,
            color: Styles.BORDER_COLOR,
            margin: EdgeInsets.symmetric(vertical: 8.h),
          ),

          ///Date Of Permission
          Row(
            children: [
              Expanded(
                child: Text(
                  getTranslated("date_of_permission", context),
                  style: AppTextStyles.w600
                      .copyWith(color: Styles.HEADER, fontSize: 14),
                ),
              ),
              Text(
                "${request?.dayOfPermission}",
                style: AppTextStyles.w500
                    .copyWith(color: Styles.HEADER, fontSize: 14),
              ),
            ],
          ),
          Container(
            height: 1,
            color: Styles.BORDER_COLOR,
            margin: EdgeInsets.symmetric(vertical: 8.h),
          ),

          ///Start Time
          Row(
            children: [
              Expanded(
                child: Text(
                  getTranslated("start_time", context),
                  style: AppTextStyles.w600
                      .copyWith(color: Styles.HEADER, fontSize: 14),
                ),
              ),
              Text(
                "${Methods.convertStringToTime(request?.comeTime, withFormat: true)}",
                style: AppTextStyles.w500
                    .copyWith(color: Styles.HEADER, fontSize: 14),
              ),
            ],
          ),
          Container(
            height: 1,
            color: Styles.BORDER_COLOR,
            margin: EdgeInsets.symmetric(vertical: 8.h),
          ),

          ///End Time
          Row(
            children: [
              Expanded(
                child: Text(
                  getTranslated("end_time", context),
                  style: AppTextStyles.w600
                      .copyWith(color: Styles.HEADER, fontSize: 14),
                ),
              ),
              Text(
                "${Methods.convertStringToTime(request?.leaveTime, withFormat: true)}",
                style: AppTextStyles.w500
                    .copyWith(color: Styles.HEADER, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
