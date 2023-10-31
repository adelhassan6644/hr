import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import 'package:yusrPlus/app/localization/language_constant.dart';
import '../../navigation/custom_navigation.dart';
import '../app/core/color_resources.dart';
import '../app/core/images.dart';
import '../app/core/text_styles.dart';
import 'custom_button.dart';
import 'custom_images.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog(
      {this.txtBtn,
      this.txtBtn2,
      this.icon,
      this.description,
      this.title,
      this.onContinue,
      super.key});

  final void Function()? onContinue;
  final String? title, description, txtBtn, txtBtn2;
  final String? icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ///Icon
        customImageIcon(
            imageName: (icon ?? Images.alert), height: 70, width: 70),
        SizedBox(height: 16.h),

        ///Title
        Visibility(
          visible: title != null,
          child: Text(
            title ?? "",
            textAlign: TextAlign.center,
            style: AppTextStyles.w700
                .copyWith(fontSize: 16, color: Styles.PRIMARY_COLOR),
          ),
        ),
        Visibility(
          visible: title != null,
          child: SizedBox(
            height: 16.h,
          ),
        ),

        ///Description
        Visibility(
          visible: description != null,
          child: Text(
            description ?? "",
            textAlign: TextAlign.center,
            style: AppTextStyles.w500.copyWith(
              fontSize: 14,
            ),
          ),
        ),
        SizedBox(height: 24.h),

        ///Buttons Action
        Row(
          children: [
            Expanded(
                child: CustomButton(
              onTap: onContinue,
              text: txtBtn ?? getTranslated("confirm", context),
            )),
            SizedBox(
              width: 16.w,
            ),
            Expanded(
                child: CustomButton(
              onTap: () => CustomNavigator.pop(),
              text: txtBtn2 ?? getTranslated("get_back", context),
              backgroundColor: Styles.PRIMARY_COLOR.withOpacity(0.1),
              textColor: Styles.PRIMARY_COLOR,
            ))
          ],
        )
      ],
    );
  }
}
