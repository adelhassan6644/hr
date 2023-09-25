import 'package:flutter/material.dart';
import 'package:hr_project/app/core/color_resources.dart';
import 'package:hr_project/app/core/extensions.dart';
import '../../navigation/custom_navigation.dart';

import '../app/core/dimensions.dart';
import '../app/core/text_styles.dart';
import '../app/localization/provider/localization_provider.dart';
import '../data/config/di.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? actionChild;
  final double? actionWidth;
  final Color? titleColor;
  final bool fromAuth;

  const CustomAppBar(
      {Key? key,
      this.title,
      this.actionWidth,
      this.titleColor,
      this.fromAuth = false,
      this.actionChild})
      : super(key: key);

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
              CustomNavigator.navigatorState.currentState!.canPop()
                  ? InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        CustomNavigator.pop();
                      },
                      child: Transform.scale(
                        scaleX:
                            sl<LocalizationProvider>().locale.languageCode ==
                                    "en"
                                ? -1
                                : 1,
                        child: SizedBox(
                          width: actionWidth ?? 40,
                          child: Icon(Icons.arrow_back,
                              color: fromAuth
                                  ? Styles.WHITE
                                  : Styles.PRIMARY_COLOR),
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
