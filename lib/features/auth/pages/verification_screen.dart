import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hr_project/app/core/extensions.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import '../../../app/core/color_resources.dart';
import '../../../app/core/constant.dart';
import '../../../app/core/dimensions.dart';
import '../../../app/localization/localization/language_constant.dart';
import '../../../components/count_down.dart';
import '../../../components/custom_app_bar.dart';
import '../../../components/custom_button.dart';
import '../provider/auth_provider.dart';

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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: PinCodeTextField(
                    length: 4,
                    appContext: context,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
                    animationType: AnimationType.slide,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      fieldHeight: 60,
                      fieldWidth: 60,
                      borderWidth: 1,
                      borderRadius:
                      BorderRadius.circular(Dimensions.RADIUS_SMALL),
                      selectedColor:ColorResources.PRIMARY,
                      selectedFillColor: Colors.white,
                      inactiveFillColor: ColorResources.FILL,
                      inactiveColor: ColorResources.PRIMARY.withOpacity(0.2),
                      activeColor: ColorResources.PRIMARY.withOpacity(0.2),
                      activeFillColor:
                      ColorResources.FILL,
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    backgroundColor: Colors.transparent,
                    enableActiveFill: true,
                    onChanged:  authProvider.updateOTP,
                    beforeTextPaste: (text) => true,
                  ),
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
                    text: getTranslated("submit", context),
                    backgroundColor: ColorResources.PRIMARY),

              ],
            ),
          );
        }),
      ),
    );
  }
}
