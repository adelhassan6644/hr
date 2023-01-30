
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'app_strings.dart';
import 'color_resources.dart';
import 'dimensions.dart';

 const OutlineInputBorder disableBorderStyle =   OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(Dimensions.PADDING_SIZE_DEFAULT),
  ),
  borderSide: BorderSide(
    style: BorderStyle.solid,
    color: ColorResources.borderColor,
  ),
);

 const OutlineInputBorder focusBorderStyle =   OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(Dimensions.PADDING_SIZE_DEFAULT),
  ),
  borderSide: BorderSide(
    style: BorderStyle.solid,
    color: ColorResources.primary,
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

const TextStyle hintTextStyle = TextStyle(
    fontSize: 12,
    color: ColorResources.hintColor,
    fontWeight: FontWeight.w600);

const TextStyle titleTextStyle = TextStyle(
    fontSize: 14,
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
    color: ColorResources.primary,
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
    color: ColorResources.fillColor);

final defaultPinTheme = PinTheme(
  width: 56,
  height: 56,
  textStyle: const TextStyle(fontSize: 20,
      color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
  decoration: BoxDecoration(
    border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
    borderRadius: BorderRadius.circular(8),
  ),
);


final submittedPinTheme = defaultPinTheme.copyWith(
  decoration: defaultPinTheme.decoration?.copyWith(
    color: const Color.fromRGBO(234, 239, 243, 1),
  ),
);


 Widget hSpace = const SizedBox(
   height: Dimensions.PADDING_SIZE_DEFAULT,
 );

Widget wSpace = const SizedBox(
  width:8,
);

