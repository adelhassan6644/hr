import 'package:flutter/material.dart';
import 'package:hr_project/app/core/color_resources.dart';
import 'package:hr_project/app/core/extensions.dart';
import 'package:hr_project/app/core/text_styles.dart';
import 'package:hr_project/components/custom_images.dart';

import '../app/core/dimensions.dart';

class CustomRadioButton extends StatelessWidget {
  final void Function(bool)? onChange;
  final bool check;
  final String title;
  final String? icon;

  const CustomRadioButton(
      {super.key,
      required this.check,
      this.onChange,
      required this.title,
      this.icon});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onChange != null) onChange!(!check);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.PADDING_SIZE_DEFAULT.w,
            vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
        decoration: BoxDecoration(
          color: check ? Styles.PRIMARY_COLOR.withOpacity(0.15) : null,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Visibility(
              visible: icon != null,
              child: customImageIcon(
                imageName: icon ?? "",
                height: 24.h,
                width: 24.w,
              ),
            ),
            Visibility(visible: icon != null, child: SizedBox(width: 8.w)),
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.w600.copyWith(
                  fontSize: 16,
                  overflow: TextOverflow.ellipsis,
                  color: Styles.PRIMARY_COLOR,
                ),
              ),
            ),
            check
                ? Container(
                    padding: const EdgeInsets.all(2),
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                        color: Styles.WHITE,
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: Styles.PRIMARY_COLOR, width: 1)),
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Styles.PRIMARY_COLOR,
                      ),
                    ),
                  )
                : Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: Styles.PRIMARY_COLOR, width: 1)),
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Styles.WHITE,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
