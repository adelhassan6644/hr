import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import '../app/core/color_resources.dart';

class TabWidget extends StatelessWidget {
  const TabWidget(
      {required this.title,
      required this.isSelected,
      required this.onTab,
      this.iconSize,
      Key? key,
      this.icon,
      this.expand = false})
      : super(key: key);
  final String title;
  final bool isSelected;
  final Function() onTab;
  final String? icon;
  final double? iconSize;
  final bool expand;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null)
                  SvgPicture.asset(icon ?? "",
                      color: isSelected
                          ? Styles.WHITE
                          : Styles.WHITE.withOpacity(.5),
                      height: iconSize?.h,
                      width: iconSize?.w),
                if (icon != null) SizedBox(width: 4.w),
                Expanded(
                  child: Text(
                    title,
                    overflow: TextOverflow.fade,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      overflow: TextOverflow.fade,
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.w500,
                      color:
                          isSelected ? Styles.PRIMARY_COLOR : Styles.SUB_TEXT,
                    ),
                  ),
                ),
              ],
            ),
            LayoutBuilder(builder: (context, constraints) {
              return Container(
                padding: EdgeInsets.zero,
                width:
                    (expand) ? constraints.maxWidth : 28.w + (title.length * 8),
                height: 3.h,
                margin: EdgeInsets.only(top: 10.h),
                decoration: BoxDecoration(
                  color: isSelected ? Styles.PRIMARY_COLOR : Colors.transparent,
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
