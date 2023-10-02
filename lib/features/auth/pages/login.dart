import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import 'package:yusrPlus/components/animated_widget.dart';
import 'package:yusrPlus/navigation/custom_navigation.dart';
import 'package:yusrPlus/navigation/routes.dart';
import 'package:provider/provider.dart';
import '../../../app/core/color_resources.dart';
import '../../../app/core/constant.dart';
import '../../../app/core/dimensions.dart';
import '../../../app/core/svg_images.dart';
import '../../../app/core/validation.dart';
import '../../../app/localization/language_constant.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_text_form_field.dart';
import '../provider/auth_provider.dart';
import '../widgets/auth_header_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AuthHeaderWidget(),

          ///Body
          Consumer<AuthProvider>(builder: (child, authProvider, _) {
            return Expanded(
              child: ListAnimator(
                customPadding: EdgeInsets.symmetric(
                    horizontal: Dimensions.PADDING_SIZE_DEFAULT.w),
                data: [
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 24.h,
                        ),
                        Text(getTranslated("email_or_id", context),
                            style: titleTextStyle.copyWith(
                                color: Styles.PRIMARY_COLOR)),
                        CustomTextFormField(
                          controller: authProvider.emailTEC,
                          hint:
                              getTranslated("enter_your_email_or_id", context),
                          valid: Validations.email,
                          pSvgIcon: SvgImages.mailIcon,
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Text(getTranslated("password", context),
                            style: titleTextStyle.copyWith(
                                color: Styles.PRIMARY_COLOR)),
                        CustomTextFormField(
                          isPassword: true,
                          pSvgIcon: SvgImages.lockIcon,
                          controller: authProvider.passwordTEC,
                          hint: getTranslated("enter_your_password", context),
                          valid: Validations.password,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () =>
                                  CustomNavigator.push(Routes.FORGET_PASSWORD),
                              child: Text(
                                  getTranslated("forget_password", context),
                                  style: titleTextStyle.copyWith(
                                      color: Styles.PRIMARY_COLOR)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  CustomButton(
                      isLoading: authProvider.isLoading,
                      onTap: () {
                        formKey.currentState!.save();
                        if (formKey.currentState!.validate()) {
                          authProvider.logIn();
                          // CustomNavigator.push(Routes.DASHBOARD, clean: true);
                        }
                      },
                      textColor: Styles.WHITE,
                      text: getTranslated("sign_in", context),
                      backgroundColor: Styles.PRIMARY_COLOR),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
