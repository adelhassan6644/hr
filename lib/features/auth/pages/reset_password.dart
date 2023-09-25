import 'package:flutter/material.dart';
import 'package:hr_project/app/core/extensions.dart';
import 'package:hr_project/app/core/svg_images.dart';
import 'package:provider/provider.dart';

import '../../../app/core/color_resources.dart';
import '../../../app/core/constant.dart';
import '../../../app/core/dimensions.dart';
import '../../../app/core/validation.dart';
import '../../../app/localization/localization/language_constant.dart';
import '../../../components/animated_widget.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_text_form_field.dart';
import '../provider/auth_provider.dart';
import '../widgets/auth_header_widget.dart';
import '../widgets/title_header_widget.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        ///Header
        const LoginHeaderWidget(withBack: true),

        ///Body
        Consumer<AuthProvider>(builder: (child, provider, _) {
          return Expanded(
            child: ListAnimator(
              customPadding: EdgeInsets.symmetric(
                  horizontal: Dimensions.PADDING_SIZE_DEFAULT.w),
              data: [
                TitleHeaderWidget(
                  title: getTranslated("reset_password", context),
                  subTitle:
                      getTranslated("reset_password_description", context),
                ),
                Form(
                  key: key,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(getTranslated("new_password", context),
                          style: titleTextStyle.copyWith(
                              color: Styles.PRIMARY_COLOR)),
                      CustomTextFormField(
                        valid: Validations.password,
                        isPassword: true,
                        controller: provider.newPasswordTEC,
                        hint: getTranslated("enter_new_password", context),
                        pSvgIcon: SvgImages.lockIcon,
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Text(getTranslated("confirm_password", context),
                          style: titleTextStyle.copyWith(
                              color: Styles.PRIMARY_COLOR)),
                      CustomTextFormField(
                        isPassword: true,
                        controller: provider.confirmPasswordTEC,
                        hint:
                            getTranslated("enter_new_password_again", context),
                        valid: (v) => Validations.confirmNewPassword(
                            provider.newPasswordTEC.text.trim(), v),
                        pSvgIcon: SvgImages.lockIcon,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35.h,
                ),
                CustomButton(
                    isLoading: provider.isLoading,
                    onTap: () {
                      key.currentState!.save();
                      if (key.currentState!.validate()) {
                        provider.resetPassword();
                      }
                    },
                    text: getTranslated("confirm", context),
                    backgroundColor: Styles.PRIMARY_COLOR),
              ],
            ),
          );
        }),
      ],
    ));
  }
}
