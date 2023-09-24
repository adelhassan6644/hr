import 'package:flutter/material.dart';
import 'package:hr_project/app/core/utils/extensions.dart';
import '../../../app/core/color_resources.dart';
import '../../../app/core/text_styles.dart';

Widget titleContainer({required String title,IconData? icon,Color? color,Color? textColor,Color? iconColor,double? textSize,String? astIcon   }){
  return
    Padding(
      padding:  EdgeInsets.only(right: 8.0.w),
      child: Container(
          padding: EdgeInsets.all(8.h),
          decoration: BoxDecoration(
            color: color,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                  width: 0.5,
                  color: ColorResources.BORDER_COLOR
              )
          ),
          child: Row(
            children: [
             if(icon != null)  Icon(icon,size: 15,color: iconColor,),
              Text(title,style: AppTextStyles.w600.copyWith(
                  fontSize: textSize??12,
                  color: textColor??ColorResources.SUB_HEADER
              ),),
            ],
          )),
    );

}