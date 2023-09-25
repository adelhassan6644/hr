import 'package:flutter/material.dart';
import 'package:hr_project/app/core/extensions.dart';
import 'package:provider/provider.dart';
import '../../../app/core/color_resources.dart';
import '../../../app/core/constant.dart';
import '../../../app/core/dimensions.dart';
import '../../../app/core/validation.dart';
import '../../../app/localization/localization/language_constant.dart';
import '../../../components/custom_app_bar.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_text_form_field.dart';
import '../provider/auth_provider.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.BACKGROUND_COLOR,
      appBar: CustomAppBar(
        title: getTranslated("forget_password", context),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: 25.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.h),
              child:
                  Text(getTranslated("please_enter_your_email_or_id", context),
                      textAlign: TextAlign.center,
                      style: titleTextStyle.copyWith(
                        color: Styles.PRIMARY_COLOR,
                        fontSize: 13,
                      )),
            ),
            Consumer<AuthProvider>(builder: (child, authProvider, _) {
              return Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 35.h,
                    ),
                    Text(getTranslated("email_or_id", context),
                        style: titleTextStyle.copyWith(
                            color: Styles.PRIMARY_COLOR)),
                    SizedBox(
                      height: 15.h,
                    ),
                    CustomTextFormField(
                      controller: authProvider.emailTEC,
                      hint: getTranslated("enter_your_email_or_id", context),
                      valid: Validations.email,
                    ),
                    SizedBox(
                      height: context.height * 0.1,
                    ),
                    Center(
                      child: CustomButton(
                          isLoading: authProvider.isLoading,
                          isError: authProvider.isError,
                          onTap: () {
                            formKey.currentState!.save();
                            if (formKey.currentState!.validate()) {
                              authProvider.getOTP();
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