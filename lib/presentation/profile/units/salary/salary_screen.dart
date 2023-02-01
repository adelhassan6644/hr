import 'package:flutter/material.dart';
import 'package:hr_project/app/core/utils/extensions.dart';
import 'package:hr_project/presentation/base/custom_app_bar.dart';
import 'package:hr_project/presentation/base/custom_button.dart';
import 'package:hr_project/presentation/profile/units/salary/salary_details_screen.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../../app/core/utils/color_resources.dart';
import '../../../../app/core/utils/dimensions.dart';
import '../../../../domain/localization/language_constant.dart';

class SalaryScreen extends StatelessWidget {
  const SalaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleCenter: true,
        title: getTranslated("salary_&_financial", context),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
              decoration: const BoxDecoration(
                color: ColorResources.fillColor,
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
                            color: ColorResources.blackColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          getTranslated("sar", context),
                          style: const TextStyle(
                            fontSize: 16,
                            color: ColorResources.blackColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    progressColor: ColorResources.primary,
                    backgroundColor: ColorResources.goldColor,
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
                            color: ColorResources.primary,
                            fontWeight: FontWeight.w500),
                      ),
                      const Text(
                        "5675.8",
                        style: TextStyle(
                            fontSize: 14,
                            color: ColorResources.grayColor,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        getTranslated("health_insurance", context),
                        style: const TextStyle(
                            fontSize: 14,
                            color: ColorResources.goldColor,
                            fontWeight: FontWeight.w500),
                      ),
                      const Text(
                        "534.34",
                        style: TextStyle(
                            fontSize: 14,
                            color: ColorResources.grayColor,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        getTranslated("family_allowance", context),
                        style: const TextStyle(
                            fontSize: 14,
                            color: ColorResources.goldColor,
                            fontWeight: FontWeight.w500),
                      ),
                      const Text(
                        "5675.8",
                        style: TextStyle(
                            fontSize: 14,
                            color: ColorResources.grayColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(getTranslated("salary_details", context),
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                )),
            Container(
                padding:
                    const EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_LARGE),
                decoration: const BoxDecoration(
                  color: ColorResources.fillColor,
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
                          color: ColorResources.blackColor,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      textColor: ColorResources.whiteColor,
                      text: getTranslated("details", context),
                      backgroundColor: ColorResources.primary,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const SalaryDetailsScreen()));
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                        textColor: ColorResources.primary,
                        text: getTranslated("download", context),
                        icon: Icons.download,
                        backgroundColor: ColorResources.whiteColor),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
