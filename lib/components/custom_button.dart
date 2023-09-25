import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hr_project/app/core/extensions.dart';
import '../app/core/color_resources.dart';
import '../app/core/text_styles.dart';
import 'custom_images.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final double? textSize;
  final Color? textColor;
  final Color? borderColor;
  final Color backgroundColor;
  final String? svgIcon;
  final Widget? lIconWidget;
  final Widget? fIconWidget;
  final String? assetIcon;
  final Color? iconColor;
  final double? width;
  final double? height;
  final double? radius;
  final double? iconSize;
  final bool isLoading;
  final bool isError;
  final bool withBorderColor;
  final bool withShadow;
  final Color? loadingColor;

  const CustomButton(
      {Key? key,
      this.onTap,
      this.loadingColor,
      this.fIconWidget,
      this.lIconWidget,
      this.radius,
      this.height,
      this.svgIcon,
      this.assetIcon,
      this.isLoading = false,
      this.textColor,
      this.borderColor,
      this.width,
      this.iconColor,
      this.iconSize,
      this.textSize,
      this.withBorderColor = false,
      this.withShadow = false,
      required this.text,
      this.backgroundColor = Styles.PRIMARY_COLOR,
      this.isError = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
          if (onTap != null && !isLoading) {
            onTap!();
          }
        },
        child: Container(
          width:  width ?? context.width,
          height: height ?? 50.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            color: backgroundColor,
            boxShadow: withShadow
                ? [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: const Offset(1, 1))
                  ]
                : null,
            border: Border.all(
                color: withBorderColor
                    ? borderColor ?? Styles.PRIMARY_COLOR
                    : Colors.transparent),
            borderRadius: BorderRadius.circular(radius ?? 12),
          ),
          child: Center(
            child: isLoading
                ? SpinKitThreeBounce(
                    color: loadingColor ?? Styles.WHITE,
                    size: 25,
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (fIconWidget != null) fIconWidget!,
                      if (fIconWidget != null)
                        SizedBox(
                          width: 8.w,
                        ),
                      Text(
                        text,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.w600.copyWith(
                          height: 1,
                          fontSize: textSize ?? 16,
                          overflow: TextOverflow.ellipsis,
                          color: textColor ?? Styles.WHITE,
                        ),
                      ),
                      if (assetIcon != null ||
                          svgIcon != null ||
                          lIconWidget != null)
                        SizedBox(
                          width: 8.w,
                        ),
                      if (lIconWidget != null) lIconWidget!,
                      if (assetIcon != null)
                        customImageIcon(
                            imageName: assetIcon!,
                            color: iconColor,
                            width: iconSize ?? 20.w,
                            height: iconSize ?? 20.w),
                      if (svgIcon != null)
                        customImageIconSVG(
                            imageName: svgIcon!,
                            color: iconColor,
                            width: iconSize ?? 20.w,
                            height: iconSize ?? 20.w),
                    ],
                  ),
          ),
        ));
  }
}
