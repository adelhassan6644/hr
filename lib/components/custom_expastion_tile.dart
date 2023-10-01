import 'package:flutter/material.dart';
import 'package:hr_project/app/core/color_resources.dart';
import 'package:hr_project/app/core/extensions.dart';

import '../app/core/text_styles.dart';

class CustomExpansionTile extends StatelessWidget {
  const CustomExpansionTile(
      {Key? key,
      required this.title,
      required this.children,
      this.opened = true})
      : super(key: key);
  final bool opened;
  final String title;
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      clipBehavior: Clip.antiAlias,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Styles.BORDER_COLOR,
            )),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          clipBehavior: Clip.antiAlias,
          child: ExpansionTile(
            title: Text(
              title,
              style: AppTextStyles.w600.copyWith(
                fontSize: 16.0,
              ),
            ),
            iconColor: Styles.HEADER,
            collapsedIconColor: Styles.PRIMARY_COLOR,
            textColor: Styles.HEADER,
            collapsedTextColor: Styles.PRIMARY_COLOR,
            backgroundColor: Styles.BACKGROUND_COLOR,
            collapsedBackgroundColor: Styles.BACKGROUND_COLOR,
            collapsedShape: Border.all(
              color: Colors.transparent,
            ),
            shape: Border.all(
              color: Colors.transparent,
            ),
            initiallyExpanded: opened,
            childrenPadding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 12.h,
            ),
            children: children,
          ),
        ),
      ),
    );
  }
}
