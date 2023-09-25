import 'package:flutter/material.dart';
import 'package:hr_project/app/core/extensions.dart';
import 'package:hr_project/components/custom_bottom_sheet.dart';
import 'package:hr_project/navigation/custom_navigation.dart';
import 'package:provider/provider.dart';
import '../../app/core/color_resources.dart';
import '../../app/core/constant.dart';
import '../../app/core/dimensions.dart';
import '../../app/core/images.dart';
import '../../app/localization/localization/language_constant.dart';
import '../../app/localization/provider/localization_provider.dart';
import '../../components/custom_app_bar.dart';
import '../../navigation/routes.dart';
import '../auth/provider/auth_provider.dart';
import '../profile/widgets/profile_units.dart';
import 'widget/language_bottom_sheet.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: getTranslated("settings", context),
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT.w),
        child: Column(
          children: [
            Container(
              width: context.width,
              height: 1,
              color: Styles.BORDER_COLOR,
            ),
            Consumer<LocalizationProvider>(
                builder: (child, localizationProvider, _) {
              return settingCard(
                name: getTranslated("language", context),
                iconAsset: Images.languageIcon,
                onTap: () =>
                    CustomBottomSheet.show(list: const LanguageBottomSheet()),
              );
            }),
            Container(
              width: context.width,
              height: 1,
              color: Styles.BORDER_COLOR,
            ),
            settingCard(
                name: getTranslated("change_password", context),
                iconAsset: Images.lockIcon,
                onTap: () => CustomNavigator.push(Routes.CHANGE_PASSWORD)),
            Container(
              width: context.width,
              height: 1,
              color: Styles.BORDER_COLOR,
            ),
            const Spacer(),
            Consumer<AuthProvider>(builder: (context, authProvider, widget) {
              return TextButton(
                  onPressed: () => authProvider.logOut(),
                  child: Text(
                    getTranslated("log_out", context),
                    style: titleTextStyle.copyWith(
                        fontSize: 18, color: Styles.WARNING_COLOR),
                  ));
            }),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
