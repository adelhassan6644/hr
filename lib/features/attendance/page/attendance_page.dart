import 'package:flutter/material.dart';
import 'package:hr_project/app/core/color_resources.dart';
import 'package:hr_project/app/core/extensions.dart';
import 'package:hr_project/components/animated_widget.dart';
import 'package:hr_project/components/empty_widget.dart';
import 'package:hr_project/components/shimmer/custom_shimmer.dart';
import 'package:hr_project/features/attendance/provider/attendance_provider.dart';
import 'package:provider/provider.dart';
import '../../../app/core/dimensions.dart';
import '../../../app/localization/localization/language_constant.dart';
import '../../../components/custom_app_bar.dart';
import '../widget/attendance_card.dart';
import '../widget/calender_widget.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({Key? key}) : super(key: key);

  @override
  State<AttendancePage> createState() => _AttendanceLeavingScreen();
}

class _AttendanceLeavingScreen extends State<AttendancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Styles.BACKGROUND_COLOR,
        appBar:
            CustomAppBar(title: getTranslated("attendance_leaving", context)),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.PADDING_SIZE_DEFAULT.w),
          child: Column(
            children: [
              ///Calender
              const CalenderWidget(),

              ///Schedules
              Consumer<AttendanceProvider>(builder: (_, provider, child) {
                return Expanded(
                  child: provider.isGetting
                      ? ListAnimator(
                          data: List.generate(
                            provider.daySchedules.length,
                            (index) => CustomShimmerContainer(
                              height: 75.h,
                              radius: 10,
                            ),
                          ),
                        )
                      : !provider.isGetting && provider.daySchedules.isNotEmpty
                          ? ListAnimator(
                              data: List.generate(
                                provider.daySchedules.length,
                                (index) => AttendanceCard(
                                  schedule: provider.daySchedules[index],
                                ),
                              ),
                            )
                          : ListAnimator(
                              data: [
                                EmptyState(
                                  txt: getTranslated(
                                      "there_is_no_schedules", context),
                                ),
                              ],
                            ),
                );
              }),
            ],
          ),
        ));
  }
}
