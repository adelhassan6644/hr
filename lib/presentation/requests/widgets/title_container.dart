import 'package:flutter/material.dart';
import 'package:hr_project/app/core/utils/extensions.dart';
import '../../../app/core/utils/color_resources.dart';
import '../../../app/core/utils/text_styles.dart';

Widget titleContainer({required String title,IconData? icon,Color? color  }){
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
             icon != null? Icon(icon,size: 15,): const SizedBox(),
              Text(title,style: AppTextStyles.w600.copyWith(
                  fontSize: 12,
                  color: ColorResources.SUB_HEADER
              ),),
            ],
          )),
    );

}