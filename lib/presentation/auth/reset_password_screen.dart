import 'package:flutter/material.dart';
import 'package:hr_project/app/core/utils/extensions.dart';
import 'package:hr_project/presentation/base/custom_app_bar.dart';
import 'package:provider/provider.dart';
import '../../app/core/utils/color_resources.dart';
import '../../app/core/utils/constant.dart';
import '../../app/core/utils/dimensions.dart';
import '../../app/core/utils/validation.dart';
import '../../domain/localization/language_constant.dart';
import '../base/custom_button.dart';
import '../base/custom_text_form_field.dart';
import '../notifier/auth_provider.dart';


class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.BACKGROUND_COLOR,
      appBar: CustomAppBar(
        title:getTranslated("reset_password", context),
        titleCenter:true ,
      ),
      body: Padding(
        padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
        child: Column(
          children: [
            Consumer<AuthProvider>(builder: (child, authProvider, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 35,
                  ),
                  Text(getTranslated("new_password", context),
                      style: titleTextStyle.copyWith(
                          color: ColorResources.PRIMARY)),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextFormField(
                    controller: authProvider.newPasswordTEC,
                    hint: getTranslated(
                        "enter_new_password", context),
                    valid: Validations.password,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(getTranslated("confirm_password", context),
                      style: titleTextStyle.copyWith(
                          color: ColorResources.PRIMARY)),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextFormField(
                    controller: authProvider.confirmPasswordTEC,
                    hint: getTranslated(
                        "enter_new_password_again", context),
                    valid: Validations.password,
                  ),
                  SizedBox(
                    height: context.height * 0.1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                    child: CustomButton(
                        onTap: () {
                          authProvider.resetPassword(context: context);
                        },
                        textColor: ColorResources.WHITE,
                        text: getTranslated("confirm", context),
                        backgroundColor: ColorResources.PRIMARY),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
