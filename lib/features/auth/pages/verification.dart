import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import 'package:provider/provider.dart';
import '../../../app/core/color_resources.dart';
import '../../../app/core/dimensions.dart';
import '../../../app/core/validation.dart';
import '../../../app/localization/language_constant.dart';
import '../../../components/animated_widget.dart';
import '../../../components/count_down.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_pin_code_field.dart';
import '../provider/auth_provider.dart';
import '../widgets/auth_header_widget.dart';
import '../widgets/title_header_widget.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
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
                    title: getTranslated("verify_the_email", context),
                    subTitle: getTranslated(
                        "please_enter_verification_code", context),
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 12.h,
                          ),
                          child: Directionality(
                              textDirection: TextDirection.ltr,
                              child: CustomPinCodeField(
                                  validation: Validations.code,
                                  controller: provider.codeTEC,
                                  onChanged: (v) {})),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CountDown(
                              onCount: () => provider.resend(),
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
                      isLoading: provider.isVerify,
                      onTap: () {
                        formKey.currentState!.save();
                        if (formKey.currentState!.validate()) {
                          provider.verify();
                        }
                      },
                      textColor: Styles.WHITE,
                      text: getTranslated("submit", context),
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
