import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../app/core/color_resources.dart';
import '../app/core/text_styles.dart';

class CustomPinCodeField extends StatelessWidget {
  final void Function(String?)? onSave;
  final void Function(String) onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validation;

  const CustomPinCodeField(
      {super.key,
      this.onSave,
      this.validation,
      required this.onChanged,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      validator: validation,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: Styles.PRIMARY_COLOR,
      backgroundColor: Colors.transparent,
      autoDisposeControllers: false,
      autoDismissKeyboard: true,
      enableActiveFill: true,
      controller: controller,
      enablePinAutofill: true,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
      textStyle: AppTextStyles.w700.copyWith(color: Styles.PRIMARY_COLOR),
      pastedTextStyle: AppTextStyles.w700.copyWith(color: Styles.HEADER),
      textInputAction: TextInputAction.done,
      pinTheme: PinTheme(
        borderWidth: 1,
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(10),
        fieldHeight: 60.h,
        fieldWidth: 60.w,
        fieldOuterPadding: EdgeInsets.symmetric(horizontal: 5.w),
        activeFillColor: Styles.WHITE,
        activeColor: Styles.WHITE,
        inactiveColor: Styles.BORDER_COLOR,
        inactiveFillColor: Styles.WHITE,
        selectedFillColor: Styles.WHITE,
        selectedColor: Styles.PRIMARY_COLOR,
        disabledColor: Styles.LIGHT_BORDER_COLOR,
        errorBorderColor: Styles.IN_ACTIVE,
      ),
      appContext: context,
      length: 4,
      onSaved: onSave,
      onChanged: onChanged,
      errorTextSpace: 30,
    );
  }
}
