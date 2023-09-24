import 'package:flutter/material.dart';
import 'package:hr_project/app/core/color_resources.dart';
import 'package:hr_project/app/core/extensions.dart';
import 'package:hr_project/app/core/text_styles.dart';
import 'package:hr_project/data/model/user_model.dart';
import '../../../../app/core/dimensions.dart';
import '../../../../app/localization/localization/language_constant.dart';
import '../../../../app/localization/provider/localization_provider.dart';
import '../../../../components/animated_widget.dart';
import '../../../../components/custom_app_bar.dart';
import '../../../../components/image_widget.dart';
import '../../../../data/config/di.dart';

class PersonalScreen extends StatelessWidget {
  const PersonalScreen({required this.user, Key? key}) : super(key: key);

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: getTranslated("personal", context),
        ),
        body: SizedBox(
          height: context.height,
          child: ListAnimator(
            data: [
              SizedBox(
                height: 24.h,
              ),
              Center(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: ColorResources.FILL_COLOR),
                  child: user.image == null
                      ? const ClipOval(
                          child: Icon(
                          Icons.person,
                          color: ColorResources.disabledColor,
                          size: 80,
                        ))
                      : ImageWidget.network(user.image!,
                          width: 100.w,
                          height: 100.h,
                          border: BorderRadius.circular(100)),
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
                          color: ColorResources.BORDER_COLOR,
                          width: 0.5,
                          style: BorderStyle.solid)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        getTranslated("personal_information", context),
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
                          color: ColorResources.FILL_COLOR,
                          borderRadius: BorderRadius.all(Radius.circular(12.w)),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                getTranslated("job_id", context),
                                style: AppTextStyles.w500.copyWith(
                                  color: ColorResources.HEADER,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Text(
                              user.employeeInfo?.id
                                      ?.toString()
                                      .convertDigits() ??
                                  "",
                              style: AppTextStyles.w600.copyWith(
                                  fontSize: 12, color: ColorResources.SUB_TEXT),
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
                          color: ColorResources.FILL_COLOR,
                          borderRadius: BorderRadius.all(Radius.circular(12.w)),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                getTranslated("name", context),
                                style: AppTextStyles.w500.copyWith(
                                  color: ColorResources.HEADER,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Text(
                           sl<LocalizationProvider>()
                                          .locale
                                          .languageCode ==
                                      "ar"
                                  ? user.arName ?? ""
                                  : user.enName ?? "",
                              style: AppTextStyles.w600.copyWith(
                                  fontSize: 12, color: ColorResources.SUB_TEXT),
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
                          color: ColorResources.FILL_COLOR,
                          borderRadius: BorderRadius.all(Radius.circular(12.w)),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                getTranslated("email_or_id", context),
                                style: AppTextStyles.w500.copyWith(
                                  color: ColorResources.HEADER,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Text(
                              user.email ?? "",
                              style: AppTextStyles.w600.copyWith(
                                  fontSize: 12, color: ColorResources.SUB_TEXT),
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
                          color: ColorResources.FILL_COLOR,
                          borderRadius: BorderRadius.all(Radius.circular(12.w)),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                getTranslated("phone", context),
                                style: AppTextStyles.w500.copyWith(
                                  color: ColorResources.HEADER,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Text(
                              user.phone?.convertDigits() ?? "",
                              style: AppTextStyles.w600.copyWith(
                                  fontSize: 12, color: ColorResources.SUB_TEXT),
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
                              child: Text(
                                getTranslated("gender", context),
                                style: AppTextStyles.w500.copyWith(
                                  color: ColorResources.HEADER,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Text(
                              (user.gender ?? 1) == 1
                                  ? getTranslated("male", context)
                                  : getTranslated("female", context),
                              style: AppTextStyles.w600.copyWith(
                                  fontSize: 12, color: ColorResources.SUB_TEXT),
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
                          color: ColorResources.FILL_COLOR,
                          borderRadius: BorderRadius.all(Radius.circular(12.w)),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                getTranslated("marital_status", context),
                                style: AppTextStyles.w500.copyWith(
                                  color: ColorResources.HEADER,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Text(
                              (user.employeeInfo?.maritalStatus ?? 1) == 1
                                  ? getTranslated("married", context)
                                  : getTranslated("single", context),
                              style: AppTextStyles.w600.copyWith(
                                  fontSize: 12, color: ColorResources.SUB_TEXT),
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
                          color: ColorResources.FILL_COLOR,
                          borderRadius: BorderRadius.all(Radius.circular(12.w)),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                getTranslated("age", context),
                                style: AppTextStyles.w500.copyWith(
                                  color: ColorResources.HEADER,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Text(
                              "28".convertDigits(),
                              style: AppTextStyles.w600.copyWith(
                                  fontSize: 12, color: ColorResources.SUB_TEXT),
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
                          color: ColorResources.FILL_COLOR,
                          borderRadius: BorderRadius.all(Radius.circular(12.w)),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                getTranslated("id_type", context),
                                style: AppTextStyles.w500.copyWith(
                                  color: ColorResources.HEADER,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Text(
                              user.nationalId == 1
                                  ? getTranslated("national_id", context)
                                  : getTranslated("accommodation", context),
                              style: AppTextStyles.w600.copyWith(
                                  fontSize: 12, color: ColorResources.SUB_TEXT),
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
                          color: ColorResources.FILL_COLOR,
                          borderRadius: BorderRadius.all(Radius.circular(12.w)),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                getTranslated("id_number", context),
                                style: AppTextStyles.w500.copyWith(
                                  color: ColorResources.HEADER,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Text(
                              user.employeeInfo?.idNumber?.convertDigits() ??
                                  "",
                              style: AppTextStyles.w600.copyWith(
                                  fontSize: 12, color: ColorResources.SUB_TEXT),
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
                          color: ColorResources.FILL_COLOR,
                          borderRadius: BorderRadius.all(Radius.circular(12.w)),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                getTranslated("religion", context),
                                style: AppTextStyles.w500.copyWith(
                                  color: ColorResources.HEADER,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Text(
                              int.parse(user.employeeInfo?.religion ?? "1") == 1
                                  ? getTranslated("muslim", context)
                                  : getTranslated("christian", context),
                              style: AppTextStyles.w600.copyWith(
                                  fontSize: 12, color: ColorResources.SUB_TEXT),
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
                          color: ColorResources.FILL_COLOR,
                          borderRadius: BorderRadius.all(Radius.circular(12.w)),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                getTranslated("date_of_birth", context),
                                style: AppTextStyles.w500.copyWith(
                                  color: ColorResources.HEADER,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Text(
                              user.dateOfBirth!.format("dd-MM-yyyy"),
                              style: AppTextStyles.w600.copyWith(
                                  fontSize: 12, color: ColorResources.SUB_TEXT),
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
