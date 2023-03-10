import 'package:flutter/material.dart';
import 'package:hr_project/app/core/utils/color_resources.dart';
import 'package:hr_project/app/core/utils/dimensions.dart';
import 'package:hr_project/app/core/utils/extensions.dart';
import 'package:hr_project/app/core/utils/text_styles.dart';
import 'package:hr_project/presentation/base/animated_widget.dart';
import 'package:hr_project/presentation/base/custom_app_bar.dart';
import '../../../../app/core/utils/images.dart';
import '../../../../domain/localization/language_constant.dart';

class DocumentsScreen extends StatelessWidget {
  const DocumentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title:getTranslated("documents",context),
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
                      Text(getTranslated("personal_documents", context),style: AppTextStyles.w600.copyWith(
                        fontSize: 16.0,
                      ),),
                      SizedBox(height: 24.h,),
                      Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: ColorResources.FILL_COLOR,
                          borderRadius: BorderRadius.all(Radius.circular(12.w)),
                        ),
                        child: Row(
                          children: [
                            Image.asset(Images.document,color: ColorResources.disabledColor,height: 20.h,width: 20.w,),
                            SizedBox(width: 10.w,),
                            Expanded(
                              child: Text("Passport",style: AppTextStyles.w500.copyWith(
                                color: ColorResources.HEADER,
                                fontSize: 16,
                              ),),
                            ),
                            Icon(Icons.download,size: 20.w,color: ColorResources.disabledColor,)
                          ],
                        ),
                      ),
                      SizedBox(height: 24.h,),


                    ],
                  ),
                ),
              ),
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
                      Text(getTranslated("employee_documents", context),style: AppTextStyles.w600.copyWith(
                        fontSize: 16.0,
                      ),),
                      SizedBox(height: 24.h,),
                      Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: ColorResources.FILL_COLOR,
                          borderRadius: BorderRadius.all(Radius.circular(12.w)),
                        ),
                        child: Row(
                          children: [
                            Image.asset(Images.document,color: ColorResources.disabledColor,height: 20.h,width: 20.w,),
                            SizedBox(width: 10.w,),
                            Expanded(
                              child: Text("Employee file",style: AppTextStyles.w500.copyWith(
                                color: ColorResources.HEADER,
                                fontSize: 16,
                              ),),
                            ),
                            Icon(Icons.download,size: 20.w,color: ColorResources.disabledColor,)
                          ],
                        ),
                      ),
                      SizedBox(height: 24.h,),


                    ],
                  ),
                ),
              ),
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
                      Text(getTranslated("company_documents", context),style: AppTextStyles.w600.copyWith(
                        fontSize: 16.0,
                      ),),
                      SizedBox(height: 24.h,),
                      Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: ColorResources.FILL_COLOR,
                          borderRadius: BorderRadius.all(Radius.circular(12.w)),
                        ),
                        child: Row(
                          children: [
                            Image.asset(Images.document,color: ColorResources.disabledColor,height: 20.h,width: 20.w,),
                            SizedBox(width: 10.w,),
                            Expanded(
                              child: Text("Company file",style: AppTextStyles.w500.copyWith(
                                color: ColorResources.HEADER,
                                fontSize: 16,
                              ),),
                            ),
                            Icon(Icons.download,size: 20.w,color: ColorResources.disabledColor,)
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
