import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yusrPlus/features/forced_attendance_form/provider/forced_attendance_form_provider.dart';
import 'package:yusrPlus/features/forced_attendance_form/repo/forced_attendance_form_repo.dart';

import '../../../app/localization/language_constant.dart';
import '../../../components/confirmation_dialog.dart';
import '../../../components/custom_app_bar.dart';
import '../../../components/custom_simple_dialog.dart';
import '../../../data/config/di.dart';
import '../../../navigation/custom_navigation.dart';
import '../widget/forced_attendance_form_body.dart';
import '../widget/forced_attendance_submit.dart';

class ForcedAttendanceForm extends StatelessWidget {
  const ForcedAttendanceForm({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>
          ForcedAttendanceFormProvider(repo: sl<ForcedAttendanceFormRepo>()),
      child: WillPopScope(
        onWillPop: () async {
          Future.delayed(
            Duration.zero,
            () => CustomSimpleDialog.parentSimpleDialog(
              customListWidget: [
                ConfirmationDialog(
                  title: getTranslated(
                      "confirm_exit_from_forced_attendance_title", context),
                  description: getTranslated(
                      "confirm_exit_from_forced_attendance_description",
                      context),
                  onContinue: () {
                    CustomNavigator.pop();
                    CustomNavigator.pop();
                  },
                )
              ],
            ),
          );
          return false;
        },
        child: Scaffold(
          appBar: CustomAppBar(
            title: getTranslated("check_in_attendance", context),
            canBack: false,
          ),
          body: const ForcedAttendanceFormBody(),
          bottomNavigationBar: ForcedAttendanceSubmit(id: id),
        ),
      ),
    );
  }
}
