import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/color_resources.dart';
import 'package:yusrPlus/app/core/extensions.dart';

import '../app/core/text_styles.dart';

class CheckBoxListTile extends StatelessWidget {
  const CheckBoxListTile({
    Key? key,
    this.check = false,
    required this.title,
    this.description,
    required this.onChange,
  }) : super(key: key);
  final bool check;
  final String title;
  final String? description;
  final Function(bool) onChange;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChange(!check),
      child: Row(
        children: [
          Container(
            width: 18.w,
            height: 18.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: Styles.WHITE,
                border: Border.all(
                    color: check ? Styles.PRIMARY_COLOR : Styles.disabledColor,
                    width: 1)),
            child: check
                ? const Icon(
                    Icons.check,
                    color: Styles.PRIMARY_COLOR,
                    size: 14,
                  )
                : null,
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Text(
              title,
              style: AppTextStyles.w500.copyWith(
                  fontSize: 14,
                  color: check ? Styles.PRIMARY_COLOR : Styles.disabledColor),
            ),
          ),
          if (description != null)
            Text(
              description!,
              style: AppTextStyles.w900.copyWith(
                  fontSize: 10,
                  color: check ? Styles.PRIMARY_COLOR : Styles.SUBTITLE),
            )
        ],
      ),
    );
  }
}
