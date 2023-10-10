import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/color_resources.dart';
import 'package:yusrPlus/app/core/dimensions.dart';
import 'package:yusrPlus/app/core/extensions.dart';

import '../app/core/text_styles.dart';

class CustomExpansionTile extends StatefulWidget {
  const CustomExpansionTile(
      {Key? key, required this.title, required this.children})
      : super(key: key);
  final String title;
  final List<Widget> children;

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool show = true;
  onTap() {
    setState(() => show = !show);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.PADDING_SIZE_DEFAULT.w,
          vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Styles.BORDER_COLOR,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: onTap,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: AppTextStyles.w600.copyWith(
                        fontSize: 16,
                        color: show ? Styles.PRIMARY_COLOR : Styles.HEADER),
                  ),
                ),
                AnimatedRotation(
                  duration: const Duration(milliseconds: 350),
                  turns: show ? 0.5 : 0,
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: show ? Styles.PRIMARY_COLOR : Styles.HEADER,
                    size: 24,
                  ),
                )
              ],
            ),
          ),
          AnimatedCrossFade(
            crossFadeState:
                !show ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 350),
            firstChild: SizedBox(height: 0, width: context.width),
            secondChild: ClipRRect(
              borderRadius:
                  BorderRadius.circular(Dimensions.PADDING_SIZE_LARGE.h),
              clipBehavior: Clip.antiAlias,
              child: Padding(
                padding: EdgeInsets.only(bottom: 8.h, top: 24.h),
                child: Column(
                  children: widget.children,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
