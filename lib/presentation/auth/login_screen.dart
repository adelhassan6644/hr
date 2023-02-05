import 'package:flutter/material.dart';
import 'package:hr_project/app/core/utils/dimensions.dart';
import 'package:hr_project/app/core/utils/extensions.dart';
import 'package:hr_project/presentation/auth/forget_password_screen.dart';
import 'package:hr_project/presentation/base/custom_button.dart';
import 'package:hr_project/presentation/notifier/auth_provider.dart';
import 'package:provider/provider.dart';
import '../../app/core/utils/color_resources.dart';
import '../../app/core/utils/constant.dart';
import '../../app/core/utils/validation.dart';
import '../../domain/localization/language_constant.dart';
import '../base/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.BACKGROUND_COLOR,
      body: Column(
        children: [

          Container(
            width: context.width,
            height: context.height*0.25,
            padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
            decoration: const BoxDecoration(
              color: ColorResources.primary,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),

              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height:MediaQuery.of(context).systemGestureInsets.top),
                Text(getTranslated("welcome", context),
                    style: headLineTextStyle.copyWith(color: Colors.white)),
                const SizedBox(
                  height: 10,
                ),
                Text(getTranslated("sign_in", context),
                    style: headLineTextStyle.copyWith(color: Colors.white)),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Expanded(
            child: Consumer<AuthProvider>(builder: (child, authProvider, _) {
              return Padding(
                padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Text(getTranslated("email_or_id", context),
                            style: titleTextStyle.copyWith(
                                color: ColorResources.primary)),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomTextFormField(
                          controller: authProvider.emailTEC,
                          hint: getTranslated(
                              "enter_your_email_or_id", context),
                          valid: Validations.email,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(getTranslated("password", context),
                            style: titleTextStyle.copyWith(
                                color: ColorResources.primary)),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomTextFormField(
                          controller: authProvider.passwordTEC,
                          hint: getTranslated("enter_your_password", context),
                          valid: Validations.password,
                          icon: Icons.lock_outline,
                          removePIcon: false, // removePIcon: true,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const ForgetPasswordScreen()));
                              },
                              child: Text(
                                  getTranslated("forget_password", context),
                                  style: titleTextStyle.copyWith(
                                      color: ColorResources.primary)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: context.height * 0.15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                      child: CustomButton(
                          onTap: () {
                            authProvider.logIn(context);
                          },
                          textColor: ColorResources.whiteColor,
                          text: getTranslated("sign_in", context),
                          backgroundColor: ColorResources.primary),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
