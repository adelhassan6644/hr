import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/color_resources.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import '../../navigation/custom_navigation.dart';

import '../app/core/dimensions.dart';
import '../app/core/text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? actionChild;
  final double? actionWidth;
  final Color? titleColor;
  final bool fromAuth, canBack;
  final Function()? onBack;

  const CustomAppBar(
      {super.key,
      this.title,
      this.actionWidth,
      this.titleColor,
      this.fromAuth = false,
      this.canBack = true,
      this.actionChild,
      this.onBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      padding:
          EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT.w),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: fromAuth
                      ? Colors.transparent
                      : Styles.LIGHT_BORDER_COLOR))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: context.toPadding),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              !canBack
                  ? SizedBox(width: actionWidth ?? 40)
                  : CustomNavigator.navigatorState.currentState!.canPop()
                      ? InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            if (onBack != null) {
                              onBack?.call();
                            } else {
                              CustomNavigator.pop();
                            }
                          },
                          child: SizedBox(
                            width: actionWidth ?? 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.arrow_back,
                                    color: fromAuth
                                        ? Styles.WHITE
                                        : Styles.PRIMARY_COLOR),
                              ],
                            ),
                          ))
                      : SizedBox(width: actionWidth ?? 40),
              const Expanded(child: SizedBox()),
              Text(
                title ?? "",
                style: AppTextStyles.w700.copyWith(
                    color: titleColor ?? Styles.PRIMARY_COLOR, fontSize: 16),
              ),
              const Expanded(child: SizedBox()),
              actionChild ??
                  const SizedBox(
                    width: 40,
                  ),
            ],
          ),
          SizedBox(
            height: Dimensions.PADDING_SIZE_SMALL.h,
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(15005, 50);
}
