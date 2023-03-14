import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hr_project/app/core/utils/extensions.dart';
import '../../app/core/utils/color_resources.dart';
import '../../app/core/utils/dimensions.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final IconData? icon;
  final String? assetIcon;
  final Color? iconColor;
  final double? iconSize;
  final double? width;
  final double? height;
  final bool isLoading;
  final bool isError;
  final bool isActive;

  const CustomButton(
      {Key? key,
      this.onTap,
      this.isActive = true,
      this.icon,
      this.height,
      this.assetIcon,
      this.isLoading = false,
      this.textColor = ColorResources.WHITE,
      this.width,
      this.iconSize = 25,
      this.iconColor = ColorResources.PRIMARY,
      required this.text,
      this.backgroundColor = ColorResources.PRIMARY,
      this.isError = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: isError ? [const ShakeEffect(),] : [],
      child: GestureDetector(
        onTap:isActive? onTap:null,
        child: AnimatedContainer(
          width: isLoading ? 90 : context.width,
          height: 55,
          decoration: BoxDecoration(
            color:isActive? ColorResources.PRIMARY:ColorResources.PRIMARY.withOpacity(0.4),
            borderRadius: const BorderRadius.all(Radius.circular(Dimensions.RADIUS_LARGE)),
          ),
          duration: const Duration(
            milliseconds: 600,
          ),
          curve: Curves.easeInOutSine,
          child: Center(
            child: isLoading
                ? const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      color: ColorResources.GOLD_COLOR,
                    ),
                  )
                : Text(
                    text,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: onTap == null
                          ? ColorResources.getGreyColor(context)
                          : Colors.white,
                    ),
                  ),
          ),
        ).animate(target: isLoading ? 1 : 0).scaleXY(end: .8).flip(end: 1),
      ).animate().fade(),
    );
  }
}
