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

class EditPasswordScreen extends StatefulWidget {
  const EditPasswordScreen({Key? key}) : super(key: key);

  @override
  State<EditPasswordScreen> createState() => _EditPasswordScreenState();
}

class _EditPasswordScreenState extends State<EditPasswordScreen> {
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
                Consumer<AuthProvider>(builder: (child, authProvider, _) {
                  return Form(
                    key: key,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(getTranslated("password", context),
                            style: titleTextStyle.copyWith(
                                color: Styles.PRIMARY_COLOR)),
                        CustomTextFormField(
                          isPassword: true,
                          pSvgIcon: SvgImages.lockIcon,
                          controller: authProvider.currentPasswordTEC,
                          hint: getTranslated("enter_your_password", context),
                          valid: Validations.password,
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Text(getTranslated("new_password", context),
                            style: titleTextStyle.copyWith(
                                color: Styles.PRIMARY_COLOR)),
                        CustomTextFormField(
                          isPassword: true,
                          pSvgIcon: SvgImages.lockIcon,
                          controller: authProvider.newPasswordTEC,
                          hint: getTranslated("enter_new_password", context),
                          valid: (v) => Validations.newPassword(
                              authProvider.currentPasswordTEC.text.trim(), v),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Text(getTranslated("confirm_password", context),
                            style: titleTextStyle.copyWith(
                                color: Styles.PRIMARY_COLOR)),
                        CustomTextFormField(
                          isPassword: true,
                          pSvgIcon: SvgImages.lockIcon,
                          controller: authProvider.confirmPasswordTEC,
                          hint: getTranslated(
                              "enter_new_password_again", context),
                          valid: (v) => Validations.confirmNewPassword(
                              authProvider.newPasswordTEC.text.trim(), v),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        CustomButton(
                            isLoading: authProvider.isChange,
                            onTap: () {
                              key.currentState!.save();
                              if (key.currentState!.validate()) {
                                authProvider.changePassword();
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
