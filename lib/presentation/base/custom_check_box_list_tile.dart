import 'package:flutter/material.dart';
import '../../app/core/utils/app_strings.dart';
import '../../app/core/utils/color_resources.dart';
import '../../app/core/utils/constant.dart';

class CustomCheckBoxListTile extends StatelessWidget {
  final String title;
  final String? subTitle;
  final bool value;
   final void Function(bool?) onChange;
  const CustomCheckBoxListTile(
      {required this.title,
         this.subTitle,
        required this.value,required this.onChange, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      side:  BorderSide(
        color: ColorResources.shadowColor,
        width: 9,
      ),
      controlAffinity: ListTileControlAffinity.leading,
      checkColor: Colors.white,
      contentPadding: EdgeInsets.zero,
      checkboxShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      activeColor: ColorResources.primary,
      title: Text(
        title,
        style: value ? selectTextStyle : hintTextStyle,
      ),
      subtitle:subTitle != null? Text(
        "(${subTitle??""})",
        style: value ? const TextStyle(
            color: ColorResources.primary,
            fontSize: 11,
            fontFamily: AppStrings.fontFamily,
            fontWeight: FontWeight.w600)
            : const TextStyle(
            color: ColorResources.DISABLE_COLOR,
            fontSize: 11,
            fontFamily: AppStrings.fontFamily,
            fontWeight: FontWeight.w600),
      ):null,
      value: value,
      onChanged: onChange,
    );
  }
}
