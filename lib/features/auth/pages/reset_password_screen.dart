import 'package:flutter/material.dart';
import 'package:hr_project/app/core/extensions.dart';
import 'package:provider/provider.dart';

import '../../../app/core/color_resources.dart';
import '../../../app/core/constant.dart';
import '../../../app/core/dimensions.dart';
import '../../../app/core/images.dart';
import '../../../app/core/validation.dart';
import '../../../app/localization/localization/language_constant.dart';
import '../../../components/custom_app_bar.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_text_form_field.dart';
import '../provider/auth_provider.dart';

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
      backgroundColor: Styles.BACKGROUND_COLOR,
      appBar: CustomAppBar(
        title: getTranslated("reset_password", context),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
        child: ListView(
          children: [
            Consumer<AuthProvider>(builder: (child, authProvider, _) {
              return Form(
                key: key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 25.h,
                    ),
                    Text(getTranslated("new_password", context),
                        style: titleTextStyle.copyWith(
                            color: Styles.PRIMARY_COLOR)),
                    SizedBox(
                      height: 15.h,
                    ),
                    CustomTextFormField(
                      pAssetIcon: Images.lockIcon,
                      valid: Validations.password,
                      isPassword: true,
                      controller: authProvider.newPasswordTEC,
                      hint: getTranslated("enter_new_password", context),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Text(getTranslated("confirm_password", context),
                        style: titleTextStyle.copyWith(
                            color: Styles.PRIMARY_COLOR)),
                    SizedBox(
                      height: 15.h,
                    ),
                    CustomTextFormField(
                      isPassword: true,
                      valid: (String? value) {
                        if (value!.isEmpty) {
                          return getTranslated("required", context);
                        } else if (authProvider.confirmPasswordTEC.text
                                .trim() !=
                            authProvider.newPasswordTEC.text.trim()) {
                          return "The confirmation password doesn't match the new password";
                        } else {
                          return null;
                        }
                      },
                      controller: authProvider.confirmPasswordTEC,
                      hint: getTranslated("enter_new_password_again", context),
                    ),
                    SizedBox(
                      height: 35.h,
                    ),
                    Center(
                      child: CustomButton(
                          isLoading: authProvider.isLoading,
                          isError: authProvider.isError,
                          onTap: () {
                            key.currentState!.save();
                            if (key.currentState!.validate()) {
                              authProvider.resetPassword();
                            }
                          },
                          textColor: Styles.WHITE,
                          text: getTranslated("confirm", context),
                          backgroundColor: Styles.PRIMARY_COLOR),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
