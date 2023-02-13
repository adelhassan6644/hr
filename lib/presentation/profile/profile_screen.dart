import 'package:flutter/material.dart';
import 'package:hr_project/app/core/utils/extensions.dart';
import 'package:hr_project/domain/localization/language_constant.dart';
import 'package:hr_project/navigation/custom_navigation.dart';
import 'package:hr_project/presentation/notifier/profile_provider.dart';
import 'package:hr_project/presentation/profile/units/profile_units.dart';
import 'package:provider/provider.dart';
import '../../app/core/utils/color_resources.dart';
import '../../app/core/utils/dimensions.dart';
import '../../app/core/utils/images.dart';
import '../../navigation/routes.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
        builder: (context, profileProvider, widget) {
      return Padding(
        padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            // SizedBox(height:CustomNavigator.scaffoldState.currentContext!.topPadding ),
            profileCard(
                name: profileProvider.name,
                description: profileProvider.description,
                profileImage: profileProvider.profileImage,
                onTap: () =>CustomNavigator.push(Routes.SETTINGS)
            ),
            annualLeaveBalance(onTap: () {}, days: 33.5, context: context),
            settingCard(
                name: getTranslated("personal", context),
                iconAsset: Images.personalCardIcon,
                onTap: () =>CustomNavigator.push(Routes.PERSONAL)
            ),
            Container(
              width: context.width,
              height: 0.5,
              color: ColorResources.BORDER_COLOR,
            ),
            settingCard(
                name: getTranslated("organization", context),
                iconAsset: Images.organizationIcon,
                onTap: (){}
            ),
            Container(
              width: context.width,
              height: 0.5,
              color: ColorResources.BORDER_COLOR,
            ),
            settingCard(
                name: getTranslated("salary_&_financial", context),
                iconAsset: Images.salaryIcon,
                onTap: () => CustomNavigator.push(Routes.SALARIES_AND_FINANCIAL)
            ),
            Container(
              width: context.width,
              height: 0.5,
              color: ColorResources.BORDER_COLOR,
            ),
            settingCard(
                name: getTranslated("documents", context),
                iconAsset: Images.documentsIcon,
                onTap: () {}),
            Container(
              width: context.width,
              height: 0.5,
              color: ColorResources.BORDER_COLOR,
            ),
            settingCard(
                name: getTranslated("assets", context),
                iconAsset: Images.assetsIcon,
                onTap: () {}),
            Container(
              width: context.width,
              height: 0.5,
              color: ColorResources.BORDER_COLOR,
            ),
            settingCard(
                name: getTranslated("contract", context),
                iconAsset: Images.contractIcon,
                onTap: () {}),
            Container(
              width: context.width,
              height: 0.5,
              color: ColorResources.BORDER_COLOR,
            ),
          ],
        ),
      );
    });
  }
}

