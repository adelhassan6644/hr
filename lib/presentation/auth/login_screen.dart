import 'package:flutter/material.dart';
import 'package:hr_project/app/core/utils/app_colors.dart';
import 'package:hr_project/app/core/utils/dimensions.dart';
import 'package:hr_project/app/core/utils/media_query_values.dart';
import 'package:hr_project/presentation/base/custom_button.dart';
import 'package:hr_project/presentation/notifier/auth_provider.dart';
import 'package:provider/provider.dart';

import '../../app/core/utils/color_resources.dart';
import '../../app/core/utils/constant.dart';
import '../../app/core/utils/validation.dart';
import '../../domain/localization/language_constant.dart';
import '../base/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {

  static const route = "/logInScreen";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                return Container(
                  decoration: const BoxDecoration(
                    color: ColorResources.whiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                  child: ListView(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: context.height*0.05,),
                          Text(getTranslated("email_or_id", context),
                              style: titleTextStyle.copyWith(
                                  color: ColorResources.primary)),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomTextFormField(
                            controller: authProvider.emailTEC,
                            hint: getTranslated("enter_your_email_or_id", context),
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
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Text(getTranslated("forgot_password", context),
                                    style: titleTextStyle.copyWith(
                                        color: ColorResources.redColor)),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: context.height*0.25,),
                      CustomButton(
                        onTap: (){
                          authProvider.logIn(context);
                        },
                          textColor: ColorResources.whiteColor,
                          text: getTranslated("sign_in", context),
                          backgroundColor: ColorResources.primary),

                    ],
                  ),
                );
              }),
            ),],
        ),
      ),
    );
  }
}
