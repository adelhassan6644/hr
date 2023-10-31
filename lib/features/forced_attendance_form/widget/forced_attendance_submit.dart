import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yusrPlus/app/core/dimensions.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import 'package:yusrPlus/features/forced_attendance_form/provider/forced_attendance_form_provider.dart';

import '../../../app/core/app_snack_bar.dart';
import '../../../app/core/color_resources.dart';
import '../../../app/localization/language_constant.dart';
import '../../../components/custom_button.dart';

class ForcedAttendanceSubmit extends StatelessWidget {
  const ForcedAttendanceSubmit({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return Consumer<ForcedAttendanceFormProvider>(
        builder: (_, provider, child) {
      return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.PADDING_SIZE_DEFAULT.w,
            vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
        child: CustomButton(
          onTap: () {
            if (provider.image != null) {
              provider.checkIn(id);
            } else {
              CustomSnackBar.showSnackBar(
                  notification: AppNotification(
                      message: getTranslated("you_must_pick_image", context),
                      isFloating: true,
                      backgroundColor: Styles.ACTIVE,
                      borderColor: Styles.transparentColor));
            }
          },
          text: getTranslated("check_in", context),
        ),
      );
    });
  }
}
