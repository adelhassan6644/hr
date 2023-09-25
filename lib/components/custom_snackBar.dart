import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

import '../app/core/color_resources.dart';

void showCustomSnackBar(
    {required String message, context, bool isError = false}) {
  showToast(message,
      context: context,
      fullWidth: true,
      textPadding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(25)),
      backgroundColor: isError ? Colors.red : Styles.PRIMARY_COLOR,
      animation: StyledToastAnimation.slideToBottom,
      reverseAnimation: StyledToastAnimation.slideToBottom,
      position: StyledToastPosition.top,
      animDuration: const Duration(milliseconds: 800),
      textStyle: const TextStyle(
          fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
      duration: const Duration(seconds: 2),
      curve: Curves.easeInOutCubicEmphasized,
      reverseCurve: Curves.easeInExpo);
}
