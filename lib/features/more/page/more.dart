import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import 'package:yusrPlus/components/animated_widget.dart';
import 'package:yusrPlus/navigation/custom_navigation.dart';
import '../../../app/core/app_snack_bar.dart';
import '../../../app/core/dimensions.dart';
import '../../../app/core/images.dart';
import '../../../app/localization/language_constant.dart';
import '../../../navigation/routes.dart';
import '../widget/annual_leave_balance_card.dart';
import '../widget/more_navigate_card.dart';
import '../widget/profile_card.dart';

class More extends StatelessWidget {
  const More({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: ListAnimator(
              customPadding: EdgeInsets.symmetric(
                horizontal: Dimensions.PADDING_SIZE_DEFAULT.w,
                vertical: Dimensions.PADDING_SIZE_DEFAULT.h,
              ),
              data: [
                const ProfileCard(),

                const AnnualLeaveBalanceCard(),

                MoreNavigateCard(
                    name: getTranslated("personal", context),
                    iconAsset: Images.personalCardIcon,
                    onTap: () => CustomNavigator.push(Routes.PROFILE)),

                MoreNavigateCard(
                  name: getTranslated("organization", context),
                  iconAsset: Images.organizationIcon,
                  onTap: () => CustomNavigator.push(Routes.ORGANIZATION),
                ),

                // MoreNavigateCard(
                //     name: getTranslated("salary_&_financial", context),
                //     iconAsset: Images.salaryIcon,
                //     onTap: () => CustomNavigator.push(Routes.SALARIES_AND_FINANCIAL)
                // ),

                MoreNavigateCard(
                    name: getTranslated("documents", context),
                    iconAsset: Images.documentsIcon,
                    onTap: () => CustomNavigator.push(Routes.DOCUMENTS)),

                MoreNavigateCard(
                    name: getTranslated("covenant", context),
                    iconAsset: Images.assetsIcon,
                    onTap: () => CustomNavigator.push(Routes.ASSETS)),

                MoreNavigateCard(
                  name: getTranslated("contract", context),
                  iconAsset: Images.contractIcon,
                //   onTap: () =>
                //       showToast(getTranslated("not_supported_yet", context)),
                // ),

                onTap: () => CustomNavigator.push(Routes.CONTRACT)),

                SizedBox(height: 80.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
