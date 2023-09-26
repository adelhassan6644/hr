import 'package:flutter/material.dart';
import 'package:hr_project/app/core/extensions.dart';
import 'package:hr_project/components/animated_widget.dart';
import 'package:hr_project/navigation/custom_navigation.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../app/core/color_resources.dart';
import '../../../app/core/dimensions.dart';
import '../../../app/localization/localization/language_constant.dart';
import '../../../components/custom_app_bar.dart';
import '../../../components/custom_button.dart';
import '../../../navigation/routes.dart';

class Salary extends StatelessWidget {
  const Salary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: getTranslated("salary_&_financial", context),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListAnimator(
              customPadding: EdgeInsets.symmetric(
                  horizontal: Dimensions.PADDING_SIZE_DEFAULT.w,
                  vertical: Dimensions.PADDING_SIZE_DEFAULT.h),
              data: [
                Container(
                  padding:
                      const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                  decoration: const BoxDecoration(
                    color: Styles.FILL_COLOR,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Row(
                    children: [
                      CircularPercentIndicator(
                        radius: 70.0,
                        lineWidth: 12.0,
                        percent: 0.2,
                        center: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "10217.50",
                              style: TextStyle(
                                fontSize: 16,
                                color: Styles.blackColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              getTranslated("sar", context),
                              style: const TextStyle(
                                fontSize: 16,
                                color: Styles.blackColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        progressColor: Styles.PRIMARY_COLOR,
                        backgroundColor: Styles.GOLD_COLOR,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            getTranslated("base_salary", context),
                            style: const TextStyle(
                                fontSize: 14,
                                color: Styles.PRIMARY_COLOR,
                                fontWeight: FontWeight.w500),
                          ),
                          const Text(
                            "5675.8",
                            style: TextStyle(
                                fontSize: 14,
                                color: Styles.grayColor,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            getTranslated("health_insurance", context),
                            style: const TextStyle(
                                fontSize: 14,
                                color: Styles.GOLD_COLOR,
                                fontWeight: FontWeight.w500),
                          ),
                          const Text(
                            "534.34",
                            style: TextStyle(
                                fontSize: 14,
                                color: Styles.grayColor,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            getTranslated("family_allowance", context),
                            style: const TextStyle(
                                fontSize: 14,
                                color: Styles.GOLD_COLOR,
                                fontWeight: FontWeight.w500),
                          ),
                          const Text(
                            "5675.8",
                            style: TextStyle(
                                fontSize: 14,
                                color: Styles.grayColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Text(getTranslated("salary_details", context),
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: Container(
                      padding: const EdgeInsets.all(
                          Dimensions.PADDING_SIZE_EXTRA_LARGE),
                      decoration: const BoxDecoration(
                        color: Styles.FILL_COLOR,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            DateTime.now().monthFormat(),
                            style: const TextStyle(
                                fontSize: 14,
                                color: Styles.blackColor,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomButton(
                            textColor: Styles.WHITE,
                            text: getTranslated("details", context),
                            backgroundColor: Styles.PRIMARY_COLOR,
                            onTap: () =>
                                CustomNavigator.push(Routes.SALARY_DETAILS),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomButton(
                              textColor: Styles.PRIMARY_COLOR,
                              text: getTranslated("download", context),
                              // icon: Icons.download,
                              backgroundColor: Styles.WHITE),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
