import 'package:flutter/material.dart';
import 'package:hr_project/app/core/color_resources.dart';
import 'package:hr_project/app/core/extensions.dart';
import 'package:hr_project/app/core/text_styles.dart';
import 'package:provider/provider.dart';
import '../../../../app/core/dimensions.dart';
import '../../../../app/localization/localization/language_constant.dart';
import '../../../../app/localization/provider/localization_provider.dart';
import '../../../../components/animated_widget.dart';
import '../../../../components/custom_app_bar.dart';
import '../../../../data/config/di.dart';
import '../../../../data/model/user_model.dart';

class OrganizationScreen extends StatelessWidget {
  const OrganizationScreen({required this.employee, Key? key})
      : super(key: key);

  final UserModel employee;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: getTranslated("organization", context),
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
                        getTranslated(
                            "information_about_organization", context),
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
                            Expanded(
                              child: Text(
                                getTranslated("join_date", context),
                                style: AppTextStyles.w500.copyWith(
                                  color: Styles.HEADER,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Text(
                              employee.dateOfJoining!.format("dd-MMMM-yyyy"),
                              style: AppTextStyles.w600.copyWith(
                                  fontSize: 12, color: Styles.SUB_TEXT),
                            )
                          ],
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
                            Expanded(
                              child: Text(
                                getTranslated("job_title", context),
                                style: AppTextStyles.w500.copyWith(
                                  color: Styles.HEADER,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Text(
                              employee.jobRole?.jobTitle ?? "",
                              style: AppTextStyles.w600.copyWith(
                                  fontSize: 12, color: Styles.SUB_TEXT),
                            )
                          ],
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
                            Expanded(
                              child: Text(
                                getTranslated("job_type", context),
                                style: AppTextStyles.w500.copyWith(
                                  color: Styles.HEADER,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Text(
                              employee.jobType?.name ?? "",
                              style: AppTextStyles.w600.copyWith(
                                  fontSize: 12, color: Styles.SUB_TEXT),
                            )
                          ],
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
                            Expanded(
                              child: Text(
                                getTranslated("department", context),
                                style: AppTextStyles.w500.copyWith(
                                  color: Styles.HEADER,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Text(
                              employee.jobCategory?.name ?? "",
                              style: AppTextStyles.w600.copyWith(
                                  fontSize: 12, color: Styles.SUB_TEXT),
                            )
                          ],
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
                            Expanded(
                              child: Text(
                                getTranslated("job_unit", context),
                                style: AppTextStyles.w500.copyWith(
                                  color: Styles.HEADER,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Text(
                              employee.jobUnit?.name ?? "",
                              style: AppTextStyles.w600.copyWith(
                                  fontSize: 12, color: Styles.SUB_TEXT),
                            )
                          ],
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
                            Expanded(
                              child: Text(
                                getTranslated("location", context),
                                style: AppTextStyles.w500.copyWith(
                                  color: Styles.HEADER,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Text(
                              sl<LocalizationProvider>()
                                          .locale
                                          .languageCode ==
                                      "en"
                                  ? employee.branch?.enName ?? ""
                                  : employee.branch?.arName ?? "",
                              style: AppTextStyles.w600.copyWith(
                                  fontSize: 12, color: Styles.SUB_TEXT),
                            )
                          ],
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
                            Expanded(
                              child: Text(
                                getTranslated("grade", context),
                                style: AppTextStyles.w500.copyWith(
                                  color: Styles.HEADER,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Text(
                              employee.jobLevel?.name ?? "",
                              style: AppTextStyles.w600.copyWith(
                                  fontSize: 12, color: Styles.SUB_TEXT),
                            )
                          ],
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
                            Expanded(
                              child: Text(
                                getTranslated("line_manager", context),
                                style: AppTextStyles.w500.copyWith(
                                  color: Styles.HEADER,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Text(
                              Provider.of<LocalizationProvider>(context,
                                              listen: false)
                                          .locale
                                          .languageCode ==
                                      "en"
                                  ? employee.directManager?.enName ?? ""
                                  : employee.directManager?.arName ?? "",
                              style: AppTextStyles.w600.copyWith(
                                  fontSize: 12, color: Styles.SUB_TEXT),
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
