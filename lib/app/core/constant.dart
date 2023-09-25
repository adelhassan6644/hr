
import 'package:flutter/material.dart';
import 'package:hr_project/app/core/extensions.dart';
import 'app_strings.dart';
import 'color_resources.dart';
import 'dimensions.dart';


 const OutlineInputBorder disableBorderStyle =   OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(Dimensions.PADDING_SIZE_DEFAULT),
  ),
  borderSide: BorderSide(
    style: BorderStyle.solid,
    color: Styles.BORDER_COLOR,
  ),
);

 const OutlineInputBorder focusBorderStyle =   OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(Dimensions.PADDING_SIZE_DEFAULT),
  ),
  borderSide: BorderSide(
    style: BorderStyle.solid,
    color: Styles.PRIMARY_COLOR,
  ),
);

  OutlineInputBorder errorOutLineInputBorderStyle =   const OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(Dimensions.PADDING_SIZE_DEFAULT),
  ),
  borderSide: BorderSide(
    width: 1,
    style: BorderStyle.solid,
    color: Styles.errorBorderColor,
  ),
);

const TextStyle darkTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700);

const TextStyle hintTextStyle = TextStyle(
    fontSize: 12,
    color: Styles.hintColor,
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
    color: Styles.errorHintColor,
    fontWeight: FontWeight.w600);

const TextStyle selectTextStyle = TextStyle(
    color: Styles.PRIMARY_COLOR,
    fontSize: 12,
    fontFamily: AppStrings.fontFamily,
    fontWeight: FontWeight.w700);
const TextStyle unSelectTextStyle = TextStyle(
    color: Styles.disabledColor,
    fontSize: 10,
    fontFamily: AppStrings.fontFamily,
    fontWeight: FontWeight.w500);


 BoxDecoration decoration1 = BoxDecoration(
  borderRadius:  const BorderRadius.all(
      Radius.circular(Dimensions.PADDING_SIZE_DEFAULT)),
  border: Border.all(
      width: 1.00,
      color: Styles.shadowColor,
      style: BorderStyle.solid),
);

 BoxDecoration decoration =BoxDecoration(
    borderRadius: const BorderRadius.all(
        Radius.circular(Dimensions.PADDING_SIZE_DEFAULT)),
    border: Border.all(
        color: Styles.transparentColor,
        style: BorderStyle.solid),
    color: Styles.FILL);




 Widget hSpace =  SizedBox(
   height: Dimensions.PADDING_SIZE_LARGE.h,
 );

Widget wSpace =  SizedBox(
  width:Dimensions.PADDING_SIZE_LARGE.w,
);

