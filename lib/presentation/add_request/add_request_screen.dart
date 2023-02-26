import 'package:flutter/material.dart';
import 'package:hr_project/app/core/utils/color_resources.dart';
import 'package:hr_project/app/core/utils/dimensions.dart';
import 'package:hr_project/app/core/utils/extensions.dart';
import 'package:hr_project/app/core/utils/text_styles.dart';
import 'package:hr_project/navigation/custom_navigation.dart';
import 'package:hr_project/presentation/add_request/widgets/tab_request.dart';
import 'package:hr_project/presentation/base/animated_widget.dart';
import 'package:hr_project/presentation/base/custom_app_bar.dart';

import '../../app/core/utils/images.dart';
import '../../domain/localization/language_constant.dart';
import '../../navigation/routes.dart';

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
              color: ColorResources.PRIMARY,
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
               color: ColorResources.GOLD_COLOR.withOpacity(0.4),
                width: 1.0.h,
             )
           ),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
             Text(getTranslated("finance", context),style: AppTextStyles.w600.copyWith(
               color: ColorResources.PRIMARY,
               fontSize: 16.0,
             ),),
             SizedBox(
               height: 16.h,
             ),
               tabRequest(title:getTranslated("loan", context),textColor:ColorResources.PRIMARY,
                   textSize: 14,
                   iconColor: ColorResources.GOLD_COLOR,
                   astIcon: Images.salaries,
               onTap: ()=>CustomNavigator.push(Routes.LOAN_REQUEST)
               ),
               SizedBox(
               height: 8.h,
             ),
               tabRequest(title:getTranslated("expense_claim", context),textColor:ColorResources.PRIMARY,
                   textSize: 14,
                   iconColor: ColorResources.GOLD_COLOR,
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
                     color: ColorResources.GOLD_COLOR.withOpacity(0.4),
                     width: 1.0.h,
                   )
               ),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(getTranslated("attendance", context),style: AppTextStyles.w600.copyWith(
                     color: ColorResources.PRIMARY,
                     fontSize: 16.0,
                   ),),
                   SizedBox(
                     height: 16.h,
                   ),
                   tabRequest(title:getTranslated("permission", context),textColor:ColorResources.PRIMARY,
                       textSize: 14,
                       iconColor: ColorResources.GOLD_COLOR,
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
                     color: ColorResources.GOLD_COLOR.withOpacity(0.4),
                     width: 1.0.h,
                   )
               ),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(getTranslated("other", context),style: AppTextStyles.w600.copyWith(
                     color: ColorResources.PRIMARY,
                     fontSize: 16.0,
                   ),),
                   SizedBox(
                     height: 16.h,
                   ),
                   tabRequest(title:getTranslated("vacation", context),textColor:ColorResources.PRIMARY,
                       textSize: 14,
                       iconColor: ColorResources.GOLD_COLOR,
                       astIcon: Images.vacations,
                       onTap: ()=>CustomNavigator.push(Routes.VACATION_REQUEST)
                   ),
                   SizedBox(
                     height: 8.h,
                   ),
                   tabRequest(title:getTranslated("business_trip", context),textColor:ColorResources.PRIMARY,
                       textSize: 14,
                       iconColor: ColorResources.GOLD_COLOR,
                       astIcon: Images.plane,
                       onTap: ()=>CustomNavigator.push(Routes.BUSINESS_TRIP_REQUEST)
                   ),
                   SizedBox(
                     height: 8.h,
                   ),
                   tabRequest(title:getTranslated("letter", context),textColor:ColorResources.PRIMARY,
                       textSize: 14,
                       iconColor: ColorResources.GOLD_COLOR,
                       astIcon: Images.letter,
                       onTap: ()=>CustomNavigator.push(Routes.LETTER_REQUEST)),
                   SizedBox(
                     height: 8.h,
                   ),
                   tabRequest(title:getTranslated("asset", context),textColor:ColorResources.PRIMARY,
                       textSize: 14,
                       iconColor: ColorResources.GOLD_COLOR,
                       astIcon: Images.assetsIcon,
                       onTap: ()=>CustomNavigator.push(Routes.ASSET_REQUEST)),
                   SizedBox(
                     height: 8.h,
                   ),
                   tabRequest(title:getTranslated("asset_clear", context),textColor:ColorResources.PRIMARY,
                       textSize: 14,
                       iconColor: ColorResources.GOLD_COLOR,
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
