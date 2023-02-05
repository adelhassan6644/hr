import 'package:flutter/material.dart';
import 'package:hr_project/app/core/utils/extensions.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import '../../app/core/utils/color_resources.dart';
import '../../app/core/utils/constant.dart';
import '../../app/core/utils/dimensions.dart';
import '../../domain/localization/language_constant.dart';
import '../base/custom_app_bar.dart';
import '../base/custom_button.dart';
import '../notifier/auth_provider.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.BACKGROUND_COLOR,
      appBar: CustomAppBar(
        title: getTranslated("verify_the_email", context),
        titleCenter: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
        child: Consumer<AuthProvider>(builder: (child, authProvider, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: context.height * 0.05,
              ),
              // Text(getTranslated("enter_verification_code", context),
              //     style: titleTextStyle.copyWith(
              //       fontSize: 18,
              //         fontWeight: FontWeight.w600,
              //         color: ColorResources.blackColor)),
              // const SizedBox(
              //   height: 20,
              // ),
              Text(getTranslated("please_enter_verification_code", context),
                  style: titleTextStyle.copyWith(
                      fontWeight: FontWeight.w600,
                      color: ColorResources.blackColor,
                      fontSize: 16)),
              const SizedBox(
                height: 20,
              ),
              Pinput(
                keyboardType: TextInputType.phone,
                useNativeKeyboard: true,
                closeKeyboardWhenCompleted: true,
                keyboardAppearance: Brightness.light,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: defaultPinTheme,
                submittedPinTheme: submittedPinTheme,
                pinputAutovalidateMode: PinputAutovalidateMode.disabled,
                showCursor: true,
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {},
                child: Text(getTranslated("send_the_code_again", context),
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: ColorResources.primary)),
              ),
              SizedBox(
                height: context.height * 0.07,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                child: CustomButton(
                    onTap: () {
                      authProvider.sendOTP(context: context);
                    },
                    textColor: ColorResources.whiteColor,
                    text: getTranslated("send_otp", context),
                    backgroundColor: ColorResources.primary),
              ),
            ],
          );
        }),
      ),
    );
  }
}
