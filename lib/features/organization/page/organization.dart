import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/color_resources.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import 'package:yusrPlus/app/core/text_styles.dart';
import 'package:provider/provider.dart';
import '../../../../../app/core/dimensions.dart';
import '../../../app/localization/language_constant.dart';
import '../../language/provider/localization_provider.dart';
import '../../../../../components/animated_widget.dart';
import '../../../../../components/custom_app_bar.dart';
import '../../../../../data/config/di.dart';
import '../../../main_providers/user_provider.dart';
import '../../profile/widgets/profile_details_card.dart';

class Organization extends StatelessWidget {
  const Organization({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: getTranslated("organization", context),
      ),
      body: Consumer<UserProvider>(builder: (_, provider, child) {
        return Column(
          children: [
            Expanded(
              child: ListAnimator(
                customPadding: EdgeInsets.symmetric(
                    vertical: Dimensions.PADDING_SIZE_DEFAULT.w,
                    horizontal: Dimensions.PADDING_SIZE_DEFAULT.w),
                data: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.PADDING_SIZE_DEFAULT.w,
                        vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.w),
                        border: Border.all(
                          color: Styles.LIGHT_BORDER_COLOR,
                        )),
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

                        ///Job Data
                        ProfileDetailsCard(
                          title: getTranslated("join_date", context),
                          data: provider.user?.dateOfJoining
                                  ?.format("dd-MMMM-yyyy") ??
                              "",
                        ),

                        ///Job Title
                        ProfileDetailsCard(
                          title: getTranslated("job_title", context),
                          data: provider.user?.jobRole?.jobTitle ?? "",
                        ),

                        ///Job Type
                        ProfileDetailsCard(
                          title: getTranslated("job_type", context),
                          data: provider.user?.jobType?.name ?? "",
                        ),

                        ///Department
                        ProfileDetailsCard(
                          title: getTranslated("department", context),
                          data: provider.user?.jobCategory?.name ?? "",
                        ),

                        ///Department
                        ProfileDetailsCard(
                          title: getTranslated("job_unit", context),
                          data: provider.user?.jobUnit?.name ?? "",
                        ),

                        ///Location
                        ProfileDetailsCard(
                          title: getTranslated("location", context),
                          data:
                              sl<LocalizationProvider>().locale.languageCode ==
                                      "en"
                                  ? provider.user?.branch?.enName ?? ""
                                  : provider.user?.branch?.arName ?? "",
                        ),

                        ///Grade
                        ProfileDetailsCard(
                          title: getTranslated("grade", context),
                          data: provider.user?.jobLevel?.name ?? "",
                        ),

                        ///Line Manager
                        ProfileDetailsCard(
                          title: getTranslated("line_manager", context),
                          data:
                              sl<LocalizationProvider>().locale.languageCode ==
                                      "en"
                                  ? provider.user?.directManager?.enName ?? ""
                                  : provider.user?.directManager?.arName ?? "",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
