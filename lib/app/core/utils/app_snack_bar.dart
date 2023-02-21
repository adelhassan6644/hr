import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hr_project/app/core/utils/extensions.dart';
import 'package:hr_project/app/core/utils/text_styles.dart';

import '../../../navigation/custom_navigation.dart';

class AppNotification {
  final String message;
  final String? iconName;
  final Color backgroundColor;
  final Color borderColor;
  final bool isFloating;
  late final double radius;
  final Widget? action;
  final bool withAction;
  AppNotification({required this.message, this.iconName, this.backgroundColor = Colors.black, this.borderColor = Colors.transparent, this.isFloating = false, this.withAction = false, this.action, double? radius}) {
    this.radius = radius ?? (isFloating ? 15 : 0);
  }
}

class CustomSnackBar{
  static showSnackBar({required AppNotification notification}) {
    Timer(Duration.zero, () {
      CustomNavigator.scaffoldState.currentState!.showSnackBar(
        SnackBar(
          padding: const EdgeInsets.all(0),
          duration: const Duration(seconds: 2),
          behavior: notification.isFloating ? SnackBarBehavior.floating : SnackBarBehavior.fixed,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(notification.radius), side: BorderSide(width: 1, color: notification.borderColor)),
          margin: notification.isFloating ?  EdgeInsets.all(24.w) : null,
          content: SizedBox(
            height: notification.withAction ? null : 60.h,
            child: Row(
              children: [
                if (notification.iconName != null) Image.asset(notification.iconName!,height: 20.h,width: 20.w,),
                if (notification.iconName == null)  SizedBox(width: 24.w),
                Expanded(
                  child: Text(
                    notification.message,
                    style: AppTextStyles.w600.copyWith(fontSize: 13),
                  ),
                ),
                if (notification.withAction) notification.action ?? const SizedBox(),
              ],
            ),
          ),
          backgroundColor: notification.backgroundColor,
        ),
      );
    });
  }

  static hideSnackBar() {
    CustomNavigator.scaffoldState.currentState!.hideCurrentSnackBar(reason: SnackBarClosedReason.remove);
  }
}