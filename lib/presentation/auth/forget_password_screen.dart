import 'package:flutter/material.dart';
import 'package:hr_project/app/core/utils/media_query_values.dart';
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

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.BACKGROUND_COLOR,
      appBar: CustomAppBar(
        title:getTranslated("forget_password", context),
        titleCenter:true ,
      ),
      body: Padding(
        padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
        child: Column(
          children: [
            Text(getTranslated("please_enter_your_email_or_id", context),
                style: titleTextStyle.copyWith(color: Colors.black,fontSize: 13,)),
            Consumer<AuthProvider>(builder: (child, authProvider, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 35,
                  ),
                  Text(getTranslated("email_or_id", context),
                      style: titleTextStyle.copyWith(
                          color: ColorResources.primary)),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextFormField(
                    controller: authProvider.emailTEC,
                    hint: getTranslated(
                        "enter_your_email_or_id", context),
                    valid: Validations.email,
                  ),
                  SizedBox(
                    height: context.height * 0.1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                    child: CustomButton(
                        onTap: () {
                          authProvider.requestOTP(context);
                        },
                        textColor: ColorResources.whiteColor,
                        text: getTranslated("confirm", context),
                        backgroundColor: ColorResources.primary),
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
