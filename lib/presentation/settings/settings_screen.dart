import 'package:flutter/material.dart';
import 'package:hr_project/app/core/utils/extensions.dart';
import 'package:hr_project/presentation/auth/login_screen.dart';
import 'package:hr_project/presentation/base/custom_app_bar.dart';
import 'package:hr_project/presentation/settings/edit_password_screen.dart';
import 'package:provider/provider.dart';
import '../../app/core/utils/color_resources.dart';
import '../../app/core/utils/constant.dart';
import '../../app/core/utils/images.dart';
import '../../domain/localization/language_constant.dart';
import '../notifier/localization_provider.dart';
import '../profile/units/profile_units.dart';
import 'language_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: getTranslated("settings", context),
        titleCenter: true,
      ),
      body: Column(
        children: [
          Container(
            width: context.width,
            height: 1,
            color: ColorResources.BORDER_COLOR,
          ),
          Consumer<LocalizationProvider>(builder: (child, localizationProvider, _) {
            return settingCard(
              name: getTranslated("language", context),
              iconAsset: Images.languageIcon,
              onTap: ()  {
                localizationProvider.bottomSheetMode();
                showModalBottomSheet(
                  elevation: 1,
                  shape:  const RoundedRectangleBorder(
                    // side: BorderSide(
                    //   width: 1,
                    //   color: ColorResources.borderColor ,
                    //   style: BorderStyle.solid
                    // ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),

                    ),
                  ),
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return const LanguageScreen();
                  },
                ).then((value) async {
                  localizationProvider.nonBottomSheetMode();
                });
              },
            );
          }),
          Container(
            width: context.width,
            height: 1,
            color: ColorResources.BORDER_COLOR,
          ),
          settingCard(
              name: getTranslated("change_password", context),
              iconAsset: Images.lockIcon,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const EditPasswordScreen()));
              }),
          Container(
            width: context.width,
            height: 1,
            color: ColorResources.BORDER_COLOR,
          ),
          const Spacer(),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const LoginScreen()));
              },
              child: Text(
                getTranslated("log_out", context),
                style: titleTextStyle.copyWith(
                    fontSize: 18, color: ColorResources.WARNING_COLOR),
              )),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
