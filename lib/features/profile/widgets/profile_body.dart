import 'package:flutter/material.dart';
import 'package:hr_project/app/core/extensions.dart';
import 'package:hr_project/features/profile/widgets/profile_details_card.dart';
import 'package:provider/provider.dart';

import '../../../app/core/color_resources.dart';
import '../../../app/core/dimensions.dart';
import '../../../app/core/text_styles.dart';
import '../../../app/localization/localization/language_constant.dart';
import '../../../app/localization/provider/localization_provider.dart';
import '../../../data/config/di.dart';
import '../../../main_providers/user_provider.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (_, provider, child) {
      return Container(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.PADDING_SIZE_DEFAULT.w,
            vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
        margin:
            EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.w),
            border: Border.all(
              color: Styles.LIGHT_BORDER_COLOR,
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              getTranslated("personal_information", context),
              style: AppTextStyles.w700.copyWith(
                fontSize: 16.0,
              ),
            ),
            SizedBox(
              height: 12.h,
            ),

            ///ID
            ProfileDetailsCard(
                title: getTranslated("job_id", context),
                data: provider.user?.employeeInfo?.id
                        ?.toString()
                        .convertDigits() ??
                    ""),

            ///NAME
            ProfileDetailsCard(
              title: getTranslated("name", context),
              data: sl<LocalizationProvider>().locale.languageCode == "ar"
                  ? provider.user?.arName ?? ""
                  : provider.user?.enName ?? "",
            ),

            ///Email
            ProfileDetailsCard(
                title: getTranslated("email_or_id", context),
                data: provider.user?.email ?? ""),

            ///Phone
            ProfileDetailsCard(
                title: getTranslated("phone", context),
                data: provider.user?.phone ?? ""),

            ///Gender
            ProfileDetailsCard(
              title: getTranslated("gender", context),
              data: (provider.user?.gender ?? 1) == 1
                  ? getTranslated("male", context)
                  : getTranslated("female", context),
            ),

            ///Gender
            ProfileDetailsCard(
              title: getTranslated("marital_status", context),
              data: provider.user?.employeeInfo?.maritalStatus == 1
                  ? getTranslated("married", context)
                  : getTranslated("single", context),
            ),

            ///Gender
            ProfileDetailsCard(
                title: getTranslated("age", context),
                data: "28".convertDigits()),

            ///Id Type
            ProfileDetailsCard(
              title: getTranslated("id_type", context),
              data: provider.user?.nationalId == 1
                  ? getTranslated("national_id", context)
                  : getTranslated("accommodation", context),
            ),

            ///Id Type
            ProfileDetailsCard(
              title: getTranslated("id_number", context),
              data:
                  provider.user?.employeeInfo?.idNumber?.convertDigits() ?? "",
            ),

            ///Religion
            ProfileDetailsCard(
              title: getTranslated("religion", context),
              data: provider.user?.employeeInfo?.religion == "1"
                  ? getTranslated("muslim", context)
                  : getTranslated("christian", context),
            ),

            ///Id Type
            ProfileDetailsCard(
              title: getTranslated("date_of_birth", context),
              data: provider.user?.dateOfBirth?.format("dd-MM-yyyy") ?? "",
            ),
          ],
        ),
      );
    });
  }
}
