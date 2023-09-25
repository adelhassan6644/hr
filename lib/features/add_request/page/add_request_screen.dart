import 'package:flutter/material.dart';
import 'package:hr_project/app/core/color_resources.dart';
import 'package:hr_project/app/core/extensions.dart';
import 'package:hr_project/app/core/text_styles.dart';
import 'package:hr_project/navigation/custom_navigation.dart';

import '../../../app/core/dimensions.dart';
import '../../../app/core/images.dart';
import '../../../app/localization/localization/language_constant.dart';
import '../../../components/animated_widget.dart';
import '../../../components/custom_app_bar.dart';
import '../../../navigation/routes.dart';
import '../widgets/tab_request.dart';

class AddRequestScreen extends StatelessWidget {
  const AddRequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: getTranslated("add_request",context),
      ),
     body:Padding(
       padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT.w,
           vertical:Dimensions.PADDING_SIZE_DEFAULT.h ),
       child: SizedBox(
         height: context.height,
         child: ListAnimator(
           data: [
           Text(getTranslated("select_your_request_type", context),style: AppTextStyles.w500.copyWith(
              color: Styles.SUBTITLE,
              fontSize: 16.0,
           ),),

           ///Finance Request
           SizedBox(
             height: 16.h,
           ),
           Container(
             padding:  EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT.w,
                 vertical:Dimensions.PADDING_SIZE_DEFAULT.h ),
           decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12.w)),
             border: Border.all(
               color: Styles.BORDER_COLOR,
                width: 1.0.h,
             )
           ),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
             Text(getTranslated("finance", context),style: AppTextStyles.w600.copyWith(
               color: Styles.PRIMARY_COLOR,
               fontSize: 16.0,
             ),),
             SizedBox(
               height: 16.h,
             ),
               tabRequest(title:getTranslated("loan", context),textColor:Styles.SUBTITLE,
                   textSize: 14,
                   iconColor: Styles.SUBTITLE,
                   astIcon: Images.salaries,
               onTap: ()=>CustomNavigator.push(Routes.LOAN_REQUEST)
               ),
               SizedBox(
               height: 8.h,
             ),
               tabRequest(title:getTranslated("expense_claim", context),textColor:Styles.SUBTITLE,
                   textSize: 14,
                   iconColor: Styles.SUBTITLE,
                   astIcon: Images.expenses,
                   onTap: ()=>CustomNavigator.push(Routes.EXPENSE_CLAIM_REQUEST)

               ),

           ],),
         ),
           ///Attendance Request
           SizedBox(
               height: 16.h,
             ),
           Container(
               padding:  EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT.w,
                   vertical:Dimensions.PADDING_SIZE_DEFAULT.h ),
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.all(Radius.circular(12.w)),
                   border: Border.all(
                     color: Styles.BORDER_COLOR,
                     width: 1.0.h,
                   )
               ),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(getTranslated("attendance", context),style: AppTextStyles.w600.copyWith(
                     color: Styles.PRIMARY_COLOR,
                     fontSize: 16.0,
                   ),),
                   SizedBox(
                     height: 16.h,
                   ),
                   tabRequest(title:getTranslated("permission", context),textColor:Styles.SUBTITLE,
                       textSize: 14,
                       iconColor: Styles.SUBTITLE,
                       astIcon: Images.exit,
                       onTap: ()=>CustomNavigator.push(Routes.PERMISSIN_REQUEST)),
                 ],),
             ),
           ///other Request
           SizedBox(
               height: 16.h,
             ),
             Container(
               padding:  EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT.w,
                   vertical:Dimensions.PADDING_SIZE_DEFAULT.h ),
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.all(Radius.circular(12.w)),
                   border: Border.all(
                     color: Styles.BORDER_COLOR,
                     width: 1.0.h,
                   )
               ),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(getTranslated("other", context),style: AppTextStyles.w600.copyWith(
                     color: Styles.PRIMARY_COLOR,
                     fontSize: 16.0,
                   ),),
                   SizedBox(
                     height: 16.h,
                   ),
                   tabRequest(title:getTranslated("vacation", context),textColor:Styles.SUBTITLE,
                       textSize: 14,
                       iconColor: Styles.SUBTITLE,
                       astIcon: Images.vacations,
                       onTap: ()=>CustomNavigator.push(Routes.VACATION_REQUEST)
                   ),
                   SizedBox(
                     height: 8.h,
                   ),
                   tabRequest(title:getTranslated("business_trip", context),textColor:Styles.SUBTITLE,
                       textSize: 14,
                       iconColor: Styles.SUBTITLE,
                       astIcon: Images.plane,
                       onTap: ()=>CustomNavigator.push(Routes.BUSINESS_TRIP_REQUEST)
                   ),
                   SizedBox(
                     height: 8.h,
                   ),
                   tabRequest(title:getTranslated("letter", context),textColor:Styles.SUBTITLE,
                       textSize: 14,
                       iconColor: Styles.SUBTITLE,
                       astIcon: Images.letter,
                       onTap: ()=>CustomNavigator.push(Routes.LETTER_REQUEST)),
                   SizedBox(
                     height: 8.h,
                   ),
                   tabRequest(title:getTranslated("asset", context),textColor:Styles.SUBTITLE,
                       textSize: 14,
                       iconColor: Styles.SUBTITLE,
                       astIcon: Images.assetsIcon,
                       onTap: ()=>CustomNavigator.push(Routes.ASSET_REQUEST)),
                   SizedBox(
                     height: 8.h,
                   ),
                   tabRequest(title:getTranslated("asset_clear", context),textColor:Styles.SUBTITLE,
                       textSize: 14,
                       iconColor: Styles.SUBTITLE,
                       astIcon: Images.assetsIcon,
                       onTap: ()=>CustomNavigator.push(Routes.CLEAR_ASSET_REQUEST)
                   ),

                 ],),
             ),
           ],),
       ),
     ) ,
    );
  }
}
