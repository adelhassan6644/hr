import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yusrPlus/app/core/color_resources.dart';

class BottomNavItem extends StatelessWidget {
  final String? imageIcon;
  final String? svgIcon;
  final VoidCallback onTap;
  final bool isSelected;
  final String? name;
  final double? width;
  final double? height;

  const BottomNavItem({
    super.key,
    this.imageIcon,
    this.svgIcon,
    this.name,
    this.isSelected = false,
    required this.onTap,
    this.width = 20,
    this.height = 20,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Styles.transparentColor,
      highlightColor: Styles.transparentColor,
      splashColor: Styles.transparentColor,
      onTap: onTap,
      child: SizedBox(
        height: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            svgIcon != null
                ? SvgPicture.asset(
                    svgIcon ?? "",
                    color: isSelected
                        ? Styles.PRIMARY_COLOR
                        : Styles.disabledColor,
                    width: width,
                    height: height,
                  )
                : Image.asset(
                    imageIcon ?? "",
                    color: isSelected
                        ? Styles.PRIMARY_COLOR
                        : Styles.disabledColor,
                    width: width,
                    height: height,
                  ),
            name != null
                ? Text(
                    name ?? "",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: isSelected
                          ? Styles.PRIMARY_COLOR
                          : Styles.disabledColor,
                      fontSize: 10,
                    ),
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
