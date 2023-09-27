import 'package:flutter/material.dart';
import 'package:hr_project/app/core/extensions.dart';
import 'package:hr_project/app/core/text_styles.dart';
import '../../../app/core/color_resources.dart';
import '../../../app/core/dimensions.dart';

class HomeCard extends StatelessWidget {
  final String title;
  final Widget icon;
  final Color iconColor;
  final VoidCallback onTap;
  const HomeCard(
      {required this.onTap,
      required this.icon,
      required this.title,
      required this.iconColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: onTap,
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
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: iconColor.withOpacity(0.1)),
              child: icon,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.w600.copyWith(
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
