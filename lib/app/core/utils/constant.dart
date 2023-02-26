
import 'package:flutter/material.dart';
import 'package:hr_project/app/core/utils/extensions.dart';
import 'package:pinput/pinput.dart';
import 'app_strings.dart';
import 'color_resources.dart';
import 'dimensions.dart';

  OutlineInputBorder disableBorderStyle =   OutlineInputBorder(
  borderRadius: const BorderRadius.all(
    Radius.circular(Dimensions.PADDING_SIZE_DEFAULT),
  ),
  borderSide: BorderSide(
    style: BorderStyle.solid,
    color: ColorResources.GOLD_COLOR.withOpacity(0.2),
  ),
);

  OutlineInputBorder focusBorderStyle =   OutlineInputBorder(
  borderRadius: const BorderRadius.all(
    Radius.circular(Dimensions.PADDING_SIZE_DEFAULT),
  ),
  borderSide: BorderSide(
    style: BorderStyle.solid,
    color: ColorResources.GOLD_COLOR.withOpacity(0.4),
  ),
);

  OutlineInputBorder errorOutLineInputBorderStyle =   const OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(Dimensions.PADDING_SIZE_DEFAULT),
  ),
  borderSide: BorderSide(
    width: 1,
    style: BorderStyle.solid,
    color: ColorResources.errorBorderColor,
  ),
);

const TextStyle darkTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700);

 TextStyle hintTextStyle = const TextStyle(
    fontSize: 12,
    color: ColorResources.PRIMARY,
    fontWeight: FontWeight.w600);

const TextStyle titleTextStyle = TextStyle(
    fontSize: 14,
    color: ColorResources.PRIMARY,
    fontWeight: FontWeight.w700);

const TextStyle headLineTextStyle = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w900);
const TextStyle subHeadLineTextStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w900);

const TextStyle errorHintTextStyle = TextStyle(
    fontSize: 13,
    color: ColorResources.errorHintColor,
    fontWeight: FontWeight.w600);

const TextStyle selectTextStyle = TextStyle(
    color: ColorResources.PRIMARY,
    fontSize: 12,
    fontFamily: AppStrings.fontFamily,
    fontWeight: FontWeight.w700);
const TextStyle unSelectTextStyle = TextStyle(
    color: ColorResources.disabledColor,
    fontSize: 10,
    fontFamily: AppStrings.fontFamily,
    fontWeight: FontWeight.w500);


 BoxDecoration decoration1 = BoxDecoration(
  borderRadius:  const BorderRadius.all(
      Radius.circular(Dimensions.PADDING_SIZE_DEFAULT)),
  border: Border.all(
      width: 1.00,
      color: ColorResources.shadowColor,
      style: BorderStyle.solid),
);

 BoxDecoration decoration =BoxDecoration(
    borderRadius: const BorderRadius.all(
        Radius.circular(Dimensions.PADDING_SIZE_DEFAULT)),
    border: Border.all(
        color: ColorResources.transparentColor,
        style: BorderStyle.solid),
    color: ColorResources.FILL);

final defaultPinTheme = PinTheme(
  width: 55.w,
  height: 55.h,
  textStyle: const TextStyle(fontSize: 18,
      color: ColorResources.HEADER, fontWeight: FontWeight.w600),
  decoration: BoxDecoration(
    color:ColorResources.FILL_COLOR,
    border: Border.all(color: ColorResources.BORDER_COLOR),
    borderRadius: BorderRadius.circular(5),
  ),
);


final submittedPinTheme = defaultPinTheme.copyWith(
  decoration: defaultPinTheme.decoration?.copyWith(
    color:ColorResources.FILL_COLOR,
  ),
);


 Widget hSpace =  SizedBox(
   height: Dimensions.PADDING_SIZE_LARGE.h,
 );

Widget wSpace =  SizedBox(
  width:Dimensions.PADDING_SIZE_LARGE.w,
);

