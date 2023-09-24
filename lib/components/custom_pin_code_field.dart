import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:hr_project/app/core/extensions.dart';
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
      cursorColor: ColorResources.PRIMARY,
      backgroundColor: Colors.transparent,
      autoDisposeControllers: false,
      autoDismissKeyboard: true,
      enableActiveFill: true,
      controller: controller,
      enablePinAutofill: true,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
      textStyle: AppTextStyles.w700.copyWith(color: ColorResources.PRIMARY),
      pastedTextStyle:
          AppTextStyles.w700.copyWith(color: ColorResources.HEADER),
      textInputAction: TextInputAction.done,
      pinTheme: PinTheme(
        borderWidth: 1,
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(10),
        fieldHeight: 60.h,
        fieldWidth: 60.w,
        fieldOuterPadding: EdgeInsets.symmetric(horizontal: 5.w),
        activeFillColor: ColorResources.WHITE,
        activeColor: ColorResources.WHITE,
        inactiveColor: ColorResources.BORDER_COLOR,
        inactiveFillColor: ColorResources.WHITE,
        selectedFillColor: ColorResources.WHITE,
        selectedColor: ColorResources.PRIMARY,
        disabledColor: ColorResources.LIGHT_BORDER_COLOR,
        errorBorderColor: ColorResources.IN_ACTIVE,
      ),
      appContext: context,
      length: 4,
      onSaved: onSave,
      onChanged: onChanged,
      errorTextSpace: 30,
    );
  }
}
