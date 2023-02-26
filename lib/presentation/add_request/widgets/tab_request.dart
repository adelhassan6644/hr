import 'package:flutter/material.dart';
import 'package:hr_project/app/core/utils/extensions.dart';
import '../../../app/core/utils/color_resources.dart';
import '../../../app/core/utils/text_styles.dart';

Widget tabRequest({required String title, Function()? onTap ,IconData? icon,Color? color,Color? textColor,Color? iconColor,double? textSize,double? iconSize,String? astIcon   }){
  return InkWell(
    onTap: onTap,
    child: Padding(
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
              if( icon != null) Icon(icon,size: iconSize?.w??15,color: iconColor,),
              if( astIcon != null) Image.asset(astIcon,color: iconColor??ColorResources.PRIMARY,height:iconSize?.h??20.h ,width: iconSize?.w??20.w,),
              if( astIcon != null || icon != null)SizedBox(width: 16.w,),
              Text(title,style: AppTextStyles.w600.copyWith(
                  fontSize: textSize??12,
                  color: textColor??ColorResources.SUB_HEADER
              ),),
            ],
          )),
    ),
  );

}