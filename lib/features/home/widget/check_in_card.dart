import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:yusrPlus/app/core/extensions.dart';
import 'package:yusrPlus/app/core/text_styles.dart';
import 'package:yusrPlus/components/custom_images.dart';
import 'package:yusrPlus/components/shimmer/custom_shimmer.dart';
import 'package:provider/provider.dart';

import '../../../app/core/color_resources.dart';
import '../../../app/core/dimensions.dart';
import '../../../app/core/images.dart';
import '../../../app/localization/language_constant.dart';
import '../../../data/config/di.dart';
import '../provider/home_provider.dart';

class CheckInCard extends StatefulWidget {
  const CheckInCard({Key? key}) : super(key: key);

  @override
  State<CheckInCard> createState() => _CheckInCardState();
}

class _CheckInCardState extends State<CheckInCard> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () => sl<HomeProvider>().checkOnSchedule());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
      child: Consumer<HomeProvider>(builder: (context, provider, _) {
        return !provider.isLoading
            ? Container(
                padding: EdgeInsets.symmetric(
                    vertical: Dimensions.PADDING_SIZE_DEFAULT.h,
                    horizontal: Dimensions.PADDING_SIZE_DEFAULT.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Styles.FILL_COLOR),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            DateTime.now().dataMainFormat(),
                            style: const TextStyle(
                                color: Styles.disabledColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Text(
                          DateTime.now().dayFormat(),
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    provider.closestSchedule != null
                        ? Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ///Title
                                    // Text(
                                    //   (provider.closestSchedule?.attendedAt != null&&provider.closestSchedule?.leavingAt != null)
                                    //       ? getTranslated(
                                    //           "check_in_leaving", context)
                                    //       : getTranslated(
                                    //           "check_in_attendance", context),
                                    //   style: const TextStyle(
                                    //       color: Styles.PRIMARY_COLOR,
                                    //       fontWeight: FontWeight.w800,
                                    //       fontSize: 14),
                                    // ),

                                    ///Time of now
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 1.0),
                                      child: Text(
                                        DateTime.now().timeFormat(),
                                        style: const TextStyle(
                                            color: Styles.blackColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    if (provider.closestSchedule?.attendedAt ==
                                        null)
                                      RichText(
                                        text: TextSpan(
                                          text:
                                              '${getTranslated(("work_start_at"), context)} ',
                                          style: AppTextStyles.w500.copyWith(
                                              fontSize: 16,
                                              color: Styles.hintColor),
                                          children: [
                                            TextSpan(
                                              text: (provider.closestSchedule
                                                          ?.start)
                                                      ?.timeFormat() ??
                                                  "",
                                              style: AppTextStyles.w700
                                                  .copyWith(
                                                      fontSize: 16,
                                                      color:
                                                          Styles.PRIMARY_COLOR),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (provider.closestSchedule?.leavingAt ==
                                        null)
                                      RichText(
                                        text: TextSpan(
                                          text:
                                              '${getTranslated(("work_end_at"), context)} ',
                                          style: AppTextStyles.w500.copyWith(
                                              fontSize: 16,
                                              color: Styles.hintColor),
                                          children: [
                                            TextSpan(
                                              text: (provider.closestSchedule
                                                          ?.start)
                                                      ?.timeFormat() ??
                                                  "",
                                              style: AppTextStyles.w700
                                                  .copyWith(
                                                      fontSize: 16,
                                                      color:
                                                          Styles.PRIMARY_COLOR),
                                            ),
                                          ],
                                        ),
                                      ),

                                    ///Is Attended / Leaving At
                                    if (provider.closestSchedule?.attendedAt !=
                                        null)
                                      RichText(
                                        text: TextSpan(
                                          text:
                                              '${getTranslated(((provider.closestSchedule?.attendedAt != null && provider.closestSchedule?.leavingAt != null) ? "check_in_leaving_at" : "check_in_attendance_at"), context)} ',
                                          style: AppTextStyles.w500.copyWith(
                                              fontSize: 16,
                                              color: Styles.hintColor),
                                          children: [
                                            TextSpan(
                                              text: ((provider.closestSchedule
                                                                      ?.attendedAt !=
                                                                  null &&
                                                              provider.closestSchedule
                                                                      ?.leavingAt !=
                                                                  null)
                                                          ? provider
                                                              .closestSchedule
                                                              ?.leavingAt
                                                          : provider
                                                              .closestSchedule
                                                              ?.attendedAt)
                                                      ?.timeFormat() ??
                                                  "",
                                              style: AppTextStyles.w700
                                                  .copyWith(
                                                      fontSize: 16,
                                                      color:
                                                          Styles.PRIMARY_COLOR),
                                            ),
                                          ],
                                        ),
                                      )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              InkWell(
                                onTap: () => provider.checkIn(),
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Styles.PRIMARY_COLOR.withOpacity(.1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    children: [
                                      const Icon(
                                        Icons.fingerprint,
                                        color: Styles.PRIMARY_COLOR,
                                        size: 40,
                                      ),
                                      Text(
                                        getTranslated("check_now", context),
                                        style: const TextStyle(
                                            color: Styles.PRIMARY_COLOR,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              customImageIcon(
                                  imageName: Images.rest,
                                  height: 50,
                                  width: 50),
                              Text(
                                getTranslated("rest_header", context),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Styles.PRIMARY_COLOR,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 14),
                              ),
                            ],
                          )
                  ],
                ),
              ).animate().slide()
            : CustomShimmerContainer(
                height: 150.h,
                radius: 12,
              );
      }),
    );
  }
}
