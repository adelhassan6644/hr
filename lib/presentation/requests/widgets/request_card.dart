import 'package:flutter/material.dart';
import 'package:hr_project/app/core/utils/extensions.dart';
import 'package:hr_project/presentation/requests/widgets/title_container.dart';

import '../../../app/core/utils/color_resources.dart';
import '../../../app/core/utils/dimensions.dart';
import '../../../domain/localization/language_constant.dart';

class RequestCard extends StatelessWidget {
  const RequestCard({ this.onTap,required this.status,required this.reason,required this.requestType,Key? key}) : super(key: key);
 final Function()? onTap;
 final String status;
 final String requestType;
 final String reason;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(width: context.width,
        padding:  EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                width: 0.5,
                color: ColorResources.BORDER_COLOR
            )
        ),
        child: Column(children: [
          SizedBox(height: 10.h,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                titleContainer(title:status == "rejected"? getTranslated(status, context).replaceAll("ال", "").replaceAll("ة", ""):
                getTranslated(status, context) ,
                    color: ColorResources.getStatusColor(status),textColor: Colors.white),
                titleContainer(title:DateTime.now().format("EEEE dd MMMM"),),
              ],
            ),
          ),
          SizedBox(height: 10.h,),
          Container(height: 1,color: ColorResources.BORDER_COLOR,),
          SizedBox(height: 10.h,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT),
            child: SizedBox(
              width: context.width,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(5, (index) => titleContainer(title:requestType,color: ColorResources.PRIMARY,textColor: Colors.white),)
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10.h,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT),
            child: SizedBox(
              width: context.width,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    titleContainer(title:reason,icon: Icons.question_mark,),
                  ],
                ),
              ),
            ),
          ),

        ],),),
    );
  }
}
