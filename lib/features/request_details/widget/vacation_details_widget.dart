import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/extensions.dart';

import '../../../app/core/color_resources.dart';
import '../../../app/core/text_styles.dart';
import '../../../app/localization/language_constant.dart';
import '../../requests/provider/requests_provider.dart';
import '../model/request_details_model.dart';

class VacationDetailsWidget extends StatelessWidget {
  const VacationDetailsWidget({super.key, this.request});
  final RequestDetailsModel? request;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: request?.type == (RequestType.vacation.index + 1),
      child: Column(
        children: [
          ///Vacation Type
          Row(
            children: [
              Expanded(
                child: Text(
                  getTranslated("vacation_type", context),
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

          ///Start Date
          Row(
            children: [
              Expanded(
                child: Text(
                  getTranslated("start_date", context),
                  style: AppTextStyles.w600
                      .copyWith(color: Styles.HEADER, fontSize: 14),
                ),
              ),
              Text(
                "${request?.startAt?.format("dd / MM / yyyy")}",
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

          ///End Date
          Row(
            children: [
              Expanded(
                child: Text(
                  getTranslated("end_date", context),
                  style: AppTextStyles.w600
                      .copyWith(color: Styles.HEADER, fontSize: 14),
                ),
              ),
              Text(
                "${request?.endAt?.format("dd / MM / yyyy")}",
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
