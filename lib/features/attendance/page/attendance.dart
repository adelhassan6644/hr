import 'package:flutter/material.dart';
import 'package:yusrPlus/app/core/color_resources.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import 'package:yusrPlus/components/animated_widget.dart';
import 'package:yusrPlus/components/empty_widget.dart';
import 'package:yusrPlus/components/shimmer/custom_shimmer.dart';
import 'package:yusrPlus/features/attendance/provider/attendance_provider.dart';
import 'package:provider/provider.dart';
import '../../../app/core/dimensions.dart';
import '../../../app/localization/language_constant.dart';
import '../../../components/custom_app_bar.dart';
import '../../../components/loader_view.dart';
import '../../../data/config/di.dart';
import '../widget/attendance_card.dart';
import '../widget/calender_widget.dart';

class Attendance extends StatefulWidget {
  const Attendance({Key? key}) : super(key: key);

  @override
  State<Attendance> createState() => _AttendanceLeavingScreen();
}

class _AttendanceLeavingScreen extends State<Attendance> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      sl<AttendanceProvider>().getEmployeeSchedule();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Styles.BACKGROUND_COLOR,
        appBar:
            CustomAppBar(title: getTranslated("attendance_leaving", context)),
        body: Consumer<AttendanceProvider>(builder: (_, provider, child) {
          return provider.isLoading
              ? const LoaderView()
              : Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.PADDING_SIZE_DEFAULT.w),
                  child: Column(
                    children: [
                      ///Calender
                      const Expanded(child: CalenderWidget()),

                      ///Schedules
                      Expanded(
                        child: provider.isGetting
                            ? ListAnimator(
                                data: [
                                  ...List.generate(
                                    provider.daySchedules.length,
                                    (index) => CustomShimmerContainer(
                                      height: 75.h,
                                      radius: 10,
                                    ),
                                  ),
                                  SizedBox(height: 80.h),
                                ],
                              )
                            : !provider.isGetting &&
                                    provider.daySchedules.isNotEmpty
                                ? ListAnimator(data: [
                                    ...List.generate(
                                      provider.daySchedules.length,
                                      (index) => AttendanceCard(
                                        schedule: provider.daySchedules[index],
                                      ),
                                    ),
                                    SizedBox(height: 80.h),
                                  ])
                                : ListAnimator(
                                    data: [
                                      EmptyState(
                                        txt: getTranslated(
                                            "there_is_no_schedules", context),
                                      ),
                                      SizedBox(height: 80.h),
                                    ],
                                  ),
                      )
                    ],
                  ),
                );
        }));
  }
}
