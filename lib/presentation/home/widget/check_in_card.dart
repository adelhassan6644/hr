import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hr_project/app/core/utils/extensions.dart';
import 'package:hr_project/presentation/notifier/attendance_provider.dart';
import 'package:provider/provider.dart';

import '../../../app/core/utils/color_resources.dart';
import '../../../app/core/utils/dimensions.dart';
import '../../../domain/localization/language_constant.dart';

class CheckInCard extends StatelessWidget {
  const CheckInCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_LARGE,horizontal:  Dimensions.RADIUS_DEFAULT,),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(Dimensions.RADIUS_DEFAULT)),
          color: ColorResources.FILL_COLOR),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateTime.now().dataMainFormat(),
                style: const TextStyle(
                    color: ColorResources.disabledColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                DateTime.now().dayFormat(),
                style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      getTranslated(
                          "check_in_attendance_leaving", context),
                      style: const TextStyle(
                          color: ColorResources.hintColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_SMALL),
                      child: Text(
                        DateTime.now().timeFormat(),
                        style: const TextStyle(
                            color: ColorResources.blackColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text(
                      getTranslated("Checked_in_at", context),
                      style: const TextStyle(
                          color: ColorResources.hintColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    ),
                  ],
                ),
              ),
              Consumer<AttendanceProvider>(
                  builder: (context,notifier,_) {
                    return InkWell(
                      onTap: ()=> notifier.handleLocationPermission(),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: ColorResources.PRIMARY.withOpacity(.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.fingerprint,
                              color: ColorResources.PRIMARY,
                              size: 40,
                            ),
                            Text(
                              getTranslated("check_now", context),
                              style: const TextStyle(
                                  color: ColorResources.PRIMARY,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
              ),
            ],
          )
        ],
      ),
    ).animate().slide();
  }
}
