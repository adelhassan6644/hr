import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hr_project/app/core/extensions.dart';
import 'package:hr_project/navigation/custom_navigation.dart';
import 'package:hr_project/navigation/routes.dart';
import 'package:provider/provider.dart';
import '../../../app/core/color_resources.dart';
import '../../../app/core/constant.dart';
import '../../../app/core/dimensions.dart';
import '../../../app/core/images.dart';
import '../../../app/core/validation.dart';
import '../../../app/localization/localization/language_constant.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_text_form_field.dart';
import '../provider/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: key,
        child: Column(
          children: [
            Container(
              width: context.width,
              height: context.height * 0.30,
              padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
              decoration: const BoxDecoration(
                color: ColorResources.PRIMARY,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).padding.top),
                  FittedBox(
                    child: Center(
                      child: Image.asset(
                        Images.logo,
                        height: context.height * 0.20,
                        width: context.width,
                      ),
                    ),
                  ),
                  // Text(getTranslated("welcome", context),
                  //     style: headLineTextStyle.copyWith(color: Colors.white)),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // Text(getTranslated("sign_in", context),
                  //     style: headLineTextStyle.copyWith(color: Colors.white)),
                ],
              ),
            ).animate().moveY(
                  delay: 300.ms,
                  duration: 600.ms,
                ),
            Consumer<AuthProvider>(builder: (child, authProvider, _) {
              return Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                  child: ListView(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 25.h,
                          ),
                          Text(getTranslated("email_or_id", context),
                              style: titleTextStyle.copyWith(
                                  color: ColorResources.PRIMARY)),
                          SizedBox(
                            height: 15.h,
                          ),
                          CustomTextFormField(
                            controller: authProvider.emailTEC,
                            hint: getTranslated(
                                "enter_your_email_or_id", context),
                            valid: Validations.email,
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Text(getTranslated("password", context),
                              style: titleTextStyle.copyWith(
                                  color: ColorResources.PRIMARY)),
                          SizedBox(
                            height: 15.h,
                          ),
                          CustomTextFormField(
                            isPassword: true,
                            controller: authProvider.passwordTEC,
                            hint: getTranslated("enter_your_password", context),
                            valid: Validations.password,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () => CustomNavigator.push(
                                    Routes.FORGET_PASSWORD),
                                child: Text(
                                    getTranslated("forget_password", context),
                                    style: titleTextStyle.copyWith(
                                        color: ColorResources.PRIMARY)),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 35.h,
                      ),
                      CustomButton(
                          isLoading: authProvider.isLoading,
                          isError: authProvider.isError,
                          onTap: () {
                            key.currentState!.save();
                            if (key.currentState!.validate()) {
                              authProvider.logIn();
                            }
                          },
                          textColor: ColorResources.WHITE,
                          text: getTranslated("sign_in", context),
                          backgroundColor: ColorResources.PRIMARY),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
