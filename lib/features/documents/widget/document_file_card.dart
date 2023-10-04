import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/extensions.dart';

import '../../../app/core/app_snack_bar.dart';
import '../../../app/core/color_resources.dart';
import '../../../app/core/dimensions.dart';
import '../../../app/core/svg_images.dart';
import '../../../app/core/text_styles.dart';
import '../../../app/localization/language_constant.dart';
import '../../../components/custom_images.dart';

class DocumentFileCard extends StatelessWidget {
  const DocumentFileCard({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showToast(getTranslated("not_supported_yet", context)),
      child: Container(
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
        child: Row(
          children: [
            customImageIconSVG(
              imageName: SvgImages.documentFile,
              color: Styles.TITLE,
              height: 20,
              width: 20,
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.w600.copyWith(
                  color: Styles.TITLE,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Icon(
              Icons.download,
              size: 20.w,
              color: Styles.PRIMARY_COLOR,
            )
          ],
        ),
      ),
    );
  }
}
