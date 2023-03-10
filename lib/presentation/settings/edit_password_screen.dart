import 'package:flutter/material.dart';
import 'package:hr_project/app/core/utils/extensions.dart';
import 'package:hr_project/presentation/base/custom_app_bar.dart';
import 'package:provider/provider.dart';
import '../../app/core/utils/color_resources.dart';
import '../../app/core/utils/constant.dart';
import '../../app/core/utils/dimensions.dart';
import '../../app/core/utils/images.dart';
import '../../app/core/utils/validation.dart';
import '../../domain/localization/language_constant.dart';
import '../base/custom_button.dart';
import '../base/custom_text_form_field.dart';
import '../notifier/auth_provider.dart';

class EditPasswordScreen extends StatefulWidget {
  const EditPasswordScreen({Key? key}) : super(key: key);

  @override
  State<EditPasswordScreen> createState() => _EditPasswordScreenState();
}

class _EditPasswordScreenState extends State<EditPasswordScreen> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.BACKGROUND_COLOR,
      appBar: CustomAppBar(
        title:getTranslated("change_password", context),
        titleCenter:true ,
      ),
      body: Padding(
        padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
        child: ListView(
          children: [
            Consumer<AuthProvider>(builder: (child, authProvider, _) {
              return Form(
                key: key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                      tIcon: Images.lockIcon,
                      isValidat: key.currentState?.validate()??true,
                      controller: authProvider.passwordTEC,
                      hint: getTranslated(
                          "enter_your_password", context),
                      valid: Validations.password,
                      icon: Icons.lock_outline,
                      removePIcon: false, // remo
                    ),
                     SizedBox(
                      height: 25.h,
                    ),
                    Text(getTranslated("new_password", context),
                        style: titleTextStyle.copyWith(
                            color: ColorResources.PRIMARY)),
                     SizedBox(
                      height: 15.h,
                    ),
                    CustomTextFormField(
                      tIcon: Images.lockIcon,
                      isValidat: key.currentState?.validate()??true,
                      valid:  (String? value) {
                        if (value!.isEmpty) {
                          return  getTranslated ("required", context);
                        }else if(authProvider.passwordTEC.text.trim() ==  authProvider.newPasswordTEC.text.trim() ) {
                          return "you entered the same password please change it";
                        }else {
                          return null;
                        }
                      },
                      icon: Icons.lock_outline,
                      removePIcon: false, // removePIcon: true,
                      controller: authProvider.newPasswordTEC,
                      hint: getTranslated("enter_new_password", context),
                    ),
                     SizedBox(
                      height: 25.h,
                    ),
                    Text(getTranslated("confirm_password", context),
                        style: titleTextStyle.copyWith(
                            color: ColorResources.PRIMARY)),
                     SizedBox(
                      height: 15.h,
                    ),
                    CustomTextFormField(
                      tIcon: Images.lockIcon,
                      isValidat: key.currentState?.validate()??true,
                      valid: (String? value) {
                        if (value!.isEmpty) {
                          return  getTranslated ("required", context);
                        }else if(authProvider.confirmPasswordTEC.text.trim() !=  authProvider.newPasswordTEC.text.trim() ) {
                          return "The confirmation password doesn't match the new password";
                        }else {
                          return null;
                        }
                      },
                      icon: Icons.lock_outline,
                      removePIcon: false, // removePIcon: true,
                      controller: authProvider.confirmPasswordTEC,
                      hint: getTranslated(
                          "enter_new_password_again", context),
                    ),
                    SizedBox(
                      height: 35.h,
                    ),
                    Center(
                      child: CustomButton(
                          isLoading: authProvider.isLoading,
                          isError: authProvider.isError,
                          onTap: () {
                            key.currentState!.save();
                            if(key.currentState!.validate()) {
                              authProvider.updatePassword();
                            }

                          },
                          textColor: ColorResources.WHITE,
                          text: getTranslated("confirm", context),
                          backgroundColor: ColorResources.PRIMARY),
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
