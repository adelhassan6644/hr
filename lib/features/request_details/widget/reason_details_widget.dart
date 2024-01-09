import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/extensions.dart';

import '../../../app/core/color_resources.dart';
import '../../../app/core/dimensions.dart';
import '../../../app/core/text_styles.dart';
import '../../../app/localization/language_constant.dart';
import '../../../components/download_attachments.dart';

class ReasonDetailsWidget extends StatelessWidget {
  const ReasonDetailsWidget({super.key, this.reason, this.documents});
  final String? reason;
  final List<String>? documents;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.PADDING_SIZE_DEFAULT.w, vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.w),
            border: Border.all(color: Styles.BORDER_COLOR, width: 0.5, style: BorderStyle.solid)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Reason
            Text(
              getTranslated("reason", context),
              style: AppTextStyles.w600.copyWith(color: Styles.PRIMARY_COLOR, fontSize: 16),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              reason ?? "",
              style: AppTextStyles.w600.copyWith(color: Styles.HEADER, fontSize: 14),
            ),

            ///Attachments
            Visibility(
              visible: documents != null,
              child: DownLoadAttachments(
                attachments: documents,
              ),
            ),
          ],
        ));
  }
}
