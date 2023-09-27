import 'package:flutter/cupertino.dart';
import 'package:hr_project/app/core/extensions.dart';
import '../app/core/color_resources.dart';
import '../app/core/dimensions.dart';
import '../app/core/images.dart';
import '../app/core/svg_images.dart';
import 'custom_button.dart';
import 'custom_images.dart';

class EmptyState extends StatelessWidget {
  final String? img;
  final double? imgHeight;
  final double? emptyHeight;
  final double? imgWidth;
  final bool isSvg;
  final double? spaceBtw;
  final String? txt;
  final String? subText;
  final String? btnText;
  final Function()? onTap;
  final bool originalButton;

  const EmptyState({
    Key? key,
    this.emptyHeight,
    this.spaceBtw,
    this.isSvg = false,
    this.originalButton = true,
    this.img,
    this.imgHeight,
    this.onTap,
    this.imgWidth,
    this.txt,
    this.btnText,
    this.subText,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: emptyHeight ?? 300,
      child: Center(
        child: Column(
          children: [
            !isSvg
                ? customImageIcon(
                    imageName: img ?? Images.emptyAsset,
                    width: imgWidth ?? 200,
                    height: imgHeight ?? 130)
                : customImageIconSVG(
                    imageName: img ?? SvgImages.appLogo,
                    width: imgWidth ?? 200,
                    height: imgHeight ?? 150,
                    color: Styles.PRIMARY_COLOR),
            SizedBox(
              height: spaceBtw ?? 24.h,
            ),
            Text(txt ?? "لا يوجد بيانات !",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Styles.PRIMARY_COLOR,
                )),
            SizedBox(height: 8.h),
            Text(subText ?? "",
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 14,
                    color: Styles.disabledColor,
                    fontWeight: FontWeight.w400)),
            Visibility(
                visible: btnText != null,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: Dimensions.PADDING_SIZE_DEFAULT.h,
                      horizontal: Dimensions.PADDING_SIZE_DEFAULT.w),
                  child: CustomButton(
                    text: btnText ?? "",
                    onTap: onTap,
                    backgroundColor:
                        originalButton ? Styles.PRIMARY_COLOR : Styles.WHITE,
                    textColor:
                        originalButton ? Styles.WHITE : Styles.PRIMARY_COLOR,
                    withShadow: !originalButton,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
