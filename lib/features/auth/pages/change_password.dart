import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import 'package:yusrPlus/components/animated_widget.dart';
import 'package:provider/provider.dart';
import '../../../app/core/color_resources.dart';
import '../../../app/core/constant.dart';
import '../../../app/core/dimensions.dart';
import '../../../app/core/svg_images.dart';
import '../../../app/core/validation.dart';
import '../../../app/localization/language_constant.dart';
import '../../../components/custom_app_bar.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_text_form_field.dart';
import '../provider/auth_provider.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.BACKGROUND_COLOR,
      appBar: CustomAppBar(
        title: getTranslated("change_password", context),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListAnimator(
              customPadding: EdgeInsets.symmetric(
                  horizontal: Dimensions.PADDING_SIZE_DEFAULT.w,
                  vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
              data: [
                Consumer<AuthProvider>(builder: (child, provider, _) {
                  return Form(
                    key: key,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        ///Current Password
                        Text(getTranslated("password", context),
                            style: titleTextStyle.copyWith(
                                color: Styles.PRIMARY_COLOR)),
                        CustomTextFormField(
                          isPassword: true,
                          pSvgIcon: SvgImages.lockIcon,
                          controller: provider.currentPasswordTEC,
                          hint: getTranslated("enter_your_password", context),
                          valid: Validations.password,
                        ),
                        SizedBox(
                          height: 24.h,
                        ),

                        ///New Password
                        Text(getTranslated("new_password", context),
                            style: titleTextStyle.copyWith(
                                color: Styles.PRIMARY_COLOR)),
                        CustomTextFormField(
                          isPassword: true,
                          pSvgIcon: SvgImages.lockIcon,
                          controller: provider.newPasswordTEC,
                          hint: getTranslated("enter_new_password", context),
                          valid: (v) => Validations.newPassword(
                              provider.currentPasswordTEC.text.trim(), v),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),

                        ///Confirm Password
                        Text(getTranslated("confirm_password", context),
                            style: titleTextStyle.copyWith(
                                color: Styles.PRIMARY_COLOR)),
                        CustomTextFormField(
                          isPassword: true,
                          pSvgIcon: SvgImages.lockIcon,
                          controller: provider.confirmPasswordTEC,
                          hint: getTranslated(
                              "enter_new_password_again", context),
                          valid: (v) => Validations.confirmNewPassword(
                              provider.newPasswordTEC.text.trim(), v),
                        ),

                        ///Update Password
                        SizedBox(
                          height: 24.h,
                        ),
                        CustomButton(
                            isLoading: provider.isChange,
                            onTap: () {
                              key.currentState!.save();
                              if (key.currentState!.validate()) {
                                provider.changePassword();
                              }
                            },
                            textColor: Styles.WHITE,
                            text: getTranslated("confirm", context),
                            backgroundColor: Styles.PRIMARY_COLOR),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
