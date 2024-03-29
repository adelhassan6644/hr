import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import 'package:yusrPlus/app/core/svg_images.dart';
import 'package:provider/provider.dart';
import '../../../app/core/color_resources.dart';
import '../../../app/core/constant.dart';
import '../../../app/core/dimensions.dart';
import '../../../app/core/validation.dart';
import '../../../app/localization/language_constant.dart';
import '../../../components/animated_widget.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_text_form_field.dart';
import '../provider/auth_provider.dart';
import '../widgets/auth_header_widget.dart';
import '../widgets/title_header_widget.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AuthHeaderWidget(withBack: true),

          ///Body
          Consumer<AuthProvider>(builder: (child, provider, _) {
            return Expanded(
              child: ListAnimator(
                customPadding: EdgeInsets.symmetric(
                    horizontal: Dimensions.PADDING_SIZE_DEFAULT.w),
                data: [
                  TitleHeaderWidget(
                    title: getTranslated("forget_password", context),
                    subTitle:
                        getTranslated("please_enter_your_email_or_id", context),
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(getTranslated("email_or_id", context),
                            style: titleTextStyle.copyWith(
                                color: Styles.PRIMARY_COLOR)),
                        CustomTextFormField(
                          controller: provider.emailTEC,
                          hint: getTranslated("enter_your_email_or_id", context),
                          valid: Validations.email,
                          pSvgIcon: SvgImages.mailIcon,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  CustomButton(
                      isLoading: provider.isForget,
                      onTap: () {
                        formKey.currentState!.save();
                        if (formKey.currentState!.validate()) {
                          provider.forgetPassword();
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
    );
  }
}
