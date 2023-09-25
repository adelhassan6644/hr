import 'package:flutter/material.dart';
import 'package:hr_project/app/core/color_resources.dart';
import 'package:hr_project/app/core/extensions.dart';
import '../../navigation/custom_navigation.dart';
import 'dart:ui' as ui;

import '../app/core/dimensions.dart';
import '../app/core/svg_images.dart';
import '../app/core/text_styles.dart';
import '../app/localization/provider/localization_provider.dart';
import '../data/config/di.dart';
import 'custom_images.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? actionChild;
  final bool withCart;
  final bool withBack;
  final int? savedItemId;
  final bool withBorder;
  final bool withBackGround;
  final bool isOffer;
  final double? actionWidth;
  final Color? colorBG;

  const CustomAppBar(
      {Key? key,
      this.title,
      this.withCart = false,
      this.savedItemId,
      this.withBackGround = true,
      this.withBorder = false,
      this.withBack = true,
      this.isOffer = true,
      this.actionWidth,
      this.colorBG,
      this.actionChild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT.w),
      decoration: BoxDecoration(color: colorBG),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: context.toPadding,
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              withBack
                  ? InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        CustomNavigator.pop();
                      },
                      child: ClipRRect(
                        clipBehavior: Clip.antiAlias,
                        borderRadius: BorderRadius.circular(100),
                        child: BackdropFilter(
                          filter:
                              ui.ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(100)),
                            child: Transform.scale(
                              scaleX:sl<LocalizationProvider>().locale.languageCode=="en"?-1: 1,
                              child: customImageIconSVG(
                                  imageName: SvgImages.arrowRight,
                                  color: Styles.WHITE),
                            ),
                          ),
                        ),
                      ),
                    )
                  : SizedBox(
                      width: actionWidth ?? 40,
                    ),
              SizedBox(
                width: 16.w,
              ),
              Expanded(
                child: Text(
                  title ?? "",
                  style: AppTextStyles.w700
                      .copyWith(color: Styles.PRIMARY_COLOR, fontSize: 16),
                ),
              ),
              actionChild ??
                  const SizedBox(
                    width: 40,
                  ),
            ],
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_SMALL.h),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(15005, 50);
}
