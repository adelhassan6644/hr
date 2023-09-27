import 'package:flutter/material.dart';
import 'package:hr_project/app/core/color_resources.dart';
import 'package:hr_project/app/core/extensions.dart';
import '../../../app/core/dimensions.dart';
import '../../../app/core/text_styles.dart';
import '../model/schedules_model.dart';

class AttendanceCard extends StatelessWidget {
  final ScheduleModel schedule;
  const AttendanceCard({required this.schedule, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      margin: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_SMALL.h),
      padding: EdgeInsets.symmetric(
          vertical: Dimensions.PADDING_SIZE_DEFAULT.h,
          horizontal: Dimensions.PADDING_SIZE_DEFAULT.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: Colors.black54.withOpacity(0.2),
                blurRadius: 7.0,
                spreadRadius: -1,
                offset: const Offset(0, 2))
          ],
          gradient: LinearGradient(
              colors: [Styles.FILL_COLOR, schedule.color ?? Styles.PENDING],
              stops: const [0.98, 0.98])),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  schedule.start!.day1Format(),
                  style: AppTextStyles.w600.copyWith(fontSize: 12),
                ),
              ),
              Text(
                "${schedule.end!.difference(schedule.start!).inHours} Hours",
                style: AppTextStyles.w600
                    .copyWith(fontSize: 12, color: schedule.color),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Text(
                      schedule.start!.time1Format(),
                      style: AppTextStyles.w600.copyWith(fontSize: 12),
                    ),
                    Text(
                      "-",
                      style: AppTextStyles.w600.copyWith(fontSize: 12),
                    ),
                    Text(
                      schedule.end!.time1Format(),
                      style: AppTextStyles.w600.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ),
              Text(
                schedule.title.toString(),
                style: AppTextStyles.w600
                    .copyWith(fontSize: 12, color: schedule.color),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
