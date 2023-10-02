import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import 'package:yusrPlus/components/custom_bottom_sheet.dart';
import 'package:yusrPlus/navigation/custom_navigation.dart';
import 'package:provider/provider.dart';
import '../../../app/core/app_storage_keys.dart';
import '../../../app/core/color_resources.dart';
import '../../../app/core/constant.dart';
import '../../../app/core/dimensions.dart';
import '../../../app/core/images.dart';
import '../../../app/localization/language_constant.dart';
import '../../language/provider/localization_provider.dart';
import '../../../components/custom_app_bar.dart';
import '../../../navigation/routes.dart';
import '../../auth/provider/auth_provider.dart';
import '../../more/widget/more_navigate_card.dart';
import '../../language/page/language_bottom_sheet.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LocalizationProvider>(
        builder: (_, localizationProvider, child) {
      return Scaffold(
        appBar: CustomAppBar(
          title: getTranslated("settings", context),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.PADDING_SIZE_DEFAULT.w),
            child: Column(
              children: [
                ///Language
                MoreNavigateCard(
                  name: getTranslated("language", context),
                  iconAsset: Images.languageIcon,
                  onTap: () => CustomBottomSheet.show(
                      height: 350,
                      list: const LanguageBottomSheet(),
                      label: getTranslated("select_language", context),
                      onConfirm: () {
                        CustomNavigator.pop();
                        localizationProvider.setLanguage(
                          Locale(
                            AppStorageKey
                                .languages[localizationProvider.selectIndex]
                                .languageCode!,
                            AppStorageKey
                                .languages[localizationProvider.selectIndex]
                                .countryCode,
                          ),
                        );
                      }),
                ),

                ///Change Password
                MoreNavigateCard(
                    name: getTranslated("change_password", context),
                    iconAsset: Images.lockIcon,
                    onTap: () => CustomNavigator.push(Routes.CHANGE_PASSWORD)),
                const Spacer(),
                Consumer<AuthProvider>(
                    builder: (context, authProvider, widget) {
                  return Padding(
                    padding: EdgeInsets.only(
                        bottom: Dimensions.PADDING_SIZE_DEFAULT.h),
                    child: TextButton(
                        onPressed: () => authProvider.logOut(),
                        child: Text(
                          getTranslated("log_out", context),
                          style: titleTextStyle.copyWith(
                              fontSize: 18, color: Styles.WARNING_COLOR),
                        )),
                  );
                }),
              ],
            ),
          ),
        ),
      );
    });
  }
}
