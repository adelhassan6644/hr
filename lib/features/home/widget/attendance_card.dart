import 'package:flutter/material.dart';
import 'package:hr_project/app/core/color_resources.dart';
import 'package:hr_project/app/core/utils/dimensions.dart';
import 'package:hr_project/app/core/utils/extensions.dart';
import 'package:provider/provider.dart';
import '../../../app/core/text_styles.dart';
import '../../../data/model/attendance_schedules_model.dart';
import '../../../navigation/custom_navigation.dart';
import '../../notifier/localization_provider.dart';

class AttendanceCard extends StatelessWidget {
  final Schedule schedule;
  const AttendanceCard({required this.schedule,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(vertical: 10.h,),
      child: Stack(
        children: [
          Container(
            width: context.width,
            height: 75.h,
            padding: const EdgeInsets.all(
                Dimensions.PADDING_SIZE_DEFAULT),
            decoration: BoxDecoration(
              color: ColorResources.FILL,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      schedule.start!.day1Format(),
                      style: AppTextStyles.w600
                          .copyWith(fontSize: 12),
                    ),
                    Row(
                      children: [
                        Text(
                          schedule.start!.time1Format(),
                          style: AppTextStyles.w600
                              .copyWith(fontSize: 12),
                        ),
                        Text(
                          "-",
                          style: AppTextStyles.w600
                              .copyWith(fontSize: 12),
                        ),
                        Text(
                          schedule.end!.time1Format(),
                          style: AppTextStyles.w600
                              .copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "${schedule.end!.difference(schedule.start!).inHours} Hours",
                      style: AppTextStyles.w600.copyWith(fontSize: 12, color: schedule.color),),
                    Text(
                      schedule.title.toString(),
                      style: AppTextStyles.w600.copyWith(fontSize: 12, color: schedule.color),),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: 5.h,
            height: 75.h,
            decoration: BoxDecoration(
              color:  schedule.color,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                      Provider.of<LocalizationProvider>(
                          CustomNavigator.scaffoldState
                              .currentContext!,
                          listen: false)
                          .isLtr
                          ? Dimensions.PADDING_SIZE_DEFAULT
                          : 0),
                  topRight:Radius.circular(
                      !Provider.of<LocalizationProvider>(
                          CustomNavigator.scaffoldState
                              .currentContext!,
                          listen: false)
                          .isLtr
                          ? Dimensions.PADDING_SIZE_DEFAULT
                          : 0),
                  bottomRight:Radius.circular(
                      !Provider.of<LocalizationProvider>(
                          CustomNavigator.scaffoldState
                              .currentContext!,
                          listen: false)
                          .isLtr
                          ? Dimensions.PADDING_SIZE_DEFAULT
                          : 0),
                  bottomLeft: Radius.circular(
                      Provider.of<LocalizationProvider>(
                          CustomNavigator.scaffoldState
                              .currentContext!,
                          listen: false)
                          .isLtr
                          ? Dimensions.PADDING_SIZE_DEFAULT
                          : 0)),
            ),
          ),
        ],
      ),
    );
  }
}
