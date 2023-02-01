import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hr_project/app/core/utils/media_query_values.dart';
import '../../app/core/utils/app_strings.dart';
import '../../app/core/utils/color_resources.dart';
import '../../app/core/utils/constant.dart';
import '../../app/core/utils/dimensions.dart';

class CustomButton extends StatelessWidget {

  final void Function()? onTap;
  final String text;
  final Color textColor;
   final Color backgroundColor;
   final IconData? icon ;
   final String? assetIcon;
  final Color? iconColor;
  final double? iconSize ;
  final double? width;
  final double? height;
  final bool isFlat ;


  const CustomButton({Key? key, this.onTap,this.icon ,
    this.height,
    this.assetIcon,
    this.isFlat=false,
    required this.textColor, this.width ,
    this.iconSize=25,
    this.iconColor = ColorResources.primary ,
    required this.text,required this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return InkWell(
     onTap:onTap,
     child: Container(
       alignment: Alignment.center,
       height:height?? 56,
       width: width?? context.width ,
       decoration:  BoxDecoration(
           color: backgroundColor ,
           borderRadius:  BorderRadius.all(
               Radius.circular(isFlat?0 : Dimensions.PADDING_SIZE_DEFAULT))),
       child:  Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Text(
             text,
             style: titleTextStyle.copyWith(
                 color: textColor
             ),
           ),
           if( icon != null || assetIcon != null )
             wSpace,
          if( icon != null )
           Icon(icon,color: iconColor ,size:iconSize ),
           if(assetIcon != null)
             SvgPicture.asset(
               assetIcon ?? "",
               height: iconSize,
               width: iconSize,
               color: iconColor,
             ),


         ],
       ),
     ),
   );
  }
}
