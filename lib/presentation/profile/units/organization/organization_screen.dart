import 'package:flutter/material.dart';
import 'package:hr_project/app/core/utils/color_resources.dart';
import 'package:hr_project/app/core/utils/dimensions.dart';
import 'package:hr_project/app/core/utils/extensions.dart';
import 'package:hr_project/app/core/utils/text_styles.dart';
import 'package:hr_project/presentation/base/animated_widget.dart';
import 'package:hr_project/presentation/base/custom_app_bar.dart';
import '../../../../data/model/user_model.dart';
import '../../../../domain/localization/language_constant.dart';

class OrganizationScreen extends StatelessWidget {
  const OrganizationScreen({required this.employee,Key? key}) : super(key: key);

  final UserModel employee;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title:getTranslated("organization",context),
      ),
      body:  SizedBox(
        height: context.height,
        child: ListAnimator(
          data: [
            SizedBox(height: 24.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT.w),
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.PADDING_SIZE_DEFAULT.w,
                    vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.w),
                    border: Border.all(
                        color: ColorResources.BORDER_COLOR,
                        width: 0.5,
                        style: BorderStyle.solid)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(getTranslated("information_about_organization", context),style: AppTextStyles.w600.copyWith(
                      fontSize: 16.0,
                    ),),
                    SizedBox(height: 24.h,),
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: ColorResources.FILL_COLOR,
                        borderRadius: BorderRadius.all(Radius.circular(12.w)),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color:ColorResources.shadowColor ,
                        //     offset:const Offset(0,3) ,
                        //     blurRadius: 7
                        //   )
                        // ]
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(getTranslated("join_date", context),style: AppTextStyles.w500.copyWith(
                              color: ColorResources.HEADER,
                              fontSize: 16,
                            ),),
                          ),
                          Text(employee.dateOfJoining!.format("dd-MMMM-yyyy"),style: AppTextStyles.w600.copyWith(
                            fontSize: 12,
                            color: ColorResources.SUB_TEXT
                          ),)
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h,),
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                          color: ColorResources.FILL_COLOR,
                          borderRadius: BorderRadius.all(Radius.circular(12.w)),
                          // boxShadow: [
                          //   BoxShadow(
                          //       color:ColorResources.shadowColor ,
                          //       offset:const Offset(0,3) ,
                          //       blurRadius: 7
                          //   )
                          // ]
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(getTranslated("job_title", context),style: AppTextStyles.w500.copyWith(
                              color: ColorResources.HEADER,
                              fontSize: 16,
                            ),),
                          ),
                          Text(employee.jobType?.jobTitle??"",style: AppTextStyles.w600.copyWith(
                              fontSize: 12,
                              color: ColorResources.SUB_TEXT
                          ),)
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h,),
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                          color: ColorResources.FILL_COLOR,
                          borderRadius: BorderRadius.all(Radius.circular(12.w)),
                          // boxShadow: [
                          //   BoxShadow(
                          //       color:ColorResources.shadowColor ,
                          //       offset:const Offset(0,3) ,
                          //       blurRadius: 7
                          //   )
                          // ]
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(getTranslated("employment_type", context),style: AppTextStyles.w500.copyWith(
                              color: ColorResources.HEADER,
                              fontSize: 16,
                            ),),
                          ),
                          Text("Flutter Developer",style: AppTextStyles.w600.copyWith(
                              fontSize: 12,
                              color: ColorResources.SUB_TEXT
                          ),)
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h,),
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                          color: ColorResources.FILL_COLOR,
                          borderRadius: BorderRadius.all(Radius.circular(12.w)),
                          // boxShadow: [
                          //   BoxShadow(
                          //       color:ColorResources.shadowColor ,
                          //       offset:const Offset(0,3) ,
                          //       blurRadius: 7
                          //   )
                          // ]
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(getTranslated("department", context),style: AppTextStyles.w500.copyWith(
                              color: ColorResources.HEADER,
                              fontSize: 16,
                            ),),
                          ),
                          Text("Developing",style: AppTextStyles.w600.copyWith(
                              fontSize: 12,
                              color: ColorResources.SUB_TEXT
                          ),)
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h,),
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                          color: ColorResources.FILL_COLOR,
                          borderRadius: BorderRadius.all(Radius.circular(12.w)),
                          // boxShadow: [
                          //   BoxShadow(
                          //       color:ColorResources.shadowColor ,
                          //       offset:const Offset(0,3) ,
                          //       blurRadius: 7
                          //   )
                          // ]
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(getTranslated("business_unit", context),style: AppTextStyles.w500.copyWith(
                              color: ColorResources.HEADER,
                              fontSize: 16,
                            ),),
                          ),
                          Text("Software Cloud 2",style: AppTextStyles.w600.copyWith(
                              fontSize: 12,
                              color: ColorResources.SUB_TEXT
                          ),)
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h,),
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                          color: ColorResources.FILL_COLOR,
                          borderRadius: BorderRadius.all(Radius.circular(12.w)),
                          // boxShadow: [
                          //   BoxShadow(
                          //       color:ColorResources.shadowColor ,
                          //       offset:const Offset(0,3) ,
                          //       blurRadius: 7
                          //   )
                          // ]
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(getTranslated("location", context),style: AppTextStyles.w500.copyWith(
                              color: ColorResources.HEADER,
                              fontSize: 16,
                            ),),
                          ),
                          Text(employee.branch?.enName??"",style: AppTextStyles.w600.copyWith(
                              fontSize: 12,
                              color: ColorResources.SUB_TEXT
                          ),)
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h,),
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                          color: ColorResources.FILL_COLOR,
                          borderRadius: BorderRadius.all(Radius.circular(12.w)),
                          // boxShadow: [
                          //   BoxShadow(
                          //       color:ColorResources.shadowColor ,
                          //       offset:const Offset(0,3) ,
                          //       blurRadius: 7
                          //   )
                          // ]
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(getTranslated("grade", context),style: AppTextStyles.w500.copyWith(
                              color: ColorResources.HEADER,
                              fontSize: 16,
                            ),),
                          ),
                          Text(employee.jobLevel?.jobTitle??"",style: AppTextStyles.w600.copyWith(
                              fontSize: 12,
                              color: ColorResources.SUB_TEXT
                          ),)
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h,),
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                          color: ColorResources.FILL_COLOR,
                          borderRadius: BorderRadius.all(Radius.circular(12.w)),
                          // boxShadow: [
                          //   BoxShadow(
                          //       color:ColorResources.shadowColor ,
                          //       offset:const Offset(0,3) ,
                          //       blurRadius: 7
                          //   )
                          // ]
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(getTranslated("line_manager", context),style: AppTextStyles.w500.copyWith(
                              color: ColorResources.HEADER,
                              fontSize: 16,
                            ),),
                          ),
                          Text(employee.directManager?.enName??"",style: AppTextStyles.w600.copyWith(
                              fontSize: 12,
                              color: ColorResources.SUB_TEXT
                          ),)
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h,),

                  ],
                ),
              ),
            ),
            SizedBox(height: 24.h,),
          ],
        ),
      )

    );
  }
}
