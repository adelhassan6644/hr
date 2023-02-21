import 'package:flutter/material.dart';
import 'package:hr_project/app/core/utils/extensions.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import '../../app/core/utils/color_resources.dart';
import '../../app/core/utils/constant.dart';
import '../../app/core/utils/dimensions.dart';
import '../../app/core/utils/validation.dart';
import '../../domain/localization/language_constant.dart';
import '../base/count_down.dart';
import '../base/custom_app_bar.dart';
import '../base/custom_button.dart';
import '../notifier/auth_provider.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isValid = true;

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
          return Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: context.height * 0.05,
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 24.h),
                  child: Text(getTranslated("please_enter_verification_code", context),
                      textAlign: TextAlign.center,
                      style: titleTextStyle.copyWith(
                          fontWeight: FontWeight.w600,
                          color: ColorResources.PRIMARY,
                          fontSize: 16)),
                ),
                 SizedBox(
                  height: 20.h,
                ),
                Pinput(
                  keyboardType: TextInputType.phone,
                  // obscureText: true,
                  // obscuringCharacter: "*",
                  pinContentAlignment: Alignment.center,
                  controller: authProvider.codeTEC,
                  closeKeyboardWhenCompleted: true,
                  keyboardAppearance: Brightness.light,
                  defaultPinTheme: defaultPinTheme,
                  useNativeKeyboard: true,
                  focusedPinTheme: defaultPinTheme,
                  submittedPinTheme: submittedPinTheme,
                  pinputAutovalidateMode: PinputAutovalidateMode.disabled,
                  showCursor: true,
                  onChanged: (String? value) {
                    if ( value == null||value.isEmpty) {
                      isValid = false;
                    } else if (value.length < 4) {
                      isValid = false;
                    } else {
                      isValid = true;
                    }
                  },
                  validator: Validations.code,
                  errorText: !isValid? "Please Enter Valid Code !":null,
                  errorTextStyle: errorHintTextStyle,

                ),
                 SizedBox(
                  height: 10.h,
                ),
                 CountDown(onCount:  authProvider.reSendOTP,),

                SizedBox(
                  height: context.height * 0.07,
                ),
                CustomButton(
                    isLoading: authProvider.isLoading,
                    isError: authProvider.isError,
                    onTap: () {
                      if(formKey.currentState!.validate()) {
                        authProvider.sendOTP();
                      }
                    },
                    textColor: ColorResources.WHITE,
                    text: getTranslated("send_otp", context),
                    backgroundColor: ColorResources.PRIMARY),

              ],
            ),
          );
        }),
      ),
    );
  }
}
