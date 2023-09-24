import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hr_project/app/core/color_resources.dart';
import 'package:hr_project/app/core/extensions.dart';
import 'dart:ui' as ui;

import '../app/core/dimensions.dart';
import '../app/core/images.dart';
import '../app/core/text_styles.dart';
import '../app/localization/localization/language_constant.dart';
import '../navigation/custom_navigation.dart';

loadingDialog() {
  return showAnimatedDialog(
    context: CustomNavigator.navigatorState.currentContext!,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: Center(
          child: ClipRRect(
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(25),
            child: BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                width: 200,
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.PADDING_SIZE_DEFAULT.w,
                    vertical: 30.h),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(25)),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Image.asset(
                    Images.logo,
                    height: MediaQuery.of(context).size.width * .1,
                    width: MediaQuery.of(context).size.width * .2,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.PADDING_SIZE_DEFAULT.w,
                        vertical: Dimensions.PADDING_SIZE_SMALL.h),
                    child: Text(
                      getTranslated("please_wait", context),
                      style: AppTextStyles.w700.copyWith(
                          fontSize: 18.0,
                          color: ColorResources.PRIMARY,
                          decoration: TextDecoration.none),
                    ),
                  ),
                  const SpinKitThreeBounce(
                    color: ColorResources.PRIMARY,
                    size: 20,
                  )
                ]),
              ),
            ),
          ),
        ),
      );
    },
    animationType: DialogTransitionType.fadeScale,
    curve: Curves.easeInOutBack,
    barrierColor: Colors.grey.withOpacity(0.25),
    duration: const Duration(milliseconds: 700),
  );
}

spinKitDialog() {
  showDialog(
      barrierDismissible: false,
      context: CustomNavigator.navigatorState.currentContext!,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: SizedBox(
            height: context.height,
            width: context.width,
            child: const Center(
              child: Center(
                child: SpinKitFadingCircle(
                  color: ColorResources.WHITE,
                  size: 50,
                ),
              ),
            ),
          ),
        );
      });
}
