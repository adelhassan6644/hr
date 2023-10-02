import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/color_resources.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import 'package:yusrPlus/app/core/text_styles.dart';
import '../../../../app/core/dimensions.dart';
import '../../../../app/core/images.dart';
import '../../app/localization/language_constant.dart';
import '../../../../components/animated_widget.dart';
import '../../../../components/custom_app_bar.dart';

class DocumentsScreen extends StatelessWidget {
  const DocumentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: getTranslated("documents", context),
        ),
        body: SizedBox(
          height: context.height,
          child: ListAnimator(
            data: [
              SizedBox(
                height: 24.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.PADDING_SIZE_DEFAULT.w),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.PADDING_SIZE_DEFAULT.w,
                      vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.w),
                      border: Border.all(
                          color: Styles.BORDER_COLOR,
                          width: 0.5,
                          style: BorderStyle.solid)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        getTranslated("personal_documents", context),
                        style: AppTextStyles.w600.copyWith(
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Styles.FILL_COLOR,
                          borderRadius: BorderRadius.all(Radius.circular(12.w)),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              Images.document,
                              color: Styles.disabledColor,
                              height: 20.h,
                              width: 20.w,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: Text(
                                "Passport",
                                style: AppTextStyles.w500.copyWith(
                                  color: Styles.HEADER,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.download,
                              size: 20.w,
                              color: Styles.disabledColor,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.PADDING_SIZE_DEFAULT.w),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.PADDING_SIZE_DEFAULT.w,
                      vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.w),
                      border: Border.all(
                          color: Styles.BORDER_COLOR,
                          width: 0.5,
                          style: BorderStyle.solid)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        getTranslated("employee_documents", context),
                        style: AppTextStyles.w600.copyWith(
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Styles.FILL_COLOR,
                          borderRadius: BorderRadius.all(Radius.circular(12.w)),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              Images.document,
                              color: Styles.disabledColor,
                              height: 20.h,
                              width: 20.w,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: Text(
                                "Employee file",
                                style: AppTextStyles.w500.copyWith(
                                  color: Styles.HEADER,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.download,
                              size: 20.w,
                              color: Styles.disabledColor,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.PADDING_SIZE_DEFAULT.w),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.PADDING_SIZE_DEFAULT.w,
                      vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.w),
                      border: Border.all(
                          color: Styles.BORDER_COLOR,
                          width: 0.5,
                          style: BorderStyle.solid)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        getTranslated("company_documents", context),
                        style: AppTextStyles.w600.copyWith(
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Styles.FILL_COLOR,
                          borderRadius: BorderRadius.all(Radius.circular(12.w)),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              Images.document,
                              color: Styles.disabledColor,
                              height: 20.h,
                              width: 20.w,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: Text(
                                "Company file",
                                style: AppTextStyles.w500.copyWith(
                                  color: Styles.HEADER,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.download,
                              size: 20.w,
                              color: Styles.disabledColor,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
            ],
          ),
        ));
  }
}
