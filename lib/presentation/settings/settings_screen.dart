import 'package:flutter/material.dart';
import 'package:hr_project/app/core/utils/media_query_values.dart';
import 'package:hr_project/presentation/auth/login_screen.dart';
import 'package:hr_project/presentation/base/custom_app_bar.dart';
import '../../app/core/utils/color_resources.dart';
import '../../app/core/utils/constant.dart';
import '../../app/core/utils/images.dart';
import '../../domain/localization/language_constant.dart';
import '../profile/units/profile_units.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: getTranslated("settings", context),
        titleCenter: true,
      ) ,
      body:Column(children: [
        Container(
          width: context.width,
          height: 1,
          color: ColorResources.borderColor,
        ),
        settingCard(
            name: getTranslated("language", context),
            iconAsset: Images.languageIcon,
            onTap: () {}),
        Container(
          width: context.width,
          height: 1,
          color: ColorResources.borderColor,
        ),
        settingCard(
            name: getTranslated("change_password", context),
            iconAsset: Images.lockIcon,
            onTap: () {}),
        Container(
          width: context.width,
          height: 1,
          color: ColorResources.borderColor,
        ),
        const Spacer(),
        TextButton(onPressed: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const LoginScreen()));
        }, child: Text(getTranslated("log_out", context),style: titleTextStyle.copyWith(
          fontSize: 18,
            color: ColorResources.redColor),)),
        const SizedBox(height: 20,)
      ],) ,
    );
  }
}
