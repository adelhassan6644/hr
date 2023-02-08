import 'package:flutter/material.dart';
import 'package:hr_project/app/core/utils/color_resources.dart';
import 'package:hr_project/app/core/utils/dimensions.dart';
import 'package:hr_project/app/core/utils/extensions.dart';
import 'package:hr_project/app/core/utils/text_styles.dart';
import 'package:hr_project/presentation/requests/widgets/title_container.dart';
import '../../domain/localization/language_constant.dart';

class RequestDetailsScreen extends StatelessWidget {
  const RequestDetailsScreen({required this.status,required this.requestType, Key? key}) : super(key: key);
  final String status;
  final String requestType;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height:24.h),
        Container(height: 1.5.h,
        color: ColorResources.BORDER_COLOR,),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT.w),
          child: Column(
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
                child: Row(
                  children: [
                    const Icon(Icons.description),
                    SizedBox(width: 8.w,),
                    Expanded(
                    child: Text(getTranslated("request_type",context),style: AppTextStyles.w600.copyWith(
                      color: ColorResources.HEADER,
                       fontSize: 14
                    ),),
                  ),
                    titleContainer(title:requestType,color: ColorResources.PRIMARY.withOpacity(0.2)),

                ],),
              ),
              Container(height: 1.5.h,
                color: ColorResources.BORDER_COLOR,),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
                child: Row(
                  children: [
                    const Icon(Icons.timelapse_outlined),
                    SizedBox(width: 8.w,),
                    Expanded(
                      child: Text(getTranslated("status",context),style: AppTextStyles.w600.copyWith(
                          color: ColorResources.HEADER,
                          fontSize: 14
                      ),),
                    ),
                    titleContainer(title:status,color: ColorResources.GREEN_COLOR.withOpacity(0.2)),
                  ],),
              ),
              Container(height: 1.5.h,
                color: ColorResources.BORDER_COLOR,),
              if(requestType == getTranslated("asset_items",context))
              Padding(
                padding:  EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
                child: Row(
                  children: [
                    const Icon(Icons.timelapse_outlined),
                    SizedBox(width: 8.w,),
                    Expanded(
                      child: Text(getTranslated("asset_items",context),style: AppTextStyles.w600.copyWith(
                          color: ColorResources.HEADER,
                          fontSize: 14
                      ),),
                    ),
                    titleContainer(title:status,color: ColorResources.GREEN_COLOR.withOpacity(0.2)),
                  ],),
              ),
              if(requestType == getTranslated("loan",context))
                Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(height: 16.h,),
                  //
                  // Text(getTranslated("loan_details",context),style: AppTextStyles.w600.copyWith(
                  //     color: ColorResources.HEADER,
                  //     fontSize: 14
                  // ),),
                  // SizedBox(height: 16.h,),
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
                    child: Row(
                      children: [
                        const Icon(Icons.monetization_on_outlined),
                        SizedBox(width: 8.w,),
                        Expanded(
                          child: Text(getTranslated("loan_amount",context),style: AppTextStyles.w600.copyWith(
                              color: ColorResources.HEADER,
                              fontSize: 14
                          ),),
                        ),
                        Text("2500.00 SAR",style: AppTextStyles.w500.copyWith(
                              color: ColorResources.SUBTITLE,
                              fontSize: 12
                          ),),
                      ],),
                  ),
                  Container(height: 1.5.h,
                    color: ColorResources.BORDER_COLOR,),
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
                    child: Row(
                      children: [
                        const Icon(Icons.numbers_rounded),
                        SizedBox(width: 8.w,),
                        Expanded(
                          child: Text(getTranslated("num_of_installment",context),style: AppTextStyles.w600.copyWith(
                              color: ColorResources.HEADER,
                              fontSize: 14
                          ),),
                        ),
                        Text("15",style: AppTextStyles.w500.copyWith(
                            color: ColorResources.SUBTITLE,
                            fontSize: 12
                        ),),
                      ],),
                  ),
                  Container(height: 1.5.h,
                    color: ColorResources.BORDER_COLOR,),
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
                    child: Row(
                      children: [
                        const Icon(Icons.money_off),
                        SizedBox(width: 8.w,),
                        Expanded(
                          child: Text(getTranslated("monthly_deduction",context),style: AppTextStyles.w600.copyWith(
                              color: ColorResources.HEADER,
                              fontSize: 14
                          ),),
                        ),
                        Text("170.00 SAR",style: AppTextStyles.w500.copyWith(
                            color: ColorResources.SUBTITLE,
                            fontSize: 12
                        ),),
                      ],),
                  ),
                  Container(height: 1.5.h,
                    color: ColorResources.BORDER_COLOR,),
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
                    child: Row(
                      children: [
                        const Icon(Icons.timer),
                        SizedBox(width: 8.w,),
                        Expanded(
                          child: Text(getTranslated("period_of_deduction",context),style: AppTextStyles.w600.copyWith(
                              color: ColorResources.HEADER,
                              fontSize: 14
                          ),),
                        ),
                        Text("${DateTime.now().format("MMM yyyy")}-${DateTime.now().format("MMM yyyy")}",style: AppTextStyles.w500.copyWith(
                            color: ColorResources.SUBTITLE,
                            fontSize: 12
                        ),),
                      ],),
                  ),


                ],
              ),
            ],
          ),
        ),
        Container(height: 1.5.h,
          color: ColorResources.BORDER_COLOR,),
      ],
    );
  }
}
