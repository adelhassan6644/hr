import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/dimensions.dart';
import 'package:yusrPlus/app/core/extensions.dart';

import '../../../app/core/color_resources.dart';
import '../../../app/core/text_styles.dart';

class ProfileDetailsCard extends StatelessWidget {
  const ProfileDetailsCard(
      {super.key, required this.title, required this.data});
  final String title, data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: Dimensions.PADDING_SIZE_DEFAULT.h,
          horizontal: Dimensions.PADDING_SIZE_DEFAULT.w),
      margin: EdgeInsets.symmetric(
        vertical: Dimensions.PADDING_SIZE_SMALL.h,
      ),
      decoration: BoxDecoration(
        color: Styles.FILL_COLOR,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: AppTextStyles.w600.copyWith(
                color: Styles.HEADER,
                fontSize: 14,
              ),
            ),
          ),
          Text(
            data,
            style: AppTextStyles.w400
                .copyWith(fontSize: 12, color: Styles.SUB_TEXT),
          )
        ],
      ),
    );
  }
}
