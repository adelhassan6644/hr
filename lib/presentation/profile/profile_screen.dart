import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hr_project/app/core/utils/constant.dart';
import 'package:hr_project/app/core/utils/media_query_values.dart';
import 'package:hr_project/domain/localization/language_constant.dart';
import 'package:hr_project/presentation/notifier/profile_provider.dart';
import 'package:hr_project/presentation/profile/units/profile_units.dart';
import 'package:provider/provider.dart';
import '../../app/core/utils/color_resources.dart';
import '../../app/core/utils/images.dart';
import '../settings/settings_screen.dart';

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
      return ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          profileCard(
              name: profileProvider.name,
              description: profileProvider.description,
              profileImage: profileProvider.profileImage,
              onTap: () {Navigator.of(context).push(MaterialPageRoute(builder:(context)=>const SettingsScreen()));}),
          annualLeaveBalance(onTap: () {}, days: 33.5, context: context),
          Container(
            width: context.width,
            height: 1,
            color: ColorResources.borderColor,
          ),
          settingCard(
              name: getTranslated("personal", context),
              iconAsset: Images.personalCardIcon,
              onTap: () {}),
          Container(
            width: context.width,
            height: 1,
            color: ColorResources.borderColor,
          ),
          settingCard(
              name: getTranslated("organization", context),
              iconAsset: Images.organizationIcon,
              onTap: () {}),
          Container(
            width: context.width,
            height: 1,
            color: ColorResources.borderColor,
          ),
          settingCard(
              name: getTranslated("salary_&_financial", context),
              iconAsset: Images.salaryIcon,
              onTap: () {}),
          Container(
            width: context.width,
            height: 1,
            color: ColorResources.borderColor,
          ),
          settingCard(
              name: getTranslated("documents", context),
              iconAsset: Images.documentsIcon,
              onTap: () {}),
          Container(
            width: context.width,
            height: 1,
            color: ColorResources.borderColor,
          ),
          settingCard(
              name: getTranslated("assets", context),
              iconAsset: Images.assetsIcon,
              onTap: () {}),
          Container(
            width: context.width,
            height: 1,
            color: ColorResources.borderColor,
          ),
          settingCard(
              name: getTranslated("contract", context),
              iconAsset: Images.contractIcon,
              onTap: () {}),
          Container(
            width: context.width,
            height: 1,
            color: ColorResources.borderColor,
          ),
        ],
      );
    });
  }
}
